//
//  ContentView.swift
//  GuessItSwiftUI WatchKit Extension
//
//  Created by Ramill Ibragimov on 30.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let movies = MovieModel.getMovie()
    @State private var element: MovieModel?
    
    @State private var myText: String = ""
    @State private var myButton: String = ""
    
    var body: some View {
        VStack {
            Text(self.myText)
            Button(action: {
                self.performAction()
            }) {
                Text(self.myButton)
            }
        }.onAppear() {
            self.element = self.movies.randomElement()

            if let emoji = self.element?.emoji {
                self.myButton = emoji
            }
        }
    }
    
    func performAction() {
        if let name = self.element?.name {
            self.myText = name
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (_) in
            self.element = self.movies.randomElement()
            
            if let emoji = self.element?.emoji {
                self.myButton = emoji
            }
            self.myText = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
