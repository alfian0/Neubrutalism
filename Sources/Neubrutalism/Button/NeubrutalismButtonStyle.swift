//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

public struct NeubrutalismButtonStyle: ButtonStyle {
	private let background: Color
	private let borderColor: Color
	private let borderRadius: CGFloat
	private let lineWidth: CGFloat
	private let offset: CGFloat
	
	public init(background: Color = .white, borderColor: Color = .black, borderRadius: CGFloat = 0, lineWidth: CGFloat = 2, offset: CGFloat = 4) {
		self.background = background
		self.borderRadius = borderRadius
		self.lineWidth = lineWidth
		self.offset = offset
		self.borderColor = borderColor
	}
	
	public func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(minHeight: 44)
			.modifier(NeubrutalismStyle(background: background, borderColor: borderColor, borderRadius: borderRadius, lineWidth: lineWidth, offset: offset))
			.scaleEffect(configuration.isPressed ? 0.95 : 1.0)
			.animation(.easeOut(duration: 0.2), value: configuration.isPressed)
	}
}

#Preview {
	Button {} label: {
		Text("NeubrutalismStyle")
			.padding(.vertical, 12)
			.padding(.horizontal, 24)
			.font(.system(size: 16, weight: .bold)) // Bold, blocky font
	}
	.buttonStyle(NeubrutalismButtonStyle(background: .yellow))
}
