//
//  OrderItem.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import Foundation

struct OrderItem : Identifiable {
    let id = UUID()
    let drink: Drink
    let isHot: Bool
    let strength: String
    let sweetness: Int
    let quantity: Int
}
