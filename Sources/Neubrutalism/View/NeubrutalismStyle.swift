//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

public struct NeubrutalismStyle: ViewModifier {
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
	
	public func body(content: Content) -> some View {
		content
			.background(
				background // Bright background color
					.cornerRadius(borderRadius) // Rounded corners (optional)
					.shadow(color: borderColor.opacity(0.8), radius: 0, x: offset, y: offset) // Offset shadow
			)
			.overlay(
				RoundedRectangle(cornerRadius: borderRadius)
					.stroke(borderColor, lineWidth: lineWidth) // Thick border stroke
			)
	}
}

#Preview {
	Text("NeubrutalismStyle")
		.padding(.vertical, 8)
		.padding(.horizontal, 16)
		.modifier(NeubrutalismStyle())
}
