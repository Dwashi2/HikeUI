//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Daniel Washington Ignacio on 28/10/23.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: - 3. DEPTH
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: - 2. LIGHT
            
            Color.customGreenLigth
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
            // MARK: - 1. SURFACE
            
            LinearGradient(colors: [
                Color.customGreenLigth,
                Color.customGreenMedium],
                           startPoint: .top,
                           endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
