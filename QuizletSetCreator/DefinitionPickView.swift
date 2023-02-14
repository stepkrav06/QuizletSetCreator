//
//  DefinitionPickView.swift
//  QuizletSetCreator
//
//  Created by Степан Кравцов on 14.02.2023.
//

import SwiftUI

struct DefinitionPickView: View {
    var word: String
    var definitions: [String]
    var body: some View {
        VStack{
            
        NavigationLink("Back", destination: ContentView())
            
        }.navigationTitle(word.capitalized)
    }
}

struct DefinitionPickView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionPickView(word: "", definitions: [])
    }
}
