import Vapor

func routes(_ app: Application) throws {
    
    // localhost: 8080/planets POST
    
//    app.post("products"){  req -> EventLoopFuture<Product> in
//        
//        let product = try req.content.decode(Product.self)
//        
//        return product.create(on: req.db).map {product}
//        
//    }

//    app.post("sellers") { (req: Request) throws -> HTTPStatus {
//        let sellerInfo = try req.content.decode(Seller.self)
//
//        return HTTPStatus.ok
//
    
    try app.register(collection: APIController())
}

