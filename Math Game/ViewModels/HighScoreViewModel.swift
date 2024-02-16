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
            let request = NSFetchRequest<HighScoreEntity>(entityName: "HighScoreEntity")
            let sortDescriptor = NSSortDescriptor(
                keyPath: \HighScoreEntity.score,
                ascending: false)
            request
                .sortDescriptors = [sortDescriptor]
            
            do {
                highScores = try container
                    .viewContext
                    .fetch(request)
            } catch let error {
                print( "Error fetching high scores: \(error.localizedDescription)")
            }
        }
        
        func saveHighScore(){
            do {
                try container
                    .viewContext
                    .save()
                fetchHighScores()
            } catch let error {
                print( "Error saving high scores: \(error.localizedDescription)")
            }
        }
        
        func addHighScore( name: String, score: Int64) {
            let entity = HighScoreEntity(
                context: container.viewContext)
            entity.name = name
            entity.score = score
            
            saveHighScore()
        }
    }
}
