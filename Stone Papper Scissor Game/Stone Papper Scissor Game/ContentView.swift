//
//  ContentView.swift
//  Stone Papper Scissor Game
//
//  Created by Sagar Jangra on 01/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var yourChoice = ""
    @State private var compChoice = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var currentScore = 0
    @State private var highScore = UserDefaults.standard.integer(forKey: "HighScore")
    
    let choiceArr = ["Rock","Paper","Scissor"]
    
    var body: some View {
        
            VStack {
                
                Text("Current Score: \(currentScore)")
                    .padding(.top,40)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Highscore: \(highScore)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("Computer Chosed! \n     Now your turn")
                    .bold()
                    .padding()
                HStack{
                    
                    StyledButton(title: "Rock 👊") {
                        yourChoice = "Rock"
                        playGame()
                        countScore()
                        
                    }
                    StyledButton(title: "Paper 🖐️") {
                        yourChoice = "Paper"
                        playGame()
                        countScore()
                    }
                }
                    StyledButton(title: "Scissor ✌️") {
                        yourChoice = "Scissor"
                        playGame()
                        countScore()
                    }
            }
            .padding()
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
            })
            .onAppear(perform: {
                highScore = UserDefaults.standard.integer(forKey: "HighScore")
            })
    }
    
    
    func playGame() {
        compChoice = choiceArr[Int.random(in: 0..<choiceArr.count)]
        
        if yourChoice == compChoice{
            alertTitle = "Draw"
            alertMessage = "It's a tie \n Computer chosed: \(compChoice)"
        }else if(yourChoice == "Rock" && compChoice == "Scissor") ||
                 (yourChoice == "Paper" && compChoice == "Rock") ||
                 (yourChoice == "Scissor" && compChoice == "Paper"){
            alertTitle = "Win"
            alertMessage = "You Won! \n Computer chosed: \(compChoice)"
        }else{
            alertTitle = "Lost"
            alertMessage = "You Lose \n Computer chosed: \(compChoice)"
        }
        showAlert = true
    }
    
    func countScore(){
        if (alertTitle == "Win"){
            currentScore += 1
        }else if(alertTitle == "Lost"){
            currentScore = 0
        }else{
            
        }
        if currentScore > highScore {
            highScore = currentScore
            UserDefaults.standard.set(highScore,forKey: "HighScore")
        }
    }
}


#Preview {
    ContentView()
}


struct StyledButton: View {
    
    let title : String
    let action : () -> Void
    
    var body: some View {
        Button(action: action){
            Text(title)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(.green)
                .cornerRadius(15)
        }
        
    }
}


