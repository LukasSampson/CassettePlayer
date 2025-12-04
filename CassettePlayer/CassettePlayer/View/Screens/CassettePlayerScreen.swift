//
//  CassettePlayerScreen.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/1/25.
//

import SwiftUI

struct CassettePlayerScreen: View {
    
    @Environment(\.layoutOrientation) private var orientation
    
    @State private var viewModel = CassetteVM()
    
    var body: some View {
        switch orientation {
            case .portrait: portrait
            case .landscape: landscape
        }
    }
    
    private var portrait: some View {
        VStack{
            songTitle
            HStack(alignment: .top) {
                controls(.vertical)
                songList
            }
        }
        .padding()
        .background(Color.plastic)
    }
    
    private var landscape: some View {
        VStack(alignment: .leading){
            songTitle
            controls(.horizontal)
            songList
        }
        .padding()
        .background(Color.plastic)
    }
    
    private var songTitle: some View {
        CassetteNowPlaying(song: viewModel.currentSong)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    private func controls(_ orientation: CassetteControls.Orientation) -> some View {
        CassetteControls(
            orientation: .vertical,
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
        .layoutOriented()
}
