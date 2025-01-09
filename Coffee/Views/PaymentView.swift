//
//  PaymentView.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import SwiftUI

struct PaymentView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var phoneNumber = ""
    @State private var paymentMethod = "간편결제"
    @State private var isReceiptAlertPresented = false
    @State private var navigateToOrderComplete = false
    @State private var orderNumber = Int.random(in: 1...100)

    var totalPrice: Int {
        cartViewModel.items.reduce(0) { $0 + $1.drink.price * $1.quantity }
    }

    var body: some View {
        VStack(spacing: 20) {
            // 총 가격 표시
            Text("총액: \(totalPrice)원")
                .font(.title)
                .padding()

            // 포인트 적립
            VStack(alignment: .leading) {
                Text("포인트 적립 (전화번호 입력)")
                TextField("010-XXXX-XXXX 형식", text: $phoneNumber)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.phonePad)
            }
            .padding()

            // 결제 방식 선택 (SegmentedPicker 스타일 조정)
            VStack(alignment: .leading, spacing: 10) {
                Text("결제 방식")
                    .font(.headline)
                Picker("결제 방식", selection: $paymentMethod) {
                    Text("간편결제").tag("간편결제")
                    Text("신용카드").tag("신용카드")
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(height: 50)
                .padding(.horizontal)
            }
            .padding()

            Spacer()

            // 결제 완료 버튼 (하단에 넓게 배치)
            Button("결제 완료") {
                isReceiptAlertPresented = true
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .padding(.horizontal, 20)
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.bottom, 20) // 하단 여백 추가

            // 숨겨진 네비게이션 링크
            NavigationLink(
                destination: OrderCompleteView(orderNumber: orderNumber, menuNames: cartViewModel.items.map { $0.drink.name }),
                isActive: $navigateToOrderComplete
            ) {
                EmptyView()
            }
        }
        .navigationTitle("결제 하기") // Navigation 제목 수정
        .alert("영수증을 출력하시겠습니까?", isPresented: $isReceiptAlertPresented) {
            Button("네") { navigateToOrderComplete = true }
            Button("아니요", role: .cancel) { navigateToOrderComplete = true }
        }
    }
}
