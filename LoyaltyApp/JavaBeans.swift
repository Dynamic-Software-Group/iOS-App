//
//  JavaBeans.swift
//  LoyaltyApp
//
//  Created by Justin Edgington on 1/22/24.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let passwordHash: String
    let role: String
    let ownsBusiness: Int // The amound owned
    let businesses: [Business]
    let workingForBusinesses: [Business]
    let numOfBusinessesWorksFor: Int
    let points: [Points]
}

struct Business: Codable {
    let id: Int
    let owner: User?
    let workers: [User]
    let name: String
    let description: String
    let icon: String
    let address: String
    let city: String
    let state: String
    let zip: String
}

struct Points: Codable {
    let id: Int
    let businessId: Int
    let points: Int  
}
