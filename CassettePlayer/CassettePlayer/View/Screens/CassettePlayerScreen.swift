//
//  CassettePlayerScreen.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/1/25.
//

import SwiftUI

struct CassettePlayerScreen: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        songTitle
        controls
        songList
    }
    
    private var songTitle: some View {
        Text("Song Title")
    }
    
    private var controls: some View {
        Text("Controls")
    }
    
    private var songList: some View {
        Text("Song List")
    }
}

#Preview {
    CassettePlayerScreen()
}
