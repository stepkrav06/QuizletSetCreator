//
//  DefinitionPickView.swift
//  QuizletSetCreator
//
//  Created by Степан Кравцов on 14.02.2023.
//

import SwiftUI

struct DefinitionPickView: View {
    @EnvironmentObject var define: Define
    @State var word: String = ""

    var body: some View {
        ScrollView {
            VStack{
                ForEach(define.definitions[define.pickedWordToChangeDefinition] ?? [], id: \.self){ definition in
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.primary)
                            
                                
                            Text(definition)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                                
                                
                            
                        
                        
                    }
                    .onTapGesture {
                        define.setPrimaryDefinitionForWord(word: define.pickedWordToChangeDefinition, definition: definition)
                        NSApplication.shared.keyWindow?.close()
                        define.pickedWordToChangeDefinition = ""
                    }
                }
            
                
            }
            .navigationTitle(word.capitalized)
            .padding()
        }
        .onAppear{
            word = define.pickedWordToChangeDefinition
        }
        
        
    }
}

struct DefinitionPickView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionPickView()
    }
}
