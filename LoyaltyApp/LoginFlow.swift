//
//  CustomerRegView.swift
//  LoyaltyApp
//
//  Created by Justin Edgington on 1/23/24.
//

import SwiftUI

struct LoginFlow: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMeEnabled: Bool = false
    @State private var isLoggedIn: Bool? = false
    @State private var showingAlert = false
    let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Text("Welcome Back! 👋")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    .padding([.top, .leading, .trailing])
                    HStack {
                        Text("Sign in for Exclusive Rewards.")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .padding([.bottom, .leading, .trailing])
                }
                
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                        .padding(.leading)
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .clipShape(RoundedRectangle(cornerRadius: UIScreen.main.bounds.height * 0.015))
                        .textContentType(.emailAddress)
                }
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                        .padding(.leading)
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .clipShape(RoundedRectangle(cornerRadius: UIScreen.main.bounds.height * 0.015))
                        .textContentType(.password)
                }
                HStack {
                    Toggle("Remember Me", isOn: $rememberMeEnabled)
                        .toggleStyle(CheckboxToggleStyle())
                        .bold()
                    Spacer()
                    NavigationLink(destination: ForgotPassword()) {
                        Text("Forgot Password?")
                            .foregroundColor(Color(hex: "#f53f5d"))
                            .bold()
                    }
                }.padding()
                Spacer().frame(height: UIScreen.main.bounds.height * 0.05)
                NavigationLink(tag: true, selection: $isLoggedIn) {
                    MainView()
                } label: {
                    EmptyView()
                }
                Button(action: {
                    login()
                }) {
                    Text("Sign in")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                            .background(Color(hex: "#f53f5d"))
                            .clipShape(Capsule())
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Incorrect credentials"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
    
    private func login() {
        
        let urlStr = "http://localhost:8081/users/login?email=\(email)&password=\(password)"
        guard let url = URL(string: urlStr) else {
            print("Invalid URL")
            return
        }
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let jwt = try JSONDecoder().decode(JWT.self, from: data)
                    defaults.setValue(jwt.jwt, forKey: "jwt")
                    print("Value in defaults: \(String(describing: defaults.value(forKey: "jwt")))")
                    DispatchQueue.main.async {
                        self.isLoggedIn = true
                    }
                    if (self.rememberMeEnabled) {
                        defaults.setValue(true, forKey: "rememberSession")
                    }
                } catch {
                    print("Error: \(error)")
                    DispatchQueue.main.async {
                        self.showingAlert = true
                    }
                }
            }
        }
        
        task.resume()
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.width * 0.05)
                .foregroundColor(configuration.isOn ? Color(hex: "#f53f5d") : Color(hex: "#f53f5d"))
                .onTapGesture {
                    withAnimation(.linear(duration: 0.2)) {
                        configuration.isOn.toggle()
                    }
                }
            configuration.label
        }
    }
}

#Preview {
    LoginFlow()
}
