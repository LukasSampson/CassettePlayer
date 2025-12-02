//
//  CassettePlayerScreen.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/1/25.
//

import SwiftUI

struct CassettePlayerScreen: View {
    var body: some View {
        songTitle
        controls
        songList
    }
    
    private var songTitle: some View {
        CassetteNowPlaying(song: "")
    }
    
    private var controls: some View {
        CassetteControls(
            onPlay: {},
            onPause: {},
            onNext: {},
            onPrevious: {},
            onStop: {}
        )
    }
    
    private var songList: some View {
        CassetteSongList(
            songs: [
                "One More Time",
                "Flashing Lights",
                "A Car, A Torch, A Death",
                "Kid Again",
                "Kyle (i found you)"
            ],
            currentlyPlaying: "Kid Again",
            onTapSong: { _ in
            }
        )
    }
}

#Preview {
    CassettePlayerScreen()
}
