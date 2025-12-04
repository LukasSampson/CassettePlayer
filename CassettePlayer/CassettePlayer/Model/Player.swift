//
//  Player.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/3/25.
//

import AVFoundation
import Observation

@Observable
class Player: NSObject {
    let songs: [Song]
    
    var currentSong: Song? {
        guard !songs.isEmpty else { return nil }
        return songs[currentSongIndex]
    }
    
    private var currentSongIndex = 0
    private var audioPlayer: AVAudioPlayer?
    
    init(songs: [Song]) {
        self.songs = songs
        
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try? AVAudioSession.sharedInstance().setActive(true)
        
        super.init()
    }
    
    // Play
    func play() {
        if audioPlayer == nil, let currentSong {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: currentSong.location)
                audioPlayer?.delegate = self
            } catch {
                print("Audio player could not be created for file: \(currentSong.location)")
            }
        }
        
        audioPlayer?.play()
    }
    
    func playSong(with name: String) {
        guard let index = songs.firstIndex(where: { $0.name == name })
        else { return }
        
        currentSongIndex = index
        stop()
        play()
    }
    
    // Pause
    func pause() {
        audioPlayer?.pause()
    }
    
    // Stop
    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    // Next
    func next() {
        currentSongIndex = currentSongIndex + 1 >= songs.count ? 0 : currentSongIndex + 1
        stop()
        play()
    }
    
    // Previous
    func previous() {
        currentSongIndex = currentSongIndex - 1 < 0 ? songs.count - 1 : currentSongIndex - 1
        stop()
        play()
    }
}

extension Player: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            next()
        }
    }
}
