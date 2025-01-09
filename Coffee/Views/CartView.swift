//
//  CartView.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            if cartViewModel.items.isEmpty {
                Text("장바구니가 비어 있습니다.")
                    .font(.title2)
            } else {
                List {
                    ForEach(cartViewModel.items) { item in
                        VStack(alignment: .leading) {
                            Text("\(item.drink.name) x\(item.quantity)")
                            Text("가격: \(item.drink.price * item.quantity)원")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Text("총 가격: \(cartViewModel.totalPrice)원")
                    .font(.title)
                    .padding()
                
                Button("주문하기") {
                    // 주문 로직 추가
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("장바구니")
    }
}


#Preview {
    CartView()
}
