//
//  AppetizerDetailView.swift
//  MIFood
//
//  Created by Илья Морозов on 13.03.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding  var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 20) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
                .padding()
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
//                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
            }
            .modifier(StandartButtonStyle())
            .padding()
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismisButton()
        }, alignment: .topTrailing)
    }
    
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}


struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 7) {
            Text(title)
                .foregroundStyle(.secondary)
                .fontWeight(.bold)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
