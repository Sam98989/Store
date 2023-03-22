//
//  File.swift
//
//
//  Created by Samira Omer on 19/03/2023.
//
import Vapor
import Fluent
import FluentPostgresDriver
import Foundation
struct CreateProduct: Migration{
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("products")
            .id()
//            .field("sellerId", .uuid)
            .field("pname", .string)
            
//            .field("type", .string)
            .field("description", .string)
            .field("price", .double)
//            .field("image", .string)
//            .field("quantity", .int)
//            .field("status", .string)
//            .field("rating", .double)
            .create()
        
    }
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("products").delete()
    }
}
