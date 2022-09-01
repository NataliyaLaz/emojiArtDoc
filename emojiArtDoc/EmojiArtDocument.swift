//
//  emojiArtDocument.swift
//  emojiArtDoc
//
//  Created by Nataliya Lazouskaya on 1.09.22.
//

import UIKit

class emojiArtDocument: UIDocument {
    
    var emojiArt: EmojiArt?
    
    override func contents(forType typeName: String) throws -> Any {
        return emojiArt?.json ?? Data()// return json or blank document
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        if let json = contents as? Data {
            emojiArt = EmojiArt(json: json)
        }
   
    }
}

