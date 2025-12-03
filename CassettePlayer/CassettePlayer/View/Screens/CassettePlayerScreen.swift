//
//  CassettePlayerScreen.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/1/25.
//

import SwiftUI

struct CassettePlayerScreen: View {
    
    @State private var viewModel = CassetteVM()
    
    var body: some View {
        VStack{
            songTitle
            HStack(alignment: .top) {
                controls
                songList
            }
        }
        .padding()
        .background(Color.plastic)
    }
    
    private var songTitle: some View {
        CassetteNowPlaying(song: viewModel.currentSong)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    private var controls: some View {
        CassetteControls(
            onPlay: viewModel.play,
            onPause: viewModel.pause,
            onNext: viewModel.next,
            onPrevious: viewModel.previous,
            onStop: viewModel.stop
        )
    }
    
    private var songList: some View {
        CassetteSongList(
            songs: viewModel.songs,
            currentlyPlaying: viewModel.currentSong,
            onTapSong: viewModel.playSong
        )
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    CassettePlayerScreen()
}
