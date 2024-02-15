//
//  ContentView.swift
//  Math Game
//
//  Created by Cole Fortner on 2/15/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Text("Math Game View")
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            Text("High Score View")
                .tabItem {
                    Image(systemName: "list.number")
                    Text("High Scores")
                }
        }
    }
}

#Preview {
    MainView()
}
