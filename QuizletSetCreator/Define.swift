//
//  Define.swift
//  QuizletSetCreator
//
//  Created by Степан Кравцов on 13.02.2023.
//  

import Foundation
class Define: ObservableObject {
    @Published var pickedWordToChangeDefinition: String = ""
    @Published var definitions: [String:[String]] = [:]
    func getData(word: String, completion: @escaping (([[String:Any]]) -> Void)){
        
        let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                completion(json!)
                    
                
            } catch  {
                print(error.localizedDescription)
            }
            
        }
        

        task.resume()
        
    }
    func getDict(words: String){
        
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
                
                
                DispatchQueue.main.async {
                    self.definitions[json[0]["word"] as! String] = definitionsWord
                }
                
                
            }
        }
        
        
    }
    func setPrimaryDefinitionForWord(word: String, definition: String){
        let ind = definitions[word]!.firstIndex(of: definition)!
        definitions[word]!.swapAt(0, ind)
    }

}

