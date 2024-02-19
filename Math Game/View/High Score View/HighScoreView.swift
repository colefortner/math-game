//
//  HighScoreView.swift
//  Math Game
//
//  Created by Cole Fortner on 2/18/24.
//

import SwiftUI

struct HighScoreView: View {
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            
            Text("HighScoreView")
                .foregroundColor(.white)

        }
    }
}

#Preview {
    HighScoreView()
}
