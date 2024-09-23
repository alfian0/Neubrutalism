//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

/// A SwiftUI `ViewModifier` that applies a custom "neubrutalism" style to any view. This style typically
/// includes a bold, blocky appearance with strong borders, shadows, and customizable backgrounds.
///
/// The `NeubrutalismStyle` allows you to easily apply this design language by setting key styling parameters such as background color, border color, corner radius, line width, and shadow offset.
///
/// - Parameters:
///   - background: The background color for the view. Default is `.white`.
///   - borderColor: The color of the border stroke. Default is `.black`.
///   - borderRadius: The corner radius of the background and border. Default is `0`, meaning no rounded corners.
///   - lineWidth: The thickness of the border stroke. Default is `2`.
///   - offset: The amount of offset for the shadow, which adds depth to the design. Default is `4`.
///
/// Example:
/// ```swift
/// Text("Neubrutalism Button")
///     .padding()
///     .modifier(NeubrutalismStyle(background: .yellow, borderColor: .blue, borderRadius: 12))
/// ```
///
/// This will create a text view with the custom neubrutalism styling, a yellow background, blue border, and rounded corners.
public struct NeubrutalismStyle: ViewModifier {
	private let background: Color
	private let borderColor: Color
	private let borderRadius: CGFloat
	private let lineWidth: CGFloat
	private let offset: CGFloat
	
	/// Initializes a new instance of the `NeubrutalismStyle` modifier.
	///
	/// - Parameters:
	///   - background: The background color to use for the view. Defaults to `.white`.
	///   - borderColor: The color of the border. Defaults to `.black`.
	///   - borderRadius: The corner radius for both the background and the border. Defaults to `0` (no rounded corners).
	///   - lineWidth: The thickness of the border stroke. Defaults to `2`.
	///   - offset: The offset of the shadow effect, providing a neubrutalist look. Defaults to `4`.
	public init(background: Color = .white, borderColor: Color = .black, borderRadius: CGFloat = 0, lineWidth: CGFloat = 2, offset: CGFloat = 4) {
		self.background = background
		self.borderRadius = borderRadius
		self.lineWidth = lineWidth
		self.offset = offset
		self.borderColor = borderColor
	}
	
	/// The method that applies the neubrutalism styling to the content view.
	///
	/// This adds a background color with an optional corner radius, an offset shadow, and a thick border stroke.
	///
	/// - Parameter content: The view to which the style will be applied.
	/// - Returns: A modified view with the neubrutalism style applied.
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
