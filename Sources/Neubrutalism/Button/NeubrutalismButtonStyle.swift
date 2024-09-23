//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

/// A custom `ButtonStyle` that applies a "neubrutalism" design to any button in SwiftUI. The style features a bold,
/// blocky look with customizable background color, border color, corner radius, and shadow effects. It also provides a scale
/// animation when the button is pressed.
///
/// The `NeubrutalismButtonStyle` uses the `NeubrutalismStyle` modifier internally to handle the visual styling,
/// and it adds additional behavior such as button press scaling.
///
/// - Parameters:
///   - background: The background color for the button. Defaults to `.white`.
///   - borderColor: The color of the border stroke. Defaults to `.black`.
///   - borderRadius: The corner radius of the button’s border and background. Defaults to `0`, meaning no rounded corners.
///   - lineWidth: The thickness of the border stroke. Defaults to `2`.
///   - offset: The shadow offset for the button’s border, providing depth. Defaults to `4`.
///
/// Example:
/// ```swift
/// Button(action: {
///     // Button action here
/// }) {
///     Text("Press Me")
///         .padding()
/// }
/// .buttonStyle(NeubrutalismButtonStyle(background: .yellow, borderColor: .blue, borderRadius: 12))
/// ```
///
/// This will create a button with the neubrutalist design, featuring a yellow background, blue border, rounded corners, and a bold appearance.
public struct NeubrutalismButtonStyle: ButtonStyle {
	private let background: Color
	private let borderColor: Color
	private let borderRadius: CGFloat
	private let lineWidth: CGFloat
	private let offset: CGFloat
	
	/// Initializes a new instance of the `NeubrutalismButtonStyle`.
	///
	/// - Parameters:
	///   - background: The background color to use for the button. Defaults to `.white`.
	///   - borderColor: The color of the border. Defaults to `.black`.
	///   - borderRadius: The corner radius for the button's border and background. Defaults to `0` (no rounded corners).
	///   - lineWidth: The thickness of the border stroke. Defaults to `2`.
	///   - offset: The offset of the shadow effect, providing a neubrutalist look. Defaults to `4`.
	public init(background: Color = .white, borderColor: Color = .black, borderRadius: CGFloat = 0, lineWidth: CGFloat = 2, offset: CGFloat = 4) {
		self.background = background
		self.borderRadius = borderRadius
		self.lineWidth = lineWidth
		self.offset = offset
		self.borderColor = borderColor
	}
	
	/// Creates the custom body for the button style.
	///
	/// The method adds a background with a shadow, a border with customizable thickness and corner radius, and a scaling animation when the button is pressed.
	///
	/// - Parameter configuration: The current state of the button, including whether it is pressed.
	/// - Returns: A view that applies the neubrutalism button style.
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
