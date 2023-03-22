//
//  File.swift
//
//
//  Created by Samira Omer on 19/03/2023.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class Seller: Model, Content{
    static let schema = "sellers"
    
    @ID(key: .id)
    var id: UUID? //PK
    
    @Field(key: "sname")
    var name: String
    
    @Field(key: "location")
    var location: String
    
    @Field(key: "sector")
    var sector: String
    
    @Field(key: "phoneNumber")
    var phoneNumber: String
    
    @Field(key: "numberOfProducts")
    var numberOfProducts: Int
    
    @Field(key: "companyName")
    var companyName: String
    
    @Field(key: "logo")
    var logo: String
//    @Children(for: \.$seller)
//    var products: [Product]

    
    init(){}
    
    init(id: UUID? = nil, name: String, phoneNumber: String, numberOfProducts: Int, location: String ,  sector: String,  companyName: String, logo: String){
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.numberOfProducts = numberOfProducts
        self.location = location
        self.sector = sector
        self.companyName = companyName
        self.logo = logo
        
    }
}
