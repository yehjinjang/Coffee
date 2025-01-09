//
//  ContentView.swift
//  Coffee
//
//  Created by 장예진 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var cartViewModel = CartViewModel()
    @State private var isDineIn: Bool? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Text("주문방법을 선택해주세요")
                    .font(.title)
                
                HStack {
                    Button("매장 식사") {
                        isDineIn = true
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                    Button("포장") {
                        isDineIn = false
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(
                    destination: DrinkSelectionView()
                        .environmentObject(cartViewModel),
                    isActive: .constant(isDineIn != nil)
                ) {
                    EmptyView()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
