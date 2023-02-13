//
//  Define.swift
//  QuizletSetCreator
//
//  Created by Степан Кравцов on 13.02.2023.
//

import Foundation


func getData(word: String, completion: @escaping (([[String:Any]]) -> Void)){
    var requestResult: [String:Any] = [:]
    
    let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)")!

    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
        var str = String(data: data, encoding: .utf8)!
       
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
            completion(json!)
                
            
        } catch  {
            print(error.localizedDescription)
        }
        
    }
    

    task.resume()
    
}
