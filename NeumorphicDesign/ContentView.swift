//
//  ContentView.swift
//  NeumorphicDesign
//
//  Created by Ujjwal on 03/04/2021.
//

import SwiftUI

enum SmartView {
  case lair
  case camera
  case automation
  case settings
}

struct ContentView: View {
  

  @State var selectedItem = SmartView.lair

  var body: some View {
    
    GeometryReader { geometry in
      VStack(spacing: 0){
        ZStack {
          if self.selectedItem == .lair {
            LiarView()
  //          CameraView().hidden()
  //          AutomationView().hidden()
  //          SettingsView().hidden()
          } else if self.selectedItem == .camera {
            LiarView()
  //          LairView().hidden()
  //          CameraView()
  //          AutomationView().hidden()
  //          SettingsView().hidden()
          } else if self.selectedItem == .automation {
            LiarView()
  //          LairView().hidden()
  //          CameraView().hidden()
  //          AutomationView()
  //          SettingsView().hidden()
          } else {
            LiarView()
  //          LairView().hidden()
  //          CameraView().hidden()
  //          AutomationView().hidden()
  //          SettingsView()
          }
        }
        
        TabBarView(
          selectedItem: self.$selectedItem,
          tabBarItems: [
            TabBarItem(
              selectedItem: self.$selectedItem,
              smartView: .lair, icon: "pencil.tip"),
            TabBarItem(
              selectedItem: self.$selectedItem,
              smartView: .camera, icon: "video.circle"),
            TabBarItem(
              selectedItem: self.$selectedItem,
              smartView: .automation, icon: "alarm"),
            TabBarItem(
              selectedItem: self.$selectedItem,
              smartView: .settings, icon: "gear")
        ])
          .padding(.bottom, geometry.safeAreaInsets.bottom / 2)
          .background(Color.lairBackgroundGray)
      }
    }
    

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
