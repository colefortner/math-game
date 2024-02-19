//
//  BackgroundView.swift
//  Math Game
//
//  Created by Cole Fortner on 2/18/24.
//

import SwiftUI

struct BackgroundView: View {
    let colorList: [Color]
    let opacity: Double
    
    var body: some View {
        LinearGradient(
            colors: colorList, 
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .opacity(opacity)
        .ignoresSafeArea()
    }
}

struct GameBackgroundView: View {
    var body: some View {
        BackgroundView(
            colorList: [
                Color.purple,
                Color.pink,
                Color.clear],
            opacity: 0.7)
    }
}

struct HighScoreBackgroundView: View {
    var body: some View {
        BackgroundView(
            colorList: [
                Color.black,
                Color.black,
                Color.gray],
            opacity: 0.7)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View{
        GameBackgroundView()
        HighScoreBackgroundView()
    }
}
