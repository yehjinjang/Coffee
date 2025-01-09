//
//  CareViewModel.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var items: [OrderItem] = []
    
    var totalPrice: Int {
        items.reduce(0) { $0 + $1.drink.price * $1.quantity }
    }
    
    func addItem(_ item: OrderItem) {
        items.append(item)
    }
    
    func removeItem(_ item: OrderItem) {
        items.removeAll { $0.id == item.id }
    }
}
