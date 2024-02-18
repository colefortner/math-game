//
//  ProblemModel.swift
//  Math Game
//
//  Created by Cole Fortner on 2/18/24.
//

import Foundation

struct ProblemModel: Identifiable {
    let id = UUID()
    let num1: Int
    let num2: Int
    let level: Int
    
    let solutions: [Int]
    var answer: Int {
        solutions[0]
    }
    
    func checkSolution( value: Int ) -> Bool {
        !solutions.isEmpty && value == answer
    }
    
    init ( level: Int ) {
        self.level = level
        let lower = (level - 1) * 5
        let upper = level * 5
        self.num1 = Int.random(in: lower...upper)
        self.num2 = Int.random(in: lower...upper)
        let answer = num1 + num2
        
        var newSolution: [Int] = []
        newSolution.append(answer) // True solution at solution[0] = 27
        let belowAnswer = max(0, answer - 5) // solution[1] Distraction = 37
        let aboveAnswer = answer + 5
        newSolution.append(Int.random(in: answer+1...aboveAnswer))  // solution[2]
        newSolution.append(Int.random(in: belowAnswer..<answer))  // solution[3]
        self.solutions = newSolution
    }
}
