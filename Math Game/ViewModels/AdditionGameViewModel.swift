//
//  AdditionGameViewModel.swift
//  Math Game
//
//  Created by Cole Fortner on 2/18/24.
//

import Foundation

class AdditionGameViewModel: ObservableObject {
    @Published var gameModel: GameModel = GameModel.defaultGame
    
    private var problemCount = 0
    let nextLevelBound = 5
    let maxIncreaseScore = 10
    
    var score: Int {
        gameModel.score
    }
    
    var timeToMoveUpToNextLevel: Bool {
        problemCount % nextLevelBound == 0
    }
    
    var num1: Int {
        gameModel.currentProblem.num1
    }
    
    var num2: Int {
        gameModel.currentProblem.num2
    }
    
    var possibleSolutions: [Int] {
        gameModel.currentProblem.solutions.shuffled()
    }
    
    var answer: Int {
        gameModel.currentProblem.answer
    }
    
    var gameOver: Bool {
        gameModel.gameOver
    }
    
    func generateNumbers() {
        // New problem
        gameModel.currentProblem = ProblemModel(level: gameModel.level)
        
        // Increase problemCount
        problemCount += 1
        
        // Increase level ?
        if timeToMoveUpToNextLevel {
            gameModel.level += 1
        }
    }
    
    func increaseScore(){
        gameModel.score += min(gameModel.level, maxIncreaseScore)
    }
    
    func loseLife(){
        gameModel.lives = max(gameModel.lives - 1, 0)
        gameModel.score = max(gameModel.score - 2, 0)
    }
    
    func reset(){
        gameModel = GameModel.defaultGame
        problemCount = 0
    }
}
