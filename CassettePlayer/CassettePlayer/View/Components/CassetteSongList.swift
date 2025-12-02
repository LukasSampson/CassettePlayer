//
//  CassetteSongList.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/2/25.
//

import SwiftUI

struct CassetteSongList: View {
    
    let songs: [String]
    let currentlyPlaying: String
    
    let onTapSong: (String) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(songs, id: \.self) { song in
                    VStack(alignment: .leading, spacing: 0) {
                        Text(song)
                            .padding(4)
                        Divider()
                    }
                    .background(song == currentlyPlaying ? Color.white.opacity(0.16) : Color.display)
                    .onTapGesture { onTapSong(song) }
                }
            }
        }
        .font(SevenSegment.body)
        .background(Color.display)
    }
}

#Preview {
    
    @Previewable @State var currentlyPlaying = "Kid Again"
    
    CassetteSongList(
        songs: [
            "One More Time",
            "Flashing Lights",
            "A Car, A Torch, A Death",
            "Kid Again",
            "Kyle (i found you)"
        ],
        currentlyPlaying: currentlyPlaying,
        onTapSong: { song in
            currentlyPlaying = song
        }
    )
}
