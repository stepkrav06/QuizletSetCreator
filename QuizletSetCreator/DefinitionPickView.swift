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
    @State var picked = false
    @State var pickedDefinition: String = ""
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
                        self.picked.toggle()
                        self.pickedDefinition = definition
                    }
                }
            
                
            }
            .navigationTitle(word.capitalized)
            .padding()
        }
        .onAppear{
            word = define.pickedWordToChangeDefinition
        }
        .alert("Are you sure you want to pick this definition", isPresented: $picked) {
            Button("Cancel", role: .cancel) { }
            Button("Yes", role: .none) {
                define.setPrimaryDefinitionForWord(word: define.pickedWordToChangeDefinition, definition: pickedDefinition)
                define.pickedWordToChangeDefinition = ""
                
            }
        }
    }
}

struct DefinitionPickView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionPickView()
    }
}
