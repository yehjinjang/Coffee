//
//  OrderSummaryView.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import SwiftUI

struct OrderSummaryView: View {
    @EnvironmentObject var cartViewModel: CartViewModel

    var totalPrice: Int {
        cartViewModel.items.reduce(0) { $0 + $1.drink.price * $1.quantity }
    }

    var body: some View {
        VStack {
//            Text("주문 목록")
//                .font(.largeTitle)
//                .padding()

            // 주문한 목록 표시
            List(cartViewModel.items) { item in
                HStack {
                    Text("\(item.drink.name)\(item.quantity)개")
                    Spacer()
                    Text("₩\(item.drink.price * item.quantity)")
                        .foregroundColor(.gray)
                }
            }

            // 총액 표시
            Text("총액: \(totalPrice)원")
                .font(.title2)
                .padding()

            // 결제하기 버튼
            NavigationLink(destination: PaymentView().environmentObject(cartViewModel)) {
                Text("결제하기")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("주문 확인")
    }
}

