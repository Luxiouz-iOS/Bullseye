//
//  Game.swift
//  Bullseye
//
//  Created by Luis Becerra on 03/01/22.
//  Created by Luis Becerra on 03/01/22.
//

import Foundation

struct Game {
    var target = 0;
    var score = 0
    var round = 0
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(testMode: Bool = false) {
        score = 0
        round = 0
        target = randomTarget()
        
        if(testMode == true){
            startNewRound(points: 100)
            startNewRound(points: 50)
            startNewRound(points: 200)
            startNewRound(points: 75)
            startNewRound(points: 300)
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let diff = abs(target - sliderValue)
        var bonus = 0
        
        if(diff == 0) {
            bonus = 100
        }
        else if(diff <= 2) {
            bonus = 50
        }
        
        return 100 - diff + bonus
    }
    
    func randomTarget() -> Int{
        var rt = target;
        
        while(rt == target) {
            rt = Int.random(in: 5...1000) < 50 ? Int.random(in: 5...45) : Int.random(in: 55...95);
        }
        
        return rt;
    }
    
    mutating func addToLeaderboard(points: Int){
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort{$0.score > $1.score}
        print(leaderboardEntries)
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = randomTarget()
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = randomTarget()
    }
}
