//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

public struct NeubrutalismTextFieldStyle: TextFieldStyle{
	@State private var isFocused: Bool // Track focus state
	private let prefix: Image?
	private let suffix: Image?
	
	private let background: Color
	private let borderColor: Color
	private let borderRadius: CGFloat
	private let lineWidth: CGFloat
	private let offset: CGFloat
	
	public init(isFocused: Bool = false, prefix: Image? = nil, suffix: Image? = nil, background: Color = .white, borderColor: Color = .black, borderRadius: CGFloat = 0, lineWidth: CGFloat = 2, offset: CGFloat = 4) {
		self.isFocused = isFocused
		self.prefix = prefix
		self.suffix = suffix
		self.background = background
		self.borderRadius = borderRadius
		self.lineWidth = lineWidth
		self.offset = offset
		self.borderColor = borderColor
	}
	
	public func _body(configuration: TextField<Self._Label>) -> some View {
		let color = isFocused ? .accentColor : borderColor
		HStack {
			prefix?
				.renderingMode(.template)
				.foregroundColor(color)
			configuration
				.onTapGesture {
					isFocused.toggle() // Toggle focus state on tap
				}
				.onDisappear {
					isFocused = false // Reset on disappear
				}
			suffix?
				.renderingMode(.template)
				.foregroundColor(color)
		}
		.padding(.vertical, 8)
		.padding(.horizontal, 8)
		.frame(minHeight: 44)
		.modifier(NeubrutalismStyle(background: background, borderColor: borderColor, borderRadius: borderRadius, lineWidth: lineWidth, offset: offset))
	}
}

#Preview {
	HStack {
		TextField("NeubrutalismStyle", text: .constant(""))
			.textFieldStyle(NeubrutalismTextFieldStyle(isFocused: false, prefix: Image(uiImage: .actions), suffix: Image(uiImage: .checkmark)))
		Button {
			
		} label: {
			Text("Oke")
				.padding(.vertical, 8)
				.padding(.horizontal, 16)
				.font(.system(size: 16, weight: .bold)) // Bold, blocky font
		}
		.buttonStyle(NeubrutalismButtonStyle(background: .yellow))
	}
	.padding(.horizontal, 16)
}
