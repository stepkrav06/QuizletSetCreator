//
//  ContentView.swift
//  QuizletSetCreator
//
//  Created by Степан Кравцов on 13.02.2023.
//

import SwiftUI
import CoreServices.DictionaryServices

struct ContentView: View {
    let txt = "walk"
    @State var definitions: [String:[String]] = [:]
    @State private var words: String = ""
    @State private var changingDefinitinos = false
    @State private var changingDefinitinosForWord: String = ""
    var body: some View {
        if changingDefinitinos{
            DefinitionPickView(word: changingDefinitinosForWord, definitions: definitions[changingDefinitinosForWord]!)
        }
        else {
            VStack{
                TextField(
                        "words",
                        text: $words
                    )
                Button(action:{
                    let strArray = words.components(separatedBy: ", ")
                    print(strArray)
                    
                    for word in strArray{
                        getData(word:word) { (json) in
                            var definitionsWord: [String] = []
                            for i in 0...json.count-1{
                                let meanings = json[i]["meanings"] as! [[String:Any]]
                                for item in meanings {
                                    let sets = item["definitions"] as! [[String:Any]]
                                    for set in sets {
                                        definitionsWord.append(set["definition"] as! String)
                                    }
                                }
                            }
                            
                            
                            
                            definitions[json[0]["word"] as! String] = definitionsWord
                            
                        }
                    }
                    
                   
                }){
                    Text("search")
                }
                ScrollView{
                    ForEach(Array(definitions.keys), id: \.self) { key in
                        ZStack{
                        
                            
                            WordCard(word: key, definitions: definitions[key] as! [String])
                                .onTapGesture {
                                    self.changingDefinitinos = true
                                    self.changingDefinitinosForWord = key
                                }
                        }
                                
                        
            
                        
                        
                    }
                }
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
