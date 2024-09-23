//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

/// A custom `TextFieldStyle` that applies a "neubrutalism" design to any `TextField` in SwiftUI.
/// This style supports focus tracking, as well as optional prefix and suffix images. The text field is styled
/// with customizable background color, border color, corner radius, and shadow effects.
///
/// - Focus behavior: When the text field is focused, the border and images will change color to the app’s accent color.
///
/// - Parameters:
///   - isFocused: Tracks whether the text field is focused. Defaults to `false`.
///   - prefix: An optional image displayed before the text field. Defaults to `nil`.
///   - suffix: An optional image displayed after the text field. Defaults to `nil`.
///   - background: The background color of the text field. Defaults to `.white`.
///   - borderColor: The border color of the text field when not focused. Defaults to `.black`.
///   - borderRadius: The corner radius for the text field’s background and border. Defaults to `0`, meaning no rounded corners.
///   - lineWidth: The thickness of the border stroke. Defaults to `2`.
///   - offset: The shadow offset, providing depth for the text field. Defaults to `4`.
///
/// Example:
/// ```swift
/// TextField("Enter text", text: $input)
///     .textFieldStyle(NeubrutalismTextFieldStyle(prefix: Image(systemName: "magnifyingglass"), suffix: Image(systemName: "xmark")))
/// ```
///
/// This will create a text field with a prefix icon, a suffix icon, and a neubrutalist design. The border and icons
/// change color when the text field is focused.
public struct NeubrutalismTextFieldStyle: TextFieldStyle{
	@State private var isFocused: Bool // Track focus state
	private let prefix: Image?
	private let suffix: Image?
	
	private let background: Color
	private let borderColor: Color
	private let borderRadius: CGFloat
	private let lineWidth: CGFloat
	private let offset: CGFloat
	
	/// Initializes a new instance of the `NeubrutalismTextFieldStyle`.
	///
	/// - Parameters:
	///   - isFocused: Whether the text field is focused or not. Defaults to `false`.
	///   - prefix: An optional image to be placed before the text field. Defaults to `nil`.
	///   - suffix: An optional image to be placed after the text field. Defaults to `nil`.
	///   - background: The background color of the text field. Defaults to `.white`.
	///   - borderColor: The border color of the text field when not focused. Defaults to `.black`.
	///   - borderRadius: The corner radius of the text field’s border and background. Defaults to `0`.
	///   - lineWidth: The thickness of the border stroke. Defaults to `2`.
	///   - offset: The shadow’s offset for the text field border, providing depth. Defaults to `4`.
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
	
	/// Defines the body of the text field style, applying the custom layout and modifier.
	///
	/// This function adds a background with shadow and border to the text field, with optional prefix and suffix icons.
	/// It tracks the focus state, and when focused, the border color and icon colors change to the accent color.
	///
	/// - Parameter configuration: The current state and content of the text field.
	/// - Returns: A view that applies the neubrutalism text field style with optional icons and focus tracking.
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
