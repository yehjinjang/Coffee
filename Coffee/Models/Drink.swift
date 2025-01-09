//
//  Drink.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import Foundation

struct Drink: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let description: String
    let imageName: String
    var stock: Int
}


struct OrderItem : Identifiable {
    let id = UUID()
    let drink: Drink
    let isHot: Bool
    let shot: String
    let sweetness: Int
    let quantity: Int
}
