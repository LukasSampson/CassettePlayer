//
//  CassetteControls.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/1/25.
//

import SwiftUI

struct CassetteControls: View {
    
    var orientation: Orientation = .vertical
    
    let onPlay: () -> Void
    let onPause: () -> Void
    let onNext: () -> Void
    let onPrevious: () -> Void
    let onStop: () -> Void
    
    var body: some View {
        // AnyLayout
        orientation.layout {
            Button("Play", systemImage: "play.fill", action: onPlay)
            Button("Pause", systemImage: "pause.fill", action: onPause)
            Button("Skip", systemImage: "forward.fill", action: onNext)
            Button("Rewind", systemImage: "backward.fill", action: onPrevious)
            Button("Stop", systemImage: "stop.fill", action: onStop)
              .foregroundStyle(Color.red)
        }
        .buttonStyle(.cassette)
    }
}

extension CassetteControls {
    enum Orientation {
        case vertical
        case horizontal
        
        var layout: AnyLayout {
            switch self {
                case .vertical: AnyLayout(VStackLayout())
                case .horizontal: AnyLayout(HStackLayout())
            }
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
