//
//  HighScoreViewModel.swift
//  Math Game
//
//  Created by Cole Fortner on 2/15/24.
//

import Foundation
import CoreData

class HighScoreViewModel: ObservableObject{
    let container: NSPersistentContainer
    
    @Published var highScores: [HighScoreEntity] = []
    
    init(){
        container = NSPersistentContainer(name: "HighScoresDataModel")
        
        // Load the data
        container
            .loadPersistentStores { description, error in
                if let error {
                    print("Loading error: \(error.localizedDescription)")
                } else {
                    print("LOADING SUCCESSFUL")
                }
            }
        
            
        // Fetch data into highScores
        func fetchHighScores() {
            // TODO:  Complete this
        }
    }
}
