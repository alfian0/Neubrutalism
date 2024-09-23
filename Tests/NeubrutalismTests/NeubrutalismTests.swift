import XCTest
import SwiftUI
import SnapshotTesting
import Neubrutalism

final class NeubrutalismTests: XCTestCase {
	func test_neubrutalismStyleModifier() {
		let view = Text("NeubrutalismStyle")
			.padding(.vertical, 8)
			.padding(.horizontal, 16)
			.modifier(NeubrutalismStyle())
		let vc = UIHostingController(rootView: view)
		assertSnapshot(of: vc, as: .image(on: .iPhoneSe))
	}
	
	func test_neubrutalismButtonStyle() {
		let view = Button {} label: {
			Text("NeubrutalismStyle")
				.padding(.vertical, 12)
				.padding(.horizontal, 24)
				.font(.system(size: 16, weight: .bold)) // Bold, blocky font
		}
			.buttonStyle(NeubrutalismButtonStyle(background: .yellow))
		let vc = UIHostingController(rootView: view)
		assertSnapshot(of: vc, as: .image(on: .iPhoneSe))
	}
	
	func test_neubrutalismTextFieldStyle_notFocused() {
		let view = TextField("NeubrutalismStyle", text: .constant(""))
			.textFieldStyle(NeubrutalismTextFieldStyle(isFocused: false, prefix: Image(uiImage: .actions), suffix: Image(uiImage: .checkmark)))
			.padding(.horizontal, 16)
		let vc = UIHostingController(rootView: view)
		assertSnapshot(of: vc, as: .image(on: .iPhoneSe))
	}
	
	func test_neubrutalismTextFieldStyle_focused() {
		let view = TextField("NeubrutalismStyle", text: .constant(""))
			.textFieldStyle(NeubrutalismTextFieldStyle(isFocused: true, prefix: Image(uiImage: .actions), suffix: Image(uiImage: .checkmark)))
			.padding(.horizontal, 16)
		let vc = UIHostingController(rootView: view)
		assertSnapshot(of: vc, as: .image(on: .iPhoneSe))
	}
}
