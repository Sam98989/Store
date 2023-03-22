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

final class Product: Model, Content{
    static let schema = "products"
    
    @ID(key: .id)
    var id: UUID? //PK
    
//    @Field(key: "sellerId")
//    var sellerId: UUID?
    
    @Field(key: "pname")
    var pname: String
    
//    @Field(key: "type")
//    var type: String?

    @Field(key: "description")
    var description: String

    @Field(key: "price")
    var price: Double

//    @Field(key: "image")
//    var image: String?
//
//    @Field(key: "quantity")
//    var quantity: Int?
//
//    @Field(key: "status")
//    var status: String?
//
//    @Field(key: "rating")
//    var rating: Double?
//
//
    
    init(){}
    
    init(id: UUID? , pname: String, description: String, price: Double)
    {
        self.id = id
//        self.sellerId = sellerId
        self.pname = pname
//        self.type = type
        self.description = description
        self.price = price
//        self.image = image
//        self.quantity = quantity
//        self.status = status
//        self.rating = rating
        
    }
}
extension Product: Codable {}
