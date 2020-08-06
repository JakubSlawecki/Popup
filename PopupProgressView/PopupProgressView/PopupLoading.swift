//
//  PopupProgressView.swift
//  PopupProgressView
//
//  Created by Jakub Slawecki on 06/08/2020.
//  Copyright © 2020 Jakub Slawecki. All rights reserved.
//

import SwiftUI

struct PopupLoading: View {
    @State var showLoadingView = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Button(
                    action: {
                        withAnimation {
                            self.showLoadingView.toggle()
                        }
                }) {
                    Text("Popup with loading view")
                }
            }
            
            if showLoadingView {
                LoadingView(placeholder: "Loading")
            }
        }
    }
}

struct PopupProgressView_Previews: PreviewProvider {
    static var previews: some View {
        PopupLoading()
    }
}

struct LoadingView: View {
    @State var animate = false
    
    var placeholder: String
    
    var body: some View {
        VStack(spacing: 28) {
            Circle()
                .stroke(
                    AngularGradient(
                        gradient: Gradient(
                            colors: [Color.primary, Color.primary.opacity(0)]),
                        center: .center))
                .frame(width: 80, height: 80)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
            
            Text(placeholder)
                .fontWeight(.bold)
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 35)
        .background(SystemMaterial(style: .systemMaterial))
        .cornerRadius(20)
        .onAppear {
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
               self.animate.toggle()
            }
        }
    }
}

// System Material view for SiwftUI..

struct SystemMaterial: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<SystemMaterial>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SystemMaterial>) {}
}
