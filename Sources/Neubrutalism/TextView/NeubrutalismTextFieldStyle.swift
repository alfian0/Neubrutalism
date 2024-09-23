//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

public struct NeubrutalismTextFieldStyle: TextFieldStyle{
	@State private var isFocused: Bool // Track focus state
	private let borderColor: Color
	private let prefix: Image?
	private let suffix: Image?
	
	public init(isFocused: Bool = false, borderColor: Color = .black, prefix: Image? = nil, suffix: Image? = nil) {
		self.isFocused = isFocused
		self.borderColor = borderColor
		self.prefix = prefix
		self.suffix = suffix
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
		.modifier(NeubrutalismStyle(borderColor: color))
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
