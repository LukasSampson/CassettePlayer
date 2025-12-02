//
//  SevenSegment.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/2/25.
//

import SwiftUI

enum SevenSegment {
    
    static let body = sevenSegment(size: 25, relativeTo: .body)
    
    private static func sevenSegment(size: CGFloat, relativeTo style: Font.TextStyle) -> Font {
        Font.custom("Seven Segment", size: size, relativeTo: style)
    }
}
