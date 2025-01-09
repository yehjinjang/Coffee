//
//  DrinkOptionView.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import SwiftUI

struct DrinkOptionView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    let drink: Drink

    @State private var isHot = true // true: 핫, false: 아이스
    @State private var shot = "일반"
    @State private var sweetness = 50
    @State private var quantity = 1
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            // 핫/아이스 선택: 조건부로 Segmented Control 또는 Only Ice 표시
            if ["아메리카노", "카페라떼", "모카라테"].contains(drink.name) {
                Picker("온도 선택", selection: $isHot) {
                    Text("핫").tag(true)
                    Text("아이스").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            } else {
                Text("Only Ice")
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding()
            }

            // 샷 강도 옵션 조건부 표시
            if ["아메리카노", "카페라떼", "모카라테", "새싹 아인슈페너"].contains(drink.name) {
                Picker("샷 강도", selection: $shot) {
                    Text("연하게 (1shot)").tag("연하게")
                    Text("일반 (default)").tag("일반")
                    Text("진하게 (3shot)").tag("진하게")
                }
            }

            Picker("당도", selection: $sweetness) {
                Text("0%").tag(0)
                Text("30%").tag(30)
                Text("50% (default)").tag(50)
                Text("100%").tag(100)
            }

            Stepper("수량: \(quantity)", value: $quantity, in: 1...10)

            Button("선택 완료") {
                let newItem = OrderItem(
                    drink: drink,
                    isHot: isHot,
                    shot: shot,
                    sweetness: sweetness,
                    quantity: quantity
                )
                cartViewModel.addItem(newItem)
                presentationMode.wrappedValue.dismiss() // 이전 화면으로 돌아가기
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .navigationTitle(drink.name)
    }
}

