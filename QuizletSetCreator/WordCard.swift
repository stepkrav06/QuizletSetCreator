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
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .foregroundColor(.primary)
            HStack{
                Text(word)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                Divider()
                VStack{
                    ForEach(definitions, id: \.self){ definition in
                        Text(definition)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                    }
                }
            }
            .padding(32)
        }
    }
}

struct WordCard_Previews: PreviewProvider {
    static var previews: some View {
        WordCard(word: "word", definitions: [])
    }
}
