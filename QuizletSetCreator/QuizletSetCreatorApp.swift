//
//  QuizletSetCreatorApp.swift
//  QuizletSetCreator
//
//  Created by Степан Кравцов on 13.02.2023.
//

import SwiftUI

@main
struct QuizletSetCreatorApp: App {
    var body: some Scene {
        let define = Define()
        WindowGroup {
            ContentView()
                .environmentObject(define)
        }
        WindowGroup("Change definition") {
                    DefinitionPickView()
                .environmentObject(define)
                }.handlesExternalEvents(matching: Set(arrayLiteral: "DefinitionPickView"))
    }
}
enum OpenWindows: String, CaseIterable {
    case DefinitionPickView = "DefinitionPickView"
    //As many views as you need.

    func open(){
        if let url = URL(string: "myapp://\(self.rawValue)") { //replace myapp with your app's name
            NSWorkspace.shared.open(url)
            
        }
    }
}
