//
//  CassetteNowPlaying.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/2/25.
//

import SwiftUI
import MarqueeText

struct CassetteNowPlaying: View {
    
    let song: String
    
    var body: some View {
        MarqueeText(
            text: song,
            font: UIFont(name: "Seven Segment", size: 75)!,
            leftFade: 0,
            rightFade: 0,
            startDelay: 3
        )
        .background(Color.display)
    }
}

#Preview {
    CassetteNowPlaying(song: "Kid Again")
}
