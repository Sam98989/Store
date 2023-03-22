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
struct Createsellers: Migration{
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("sellers")
            .id()
            
            .field("sname", .string)
            
            .field("location", .string)
            .field("sector", .string)
            .field("phoneNumber", .string)
            .field("numberOfProducts", .int)
            .field("companyName", .string)
            .field("logo", .string)
          
        
            .create()
        
    }
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("sellers").delete()
    }
}
