//
//  APButton.swift
//  MIFood
//
//  Created by Илья Морозов on 13.03.2025.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Button {
            
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 250, height: 50)
                .background(.brandPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
    }
}

#Preview {
    APButton(title: "Joga bonito")
}
