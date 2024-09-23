//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

/// A custom `ToggleStyle` that applies a "neubrutalism" design to any `Toggle` in SwiftUI.
/// This toggle style uses a button-like interaction, where the user can toggle between `on` and `off` states. The state is visually
/// represented by different symbols (e.g., checkmark for `on`, minus for `off`).
///
/// - Design: The toggle button uses a thick border with the customizable `NeubrutalismStyle`. The appearance of the toggle
/// changes when it's in the `on` state, with the border and icon switching to the accent color.
///
/// - Parameters:
///   - isOn: The toggle state (`true` for on, `false` for off), which updates the button and icon appearance accordingly.
///
/// Example:
/// ```swift
/// Toggle("Neubrutalism Toggle", isOn: $isOn)
///     .toggleStyle(NeubrutalismToggleStyle())
/// ```
///
/// This will create a toggle with a neubrutalist design, displaying a checkmark when the toggle is on and a minus when it's off.
public struct NeubrutalismToggleStyle: ToggleStyle {
	/// Creates the toggle view using the custom neubrutalism style.
	///
	/// - Parameter configuration: The current state of the toggle, provided by the SwiftUI framework.
	/// - Returns: A view that behaves like a toggle with a neubrutalism style.
	public func makeBody(configuration: Configuration) -> some View {
		let color: Color = configuration.isOn ? .accentColor : .black
		Button(action: {
			configuration.isOn.toggle()
		}, label: {
			Image(systemName: configuration.isOn ? "checkmark" : "minus")
				.frame(maxWidth: 18, maxHeight: 18)
				.padding(.all, 2)
				.foregroundColor(color)
				.modifier(NeubrutalismStyle(borderColor: color))
			
			configuration.label
				.foregroundColor(.black)
		})
	}
}

#Preview {
	Toggle(isOn: .constant(false)) {
		Text("I agree to the term and condition")
			.font(.system(size: 20, weight: .regular)) // Bold, blocky font
	}
	.toggleStyle(NeubrutalismToggleStyle())
	.padding(.horizontal, 16)
}
