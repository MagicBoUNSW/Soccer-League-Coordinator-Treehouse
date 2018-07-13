//: Playground - noun: a place where people can play

import UIKit

//: Playground - noun: a place where people can play

// Treehouse iOS Techdegree
// Unit 1 - Project 1: Soccer League Coordinator in Swift
// By: Hieu Mai - www.maitrunghieu.com

//

var teamSharks: [String : [String : Any]] = [:]
var teamDragons: [String : [String : Any]] = [:]
var teamRaptors: [String : [String : Any]] = [:]
let allTeams = ["teamSharks", "teamDragons", "teamRaptors"]
var experiencedPlayers: [String : [String : Any]] = [:]
var nonexperiencedPlayers: [String : [String : Any]] = [:]
var TheLeague: [[String: Any]] = []
let allowedRange = 1.5  // Inches
var letters: [String] = []
/*
 Manually create a single collection named 'players' that contains all information for all 18 players.
 Each player must themselves be represented by a Dictionary with String keys and the corresponding values.
 */
// Data structure [String : [String : Any]]
var players: [String : [String : Any]] = [:]
let player1: [String : Any] = [ "name": "Joe Smith", "height": 42.0,
                                "experience": true, "guardians": "Jim and Jan Smith"]
let player2: [String : Any] = [ "name": "Jill Tanner", "height": 36.0,
                                "experience": true, "guardians": "Clara Tanner"]
let player3: [String : Any] = [ "name": "Bill Bon", "height": 43.0,
                                "experience": true, "guardians": "Sara and Jenny Bon"]
let player4: [String : Any] = [ "name": "Eva Gordon", "height": 45.0,
                                "experience": false, "guardians": "Wendy and Mike Gordon"]
let player5: [String : Any] = [ "name": "Matt Gill", "height": 40.0,
                                "experience": false, "guardians": "Charles and Sylvia Gill"]
let player6: [String : Any] = [ "name": "Kimmy Stein", "height": 41.0,
                                "experience": false, "guardians": "Bill and Hillary Stein"]
let player7: [String : Any] = [ "name": "Sammy Adams", "height": 45.0,
                                "experience": false, "guardians": "Jeff Adams"]
let player8: [String : Any] = [ "name": "Karl Saygan", "height": 42.0,
                                "experience": true, "guardians": "Heather Bledsoe"]
let player9: [String : Any] = [ "name": "Suzane Greenberg", "height": 44.0,
                                "experience": true, "guardians": "Henrietta Dumas"]
let player10: [String : Any] = [ "name": "Sal Dali", "height": 41.0,
                                 "experience": false, "guardians": "Gala Dali"]
let player11: [String : Any] = [ "name": "Joe Kavalier", "height": 39.0,
                                 "experience": false, "guardians": "Sam and Elaine Kavalier"]
let player12: [String : Any] = [ "name": "Ben Finkelstein", "height": 44.0,
                                 "experience": false, "guardians": "Aaron and Jill Finkelstein"]
let player13: [String : Any] = [ "name": "Diego Soto", "height": 41.0,
                                 "experience": true, "guardians": "Robin and Sarika Soto"]
let player14: [String : Any] = [ "name": "Chloe Alaska", "height": 47.0,
                                 "experience": false, "guardians": "David and Jamie Alaska"]
let player15: [String : Any] = [ "name": "Arnold Willis", "height": 43.0,
                                 "experience": false, "guardians": "Claire Willis"]
let player16: [String : Any] = [ "name": "Phillip Helm", "height": 44.0,
                                 "experience": true, "guardians": "Thomas Helm and Eva Jones"]
let player17: [String : Any] = [ "name": "Les Clay", "height": 42.0,
                                 "experience": true, "guardians": "Wynonna Brown"]
let player18: [String : Any] = [ "name": "Herschel Krustofski", "height": 45.0,
                                 "experience": true, "guardians": "Hyman and Rachel Krustofski"]

players =
[
    player1["name"] as! String: player1,
    player2["name"] as! String: player2,
    player3["name"] as! String: player3,
    player4["name"] as! String: player4,
    player5["name"] as! String: player5,
    player6["name"] as! String: player6,
    player7["name"] as! String: player7,
    player8["name"] as! String: player8,
    player9["name"] as! String: player9,
    player10["name"] as! String: player10,
    player11["name"] as! String: player11,
    player12["name"] as! String: player12,
    player13["name"] as! String: player13,
    player14["name"] as! String: player14,
    player15["name"] as! String: player15,
    player16["name"] as! String: player16,
    player17["name"] as! String: player17,
    player18["name"] as! String: player18
]

/*
Part 2: Create logic to iterate through all 18 players and assign them to teams
such that the number of experienced players on each team are the same.
Store each team’s players in its own collection for use in Part 3.
Please note: your logic should work correctly regardless of the initial ordering
of the players and the number of players. This solution should work if there are 18 players or 100.
*/

// Calculate the height
// function takes a paramater which could be collection of all players or just a team, returns average
func AvgHeight(team: [String : [String : Any]]) -> Double {
    var Height = 0.0
    for (_, value) in team {
        Height += value["height"] as! Double
    }
    return Height / Double(team.count)
}

func seperatePlayers() {
    for (key, value) in players {
        if value["experience"] as! Bool == false {
            nonexperiencedPlayers[key] = value
        } else {
            experiencedPlayers[key] = value
        }
    }
}

func divideNonExperienced() {
    var NonExperiencedClone = nonexperiencedPlayers
    while NonExperiencedClone.count > 0 {
        for player in NonExperiencedClone {
            
            if teamSharks.count < (players.count / allTeams.count) {
                teamSharks[player.key] = player.value
                if AvgHeight(team: players) - allowedRange / Double(allTeams.count) > AvgHeight(team: teamSharks)
                    || AvgHeight(team: teamSharks) > AvgHeight(team: players) + allowedRange / Double(allTeams.count) {
                    teamSharks.removeValue(forKey: player.key)
                } else {
                    NonExperiencedClone.removeValue(forKey: player.key)
                }
                
            } else if teamRaptors.count < (players.count / allTeams.count) {
                teamRaptors[player.key] = player.value
                if AvgHeight(team: players) - allowedRange / Double(allTeams.count) > AvgHeight(team: teamRaptors)
                    || AvgHeight(team: teamRaptors) > AvgHeight(team: players) + allowedRange / Double(allTeams.count) {
                    teamRaptors.removeValue(forKey: player.key)
                } else {
                    NonExperiencedClone.removeValue(forKey: player.key)
                }
            } else if teamDragons.count < (players.count / allTeams.count) {
                teamDragons[player.key] = player.value
                if AvgHeight(team: players) - allowedRange / Double(allTeams.count) > AvgHeight(team: teamDragons)
                    || AvgHeight(team: teamDragons) > AvgHeight(team: players) + allowedRange / Double(allTeams.count) {
                    teamDragons.removeValue(forKey: player.key)
                } else {
                    NonExperiencedClone.removeValue(forKey: player.key)
                }
            }
        }
    }
}

func divideExperienced() {
    for player in experiencedPlayers {
        if teamSharks.count < (experiencedPlayers.count / allTeams.count) {
            teamSharks[player.key] = player.value
        } else if teamRaptors.count < (experiencedPlayers.count / allTeams.count) {
            teamRaptors[player.key] = player.value
        } else if teamDragons.count < (experiencedPlayers.count / allTeams.count) {
            teamDragons[player.key] = player.value
        }
    }
}

/*
Part 3: ** Write code that iterates through all three teams of players and generates a personalized letter to the guardians,
letting them know which team the child has been placed on and when they should attend their first team team practice.
As long as you provide the necessary information (player name, team name, guardian names, practice date/time),
feel free to have fun with the content of the letter. The team practice dates/times are as follows:
*/
// Function to print the letters
func LetterPrint() {
    for l in letters {
        print(l)
    }
}

func LetterGeneratorDragons() {
    for (key, value) in teamDragons {
        letters += ["Hello \(value["guardians"] ?? ""), your kid \(key), is in Team Dragons, practicing on March 17, 1pm"]
    }
}
func LetterGeneratorSharks() {
    // ?? "" is there to get rid of Optionals
    for (key, value) in teamSharks {
        letters += ["Hello \(value["guardians"] ?? ""), your kid \(key), is in Team Sharks, practicing on March 17, 3pm"]
    }
}
func LetterGeneratorRaptors() {
    for (key, value) in teamRaptors {
        letters += ["Hello \(value["guardians"] ?? ""), your kid \(key), is in Team Raptors, practicing on March 18, 1pm"]
    }
}

// Main function to run the program
func main(){
    seperatePlayers()
    divideExperienced()
    divideNonExperienced()
    LetterGeneratorSharks()
    LetterGeneratorRaptors()
    LetterGeneratorDragons()
    LetterPrint()
    
    print("==============================================================")
    
    print("Team Raptors average height: " ,AvgHeight(team: teamRaptors))
    print("Team Dragons average height: " ,AvgHeight(team: teamDragons))
    print("Team Sharks average height: " , AvgHeight(team: teamSharks))
    print("==============================================================")
    print("All players average height: ", AvgHeight(team: players))
}


main()
