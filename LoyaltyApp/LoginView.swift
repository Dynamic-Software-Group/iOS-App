//
//  LoginView.swift
//  LoyaltyApp
//
//  Created by Justin Edgington on 1/22/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var isLoading = true
    let defaults = UserDefaults.standard
    
    var body: some View {
        Group {
            if isLoading {
                Text("Loading...")
            } else if isLoggedIn {
                MainView()
            } else {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                TextField("Password", text: $password)
                    .textContentType(.password)
                
                Button(action: {
                    isLoading = true
                    login()
                }) {
                    Text("Submit")
                }
                
            }
        }.onAppear(perform: {
            if defaults.string(forKey: "jwt") != nil {
                isLoggedIn = true
            }
            isLoading = false
        })
   }
    
    func login() {
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
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        
        task.resume()
    }
}

struct JWT: Codable {
    let jwt: String
}

#Preview {
    LoginView()
}
