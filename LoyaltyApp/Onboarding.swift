//
//  Onboarding.swift
//  LoyaltyApp
//
//  Created by Justin Edgington on 1/22/24.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color(hex: "#f53f5d")
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        ZStack {
                            Color.white
                                .clipShape(CurvedTopShape())
                                .ignoresSafeArea()
                            VStack {
                                Text("Discover Rewards,")
                                    .font(.title)
                                Text("Embrace Loyalty")
                                    .font(.title)
                                Spacer().frame(height: geometry.size.height * 0.01)
                                Text("Unlock exclusive perks, earn points effortlessly,")
                                    .font(.subheadline)
                                Text("and indulge in a world of personalized rewards")
                                    .font(.subheadline)
                                Text("Welcome to Loyalty App!")
                                    .font(.subheadline)
                                Spacer()
                                NavigationLink(destination: LoginFlow()) {
                                    Text("Register")
                                }
                                .buttonStyle(.borderedProminent)
                                Button(action: {
                                    print("todo")
                                }) {
                                    Text("Already have an account?")
                                }.buttonStyle(.bordered)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            .padding(.top, geometry.size.height * 0.075)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.45)
                    }
                }
            }
        }
    }
}

struct CurvedTopShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let controlPoint = CGPoint(x: rect.midX, y: rect.minY + rect.height * 0.2)
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY), control: controlPoint)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
#Preview {
    Onboarding()
}
