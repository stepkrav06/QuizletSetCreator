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
    @State var definitions: [String:Any] = [:]
    @State private var words: String = ""
    var body: some View {
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
                    let meanings = json[0]["meanings"] as! [[String:Any]]
                    for item in meanings {
                        let sets = item["definitions"] as! [[String:Any]]
                        for set in sets {
                            definitionsWord.append(set["definition"] as! String)
                        }
                    }
                    definitions[json[0]["word"] as! String] = definitionsWord
                    print(definitions["walk"])
                }
            }
            
           
        }){
            Text("search")
        }
        ScrollView{
            ForEach(Array(definitions.keys), id: \.self) { key in
                WordCard(word: key, definitions: definitions[key] as! [String])
                
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
