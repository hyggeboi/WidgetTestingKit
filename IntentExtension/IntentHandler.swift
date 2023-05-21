//
//  IntentHandler.swift
//  IntentExtension
//
//  Created by Vlad Paramonov on 21.05.2023.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}

extension IntentHandler: ConfigurationIntentHandling {

    func provideImageNameOptionsCollection(for intent: ConfigurationIntent) async throws -> INObjectCollection<NSString> {
        guard let imagesFolderURL = Bundle.main.url(forResource: "Images", withExtension: nil) else { return INObjectCollection(items: []) }
        let imagesFolder = imagesFolderURL.path
        let imageNames = try FileManager.default.contentsOfDirectory(atPath: imagesFolder) as [NSString]
        return INObjectCollection(items: imageNames)
    }
}
