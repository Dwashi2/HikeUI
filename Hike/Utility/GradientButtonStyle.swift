//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Daniel Washington Ignacio on 28/10/23.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement with Ternary Conditional Operator
                // Condition ? A : B
                
                configuration.isPressed ?
                // A: When  user pressed the Button
                LinearGradient(colors: [.customGrayMedium,.customGrayLight], startPoint: .top, endPoint: .bottom) :
                
                    // B: When button is not pressed
                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
