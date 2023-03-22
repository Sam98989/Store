//
//  File.swift
//  
//
//  Created by Samira Omer on 20/03/2023.
//

import Vapor
import Fluent




//struct User: Content{
//    let name: String
//    let age: Int
//    let address: Address
//}
//struct Address: Content{
//    let country: String
//    let city: String
//
//}

struct APIController: RouteCollection{
    
    func boot(routes: RoutesBuilder) throws{
        let product = routes.grouped("Product")
        //        Products.get("users", use: getUsers)
        product.get(use: index)
        product.get(":ProductID", use: getid)
        product.post(use: create)
        product.delete( ":ProductID",use: delete)
        product.put(use: update)
        //
    }
    
    func index(req: Request) async throws -> [Product] {
    try await Product.query(on: req.db).all()
    }
    //    func create(req: Request) throws -> HTTPStatus {
    //        let products = try req.content.decode(Product.self)
    ////        try await Product.save(on: req.db)
    //        return HTTPStatus.ok
    //    }
    //
    ////    func getUsers(req: Request) throws -> HTTPStatus {
    ////        let Product = try req.content.decode(Product.self)
    ////    }
        func delete(req: Request) async throws -> HTTPStatus {
            guard let pet = try await Product.find(req.parameters.get("ProductID"), on: req.db) else {
                throw Abort(.notFound)
            }
            try await pet.delete(on: req.db)
            return .noContent
        }
    func create(req: Request) async throws -> Product{
        let products = try req.content.decode(Product.self)
        try await products.save(on: req.db)
        return products
    }
    //}
    func update(req: Request) async throws -> HTTPStatus {
    let products = try req.content.decode(Product.self)
    guard let pro = try await Product.find(products.id,on: req.db) else {
    throw Abort(.notFound)
    }
    pro.pname = products.pname
    pro.description = products.description
    pro.price = products.price
   
    try await pro.save(on:req.db)
    return .ok

    }
    func getid(req: Request) async throws -> Product {
    guard let products = try await Product.find(req.parameters.get("ProductID"), on: req.db) else {
    throw Abort(.notFound)
    }
    return products
    }
}
