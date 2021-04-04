//
//  ButtonView.swift
//  NeumorphicDesign
//
//  Created by Ujjwal on 03/04/2021.
//

import SwiftUI

struct ButtonView: View {
  @State var imageName = ""
    var body: some View {
      
          VStack
          {
          Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .padding()
          Text(imageName)
            .padding()
            .font(.body)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
