//
//  TabBarItem.swift
//  NeumorphicDesign
//
//  Created by Ujjwal on 03/04/2021.
//

import SwiftUI

struct TabBarItem: View {
  
  
  @Binding var selectedItem: SmartView
  
  let size: CGFloat = 32

  let uuid = UUID()
  var smartView: SmartView
  var icon: String
  
  func isSelected() -> Bool {
    return selectedItem == smartView
  }
  
  var buttonUp: some View {
    
    var buttonMask: some View {
      ZStack
      {
        Rectangle()
          .foregroundColor(.white)
          .frame(width: size * 2, height: size * 2)
        
        Image(systemName:  self.icon)
          .resizable()
          .scaledToFit()
          .frame(width: size, height: size)
      }
    }
    
    var button: some View {
      // 2
      ZStack {
        LinearGradient.lairHorizontalDarkReverse
          .frame(width: size, height: size)
        // 3
        Rectangle()
          .inverseMask(buttonMask)
          .frame(width: size * 2, height: size * 2)
          .foregroundColor(.lairBackgroundGray)
          .shadow(color: .lairShadowGray, radius: 3, x: 3, y: 3)
          .shadow(color: .white, radius: 3, x: -3, y: -3)
          .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
      }
      .compositingGroup()
      .shadow(
        color: Color.white.opacity(0.9),
        radius: 10,
        x: -5,
        y: -5)
      .shadow(
        color: Color.lairShadowGray.opacity(0.5),
        radius: 10,
        x: 5,
        y: 5)
    }
    
    // 4
    return button
  }
  
  var buttonDown: some View {
    ZStack {
        Rectangle()
          .foregroundColor(.lairBackgroundGray)
          .frame(width: size * 2.25, height: size * 2.25)
          .cornerRadius(size * 8 / 16)
      
      Rectangle()
        .foregroundColor(.lairBackgroundGray)
        .frame(width: size * 2.25, height: size * 2.25)
        .cornerRadius(size * 8 / 16)
        .inverseMask(Rectangle()
          .cornerRadius(size * 6 / 16)
          .padding(size / 8)
        )
        .shadow(
          color: Color.lairShadowGray.opacity(0.7),
          radius: size * 0.1875,
          x: size * 0.1875,
          y: size * 0.1875)
        .shadow(
          color: Color(white: 1.0).opacity(0.9),
          radius: size * 0.1875,
          x: -size * 0.1875,
          y: -size * 0.1875)
        .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
      LinearGradient.lairHorizontalDarkReverse
        .frame(width: size, height: size)
        .mask(Image(systemName: self.icon)
          .resizable()
          .scaledToFit()
        )
        .shadow(
          color: Color.lairShadowGray.opacity(0.5),
          radius: size * 0.1875,
          x: size * 0.1875,
          y: size * 0.1875)
        .shadow(
          color: Color(white: 1.0).opacity(0.9),
          radius: size * 0.1875,
          x: -size * 0.1875,
          y: -size * 0.1875)
      }
    .overlay(
      RoundedRectangle(cornerRadius: size * 8 / 16)
        .stroke(LinearGradient.lairDiagonalLightBorder, lineWidth: 2)
      )

  }
  
  
  var body: some View {
      Button(action: {
        self.selectedItem = self.smartView
      }) {
        // This is the new stuff!
        if isSelected() {
          buttonDown
        } else {
          buttonUp
        }
      }
 // Text("Text")
  }
}

struct TabBarItem_Previews: PreviewProvider {
  static var previews: some View {
    TabBarItem(
      selectedItem: .constant(SmartView.lair),
      smartView: .lair, icon: "pencil.tip")
  }
}
