//
//  CassetteVM.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/3/25.
//

import Observation

@Observable
class CassetteVM {
    // What stored properties
    private var player: Player
    
    var currentSong: String {
        player.currentSong?.name ?? "EMPTY"
    }
    
    var songs: [String] {
        player.songs.map  { song in
            song.name
        }
    }
    
//    var songs: [String] {
//        // Take our Players Songs
//        // Convert them into an Array of the song names.
//        
//    }
    
    init() {
        self.player = Player(songs: Song.fromBundle())
    }
    
    func play() { player.play() }
    func playSong(with name: String) { player.playSong(with: name) }
    func pause() { player.pause() }
    func next() { player.next() }
    func previous() { player.previous() }
    func stop() { player.stop() }
}
