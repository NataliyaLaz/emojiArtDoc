//
//  emojiArtDocument.swift
//  emojiArtDoc
//
//  Created by Nataliya Lazouskaya on 1.09.22.
//

import UIKit

class emojiArtDocument: UIDocument {
    
    var emojiArt: EmojiArt?
    
    var thumbnail: UIImage?
    
    override func contents(forType typeName: String) throws -> Any {
        return emojiArt?.json ?? Data()// return json or blank document
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        if let json = contents as? Data {
            emojiArt = EmojiArt(json: json)
        }
    }
    
    override func fileAttributesToWrite(to url: URL, for saveOperation: UIDocument.SaveOperation) throws -> [AnyHashable : Any] {
        var attributes = try super.fileAttributesToWrite(to: url, for: saveOperation)
        if let thumbnail = self.thumbnail {
            attributes[URLResourceKey.thumbnailDictionaryKey] = [URLThumbnailDictionaryItem.NSThumbnail1024x1024SizeKey: thumbnail]
        }
        return attributes
    }
}

