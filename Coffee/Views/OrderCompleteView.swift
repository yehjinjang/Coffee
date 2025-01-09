//
//  OrderCompleteView.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import SwiftUI

struct OrderCompleteView: View {
    let orderNumber: Int
    let menuNames: [String]

    var body: some View {
        VStack(spacing: 20) {
            Text("주문 번호 \(orderNumber)번")
                .font(.largeTitle)
                .padding()

            // 음료 강조
            VStack {
                Text("주문하신 ")
                    .font(.title3) +
                Text(menuNames.joined(separator: ", "))
                    .font(.title3)
                    .bold() +
                Text(" 준비되었습니다.")
                    .font(.title3)
            }
            .multilineTextAlignment(.center)
            .padding()

            Button("처음으로 돌아가기") {
                // 메인 화면으로 돌아가는 로직
            }
            .frame(height: 50)
            .padding(.horizontal, 20)
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("주문 완료")
    }
}

