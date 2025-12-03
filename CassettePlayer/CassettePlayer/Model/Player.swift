//
//  Player.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/3/25.
//

import AVFoundation

struct Player {
    let songs: [Song]
    
    var currentSong: Song? {
        guard !songs.isEmpty else { return nil }
        return songs[currentSongIndex]
    }
    
    private var currentSongIndex = 0
    private var audioPlayer: AVAudioPlayer?
    
    // Play
    mutating func play() {
        guard let currentSong else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: currentSong.location)
            audioPlayer?.play()
        } catch {
            print("Audio player could not be created for file: \(currentSong.location)")
        }
    }
    
    // Pause
    func pause() {
        audioPlayer?.pause()
    }
    
    // Stop
    mutating func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    // Next
    mutating func next() {
        currentSongIndex = currentSongIndex + 1 >= songs.count ? 0 : currentSongIndex + 1
        stop()
        play()
    }
    
    // Previous
    mutating func previous() {
        currentSongIndex = currentSongIndex - 1 < 0 ? songs.count - 1 : currentSongIndex - 1
        stop()
        play()
    }
}
