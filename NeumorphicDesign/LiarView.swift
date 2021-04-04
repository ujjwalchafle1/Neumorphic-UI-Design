//
//  LiarView.swift
//  NeumorphicDesign
//
//  Created by Ujjwal on 04/04/2021.
//

import SwiftUI

struct LiarView: View {
  
  @State var buttonsArray = ["thermometer.sun", "thermometer.sun.fill", "thermometer.snowflake", "thermometer"]
  
    var body: some View {
      ZStack
      {
        Color.lairBackgroundGray.edgesIgnoringSafeArea(.all)
        
        ScrollView(.horizontal, showsIndicators: false)
        {
          HStack
          {
            ForEach(buttonsArray, id: \.self) { button in
              LinearGradient.lairHorizontalDark
                .mask(ButtonView(imageName: button))
                .frame(width: 200, height: 250)
                .padding(20)
                .font(.system(size: 150, weight: .thin))
                .shadow(color: .white, radius: 2, x: -3, y: -3)
                .shadow(color: .lairShadowGray, radius: 2, x: 3, y: 3)
                
                .overlay(
                  RoundedRectangle(cornerRadius: 15)
                    .stroke(LinearGradient.lairDiagonalDarkBorder, lineWidth: 2)
                )
                .background(Color.lairBackgroundGray)
                .cornerRadius(15)
                
                .shadow(
                  color: Color(white: 1.0).opacity(0.9),
                  radius: 18,
                  x: -18,
                  y: -18)
                .shadow(
                  color: Color.lairShadowGray.opacity(0.5),
                  radius: 14,
                  x: 14,
                  y: 14)
                
                .padding(.all, 20)
            }
            
          }
          Spacer()
        }
      }
    }
}

struct LiarView_Previews: PreviewProvider {
    static var previews: some View {
        LiarView()
    }
}
