//
//  File.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

public struct NeubrutalismToggleStyle: ToggleStyle {
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
