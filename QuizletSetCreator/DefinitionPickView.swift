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
    @State private var ownDefinition: String = ""

    var body: some View {
        ScrollView {
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.primary)
                        
                            
                    TextField(
                        "Your own definition",
                        text: $ownDefinition
                    )
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            
                            
                        
                    
                    
                }
                Button(action:{
                    if ownDefinition != ""{
                        define.definitions[word]!.append(ownDefinition)
                        define.setPrimaryDefinitionForWord(word: define.pickedWordToChangeDefinition, definition: ownDefinition)
                        NSApplication.shared.keyWindow?.close()
                        define.pickedWordToChangeDefinition = ""
                    }
                }){
                    
                        Text("Select own definition")
                            .padding()
                            .foregroundColor(.primary)
                        
                   
                    
                }
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
