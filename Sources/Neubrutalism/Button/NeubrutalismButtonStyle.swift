//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

public struct NeubrutalismButtonStyle: ButtonStyle {
	private let background: Color
	
	public init(background: Color = .accentColor) {
		self.background = background
	}
	
	public func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(minHeight: 44)
			.modifier(NeubrutalismStyle(background: background))
			.scaleEffect(configuration.isPressed ? 0.95 : 1.0)
			.animation(.easeOut(duration: 0.2), value: configuration.isPressed)
	}
}

#Preview {
	Button {
		
	} label: {
		Text("NeubrutalismStyle")
			.padding(.vertical, 12)
			.padding(.horizontal, 24)
			.font(.system(size: 16, weight: .bold)) // Bold, blocky font
	}
	.buttonStyle(NeubrutalismButtonStyle(background: .yellow))
}
