//
//  CardView.swift
//  Hike
//
//  Created by Daniel Washington Ignacio on 28/10/23.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShoingSheet: Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        print(" -- The button was pressed")
        print("status: old image number = \(imageNumber)")
        
        repeat {
            print("Action: Random number generated = \(randomNumber)")
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
        print("Result: new image number = \(imageNumber)")
        print("-- END --")
        print("\n")
    }
    
    
    var body: some View {
        // MARK: - CARD
        
        ZStack {
            CustomBackgroundView()
           
            VStack {
                // MARK: - HEADER
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight,
                                    .customGrayMedium],
                                               startPoint: .top,
                                           endPoint: .bottom)
                        )
                        Spacer()
                        Button {
                            // ACTION: Show a Sheet
                            print("the button was pressed")
                            isShoingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShoingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                
                ZStack {
                    CustomCircleView()
                    
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                // MARK: - FOOTER
                
                Button{
                    // ACTION: Generate a radom number
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLigth, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }//: VSTACK
        }//: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
