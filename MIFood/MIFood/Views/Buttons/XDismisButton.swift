//
//  XDismisButton.swift
//  MIFood
//
//  Created by Илья Морозов on 13.03.2025.
//

import SwiftUI

struct XDismisButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.7))
            .tint(.secondary)
            .clipShape(Circle())
            .padding(.trailing, 7)
            .padding(.top, 7)
    }
}

#Preview {
    XDismisButton()
}
