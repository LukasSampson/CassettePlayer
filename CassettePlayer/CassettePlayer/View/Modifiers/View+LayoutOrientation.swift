//
//  View+LayoutOrientation.swift
//  CassettePlayer
//
//  Created by Luke Sampson on 12/4/25.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var layoutOrientation = LayoutOrientation.portrait
}

enum LayoutOrientation {
    case landscape
    case portrait
}

extension View {
    func layoutOriented() -> some View {
        self.modifier(LayoutOrientationModifier())
    }
}

struct LayoutOrientationModifier: ViewModifier {
    
    @State private var orientation: LayoutOrientation = .portrait
    
    func body(content: Content) -> some View {
        content
            .environment(\.layoutOrientation, orientation)
            .background {
                GeometryReader { proxy in
                    Color.clear
                        .onChange(of: proxy.size) { _, newValue in
                            orientation = newValue.width > newValue.height ? .landscape : .portrait
                        }
                }
            }
    }
}

extension View {
    func cardify() -> some View {
        self
            .padding()
            .font(.title.bold())
            .foregroundStyle(.white)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.pink)
            }
    }
}

#Preview {
    VStack {
        Text("Hello, World")
            .cardify()
        
        Text("Goodbye, World :(")
            .cardify()
    }
}
