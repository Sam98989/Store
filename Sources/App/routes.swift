import Vapor

func routes(_ app: Application) throws {
    
    app.get("seller") { Request in
        return Seller.query(on: Request.db).all()
    }
    
    app.get("seller", ":id") { Request in
        let id = Request.parameters.get("id", as: UUID.self)
               return Seller.find(id, on: Request.db)
                   .unwrap(or: Abort(.notFound))
    }

    app.post("seller") { Request in
        let data = try Request.content.decode(Seller.self)
        return data.save(on: Request.db).transform(to: HTTPStatus.ok)
    }
///CORRECT
//    app.put("products", ":id") { req -> EventLoopFuture<Plant> in
//           guard let producrId = req.parameters.get("id", as: UUID.self) else {
//               throw Abort(.badRequest)
//           }
//
//           let updatedProduct = try req.content.decode(Plant.self)
//
//           return Plant.find(producrId, on: req.db)
//               .unwrap(or: Abort(.notFound))
//               .flatMap { product in
//                   product.title = updatedProduct.title
//
//                   return product.update(on: req.db).map { product }
//               }
//       }
    
    
    app.put("seller", ":id") { Request in

        let data = try Request.content.decode(Seller.self)

        return Seller.find(Request.parameters.get("id"), on: Request.db)
            .unwrap(or: Abort(.notFound)).flatMap{
                d in
                d.name = data.name
                d.phoneNumber = data.phoneNumber
                d.numberOfProducts = data.numberOfProducts
                d.location = data.location
                d.sector = data.sector
                d.companyName = data.companyName
                d.logo = data.logo
               
                return d.update(on: Request.db).map{Seller(name:  d.name, phoneNumber:  d.phoneNumber, numberOfProducts:  d.numberOfProducts, location:    d.location , sector:  d.sector, companyName:  d.companyName, logo:     d.logo )}
            }
    }
    
    app.delete("seller", ":id"){Request in
        
  

        return Seller.find(Request.parameters.get("id"), on: Request.db)
            .unwrap(or: Abort(.notFound)).flatMap{
                $0.delete(on: Request.db)
            }.transform(to: HTTPStatus.ok)
        
    }

    
    try app.register(collection: APIController())
}

