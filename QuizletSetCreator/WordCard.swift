//
//  WordCard.swift
//  QuizletSetCreator
//
//  Created by Степан Кравцов on 13.02.2023.
//

import SwiftUI

struct WordCard: View {
    var word: String
    var definitions: [String]
    
    var body: some View {
        NavigationStack{
            
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        .foregroundColor(.primary)
                    HStack{
                        Text(word)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Divider()
                        VStack{
                            
                                Text(definitions[0])
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding()
                            
                            
                        }
                    }
                    
                }.frame(maxWidth: .infinity, minHeight: 200)
            
            
        }
    }
}

struct WordCard_Previews: PreviewProvider {
    static var previews: some View {
        WordCard(word: "word", definitions: [])
    }
}
