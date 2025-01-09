//
//  DrinkSelectionView.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import SwiftUI

struct DrinkSelectionView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var navigateToOrderSummary = false
    @State private var showModal = false // 모달 표시 상태

    
    let drinks = [
        Drink(name: "아메리카노", price: 5000, description: "깊고 풍부한 에스프레소 맛의 아메리카노", imageName: "americano",stock:10),
        Drink(name: "카페라떼", price: 5500, description: "부드럽고 고소한 카페라떼", imageName: "cafe_latte",stock:10),
        Drink(name: "모카라테", price: 6500, description: "달콤한 초콜릿 향이 가득한 모카라테", imageName: "mocha",stock:0),
        Drink(name: "새싹 아인슈페너", price: 8000, description: "크리미한 크림과 함께 새싹이 느껴지는 아인슈페너", imageName: "einspanner",stock:10),
        Drink(name: "짭허블", price: 6500, description: "상큼한 허브티를 베이스로 한 짭허블", imageName: "herbal", stock:10),
        Drink(name: "오렌지 주스", price: 7000, description: "신선한 오렌지를 사용한 건강한 주스", imageName: "orange_juice",stock:10),
        Drink(name: "사과주스", price: 7000, description: "달콤한 사과로 만든 과일 주스", imageName: "apple_juice",stock:10),
        Drink(name: "딸기 주스", price: 7000, description: "신선한 딸기를 담은 달콤한 주스", imageName: "strawberry_juice",stock:10)
    ]



    var body: some View {
        VStack {
            // 음료 리스트
            List(drinks) { drink in
                NavigationLink(
                    destination: DrinkOptionView(drink: drink)
                        .environmentObject(cartViewModel)
                ) {
                    HStack {
                        Image(drink.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(drink.name)
                                .font(.headline)
                            Text(drink.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("\(drink.price)원")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                        Spacer()
                        if drink.stock == 0 {
                            Text("Sold Out")
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                }
                .disabled(drink.stock == 0) // 재고가 없으면 선택 불가
            }
            .navigationTitle("음료 선택")

            // 최근 주문 목록
            if !cartViewModel.items.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("최근 주문")
                        .font(.headline)
                        .padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(cartViewModel.items.suffix(3)) { item in
                                VStack(alignment: .leading) {
                                    Text("\(item.drink.name) x\(item.quantity)")
                                        .font(.subheadline)
                                    Text("₩\(item.drink.price * item.quantity)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }

            // Spacer로 버튼을 하단에 배치
            Spacer()

            // 하단의 넓은 주문하기 버튼
            NavigationLink(destination: OrderSummaryView().environmentObject(cartViewModel), isActive: $navigateToOrderSummary) {
                Button(action: {
                    navigateToOrderSummary = true
                }) {
                    Text("주문하기")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}


#Preview {
    DrinkSelectionView()
}
