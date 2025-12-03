//
//  Song.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/3/25.
//

import Foundation

struct Song {
    let name: String
    let location: URL
}

extension Song {
    static func fromBundle() -> [Song] {
        // Gets an Array of URLs that point to all the .mp3 files in our applications bundle.
        guard let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil)
        else { return [] }
        
        // URLs:
        // - /some/path/to/my/application/song.mp3
        
        // Songs Location = The URL
        // Songs Name = The last component of the URL - .mp3
        
//        var songs = [Song]()
//        
//        for url in urls {
//            songs.append(
//                Song(
//                    // Convert name.mp3 to just .mp3
//                    
//                    name: String(url.lastPathComponent.dropLast(4)),
//                    location: url
//                )
//            )
//        }
//
//        return []
        
        return urls.map { url in
            Song(
                name: String(url.lastPathComponent.dropLast(4)),
                location: url
            )
        }
    }
}
