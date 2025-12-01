//
//  CassetteControls.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/1/25.
//

import SwiftUI

struct CassetteControls: View {
    
    let onPlay: () -> Void
    let onPause: () -> Void
    let onNext: () -> Void
    let onPrevious: () -> Void
    let onStop: () -> Void
    
    var body: some View {
        VStack {
            Button("Play", systemImage: "play.fill", action: onPlay)
            Button("Pause", systemImage: "pause.fill", action: onPause)
            Button("Skip", systemImage: "forward.fill", action: onNext)
            Button("Rewind", systemImage: "backward.fill", action: onPrevious)
            Button("Stop", systemImage: "stop.fill", action: onStop)
        }
    }
}

#Preview {
    CassetteControls(
        onPlay: {},
        onPause: {},
        onNext: {},
        onPrevious: {},
        onStop: {}
    )
}
