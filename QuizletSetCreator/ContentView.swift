//
//  ContentView.swift
//  QuizletSetCreator
//
//  Created by Степан Кравцов on 13.02.2023.
//

import SwiftUI
import CoreServices.DictionaryServices

struct ContentView: View {
    @EnvironmentObject var define: Define
    
    @State private var words: String = ""
    var body: some View {
        
        VStack{
            TextField(
                "words",
                text: $words
            )
            HStack{
                Button(action:{
                    
                    define.getDict(words: words)
                    
                    
                    
                    
                }){
                    Text("Search")
                }
                Button(action:{
                    
                    define.exportFile()
                
                }){
                    Text("Export")
                }
                Button(action:{
                    
                    define.definitions = [:]
                    words = ""
                
                }){
                    Text("Clear")
                }
            }
            ScrollView{
                ForEach(Array(define.definitions.keys), id: \.self) { key in
                    ZStack{
                        WordCard(word: key, definitions: define.definitions[key]!)
                            .onTapGesture {
                                define.pickedWordToChangeDefinition = key
                                OpenWindows.DefinitionPickView.open()
                            }
                    }
                    
                    
                    
                    
                    
                }
            }
            
        }.navigationTitle("Search words")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
