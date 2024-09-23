//
//  SwiftUIView.swift
//  
//
//  Created by Alfian on 23/09/24.
//

import SwiftUI

struct NeubrutalismView: View {
    var body: some View {
			VStack {
				List {
					VStack(alignment: .leading, spacing: 8) {
						HStack() {
							Text("Important!")
								.font(.system(size: 20, weight: .bold))
							
							Spacer()
							
							Button {} label: {
								Image(systemName: "arrow.right")
							}
						}
						
						Text("Edited on Sat, 12:05 ")
							.foregroundColor(.gray)
							.font(.subheadline)
						
						Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in rutrum metus. Pellentesque commodo ante neque, eu hendrerit lorem gravida et. Aliquam scelerisque...")
					}
					.padding(.all, 16)
					.frame(maxHeight: 161)
					.modifier(NeubrutalismStyle())
					
					HStack(spacing: 8) {
						Color.gray.opacity(0.4)
						
						VStack(alignment: .leading, spacing: 8) {
							HStack() {
								Text("Design Mood")
									.font(.system(size: 20, weight: .bold))
								
								Spacer()
								
								Button {} label: {
									Image(systemName: "arrow.right")
								}
							}
							
							Text("Edited on Sat, 12:05 ")
								.foregroundColor(.gray)
								.font(.subheadline)
							
							Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in rutrum metus....")
						}
						.padding(.all, 8)
						.padding(.trailing, 16)
					}
					.frame(maxHeight: 161)
					.modifier(NeubrutalismStyle())
				}
				.listStyle(.plain)
				
				Spacer()
				
				Button {} label: {
					Text("NeubrutalismStyle")
						.frame(maxWidth: .infinity)
						.font(.system(size: 16, weight: .bold)) // Bold, blocky font
				}
				.padding(.vertical, 16)
				.padding(.horizontal, 16)
				.buttonStyle(NeubrutalismButtonStyle(background: .yellow))
			}
    }
}

#Preview {
	NeubrutalismView()
}
