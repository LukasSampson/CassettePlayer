//
//  CassetteButtonStyle.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/1/25.
//

import SwiftUI

extension ButtonStyle where Self == CassetteButtonStyle {
    static var cassette: Self { CassetteButtonStyle() }
}

struct CassetteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .labelStyle(.iconOnly)
            .font(.largeTitle)
            .frame(minWidth: Dimens.buttonSize, minHeight: Dimens.buttonSize)
            .background {
                RoundedRectangle(cornerRadius: Dimens.cornerRadius)
                    .fill(Color.button)
                    .shadow(
                        color: .black,
                        radius: 1,
                        x: configuration.isPressed ? 0 : -Dimens.offset,
                        y: configuration.isPressed ? 0 : Dimens.offset
                    )
            }
            .offset(configuration.isPressed ? Dimens.offsetSize : .zero)
    }
    
    private enum Dimens {
        static let offset: CGFloat = 3
        static let buttonSize: CGFloat = 75
        static let cornerRadius: CGFloat = 5
        static var offsetSize: CGSize {
            CGSize(width: -offset, height: offset)
        }
    }
}

#Preview {
    VStack {
        Button("Play", systemImage: "play.fill", action: {})
            .buttonStyle(CassetteButtonStyle())
        Button("Skip", systemImage: "forward.fill", action: {})
    }
    .buttonStyle(CassetteButtonStyle())
}
