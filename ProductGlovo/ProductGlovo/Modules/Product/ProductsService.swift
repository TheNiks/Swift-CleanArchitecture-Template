//
//  ProductsService.swift
//  ProductGlovo
//
//  Created by Nikunj Modi on 01/12/25.
//
import Foundation

struct Product:Codable {
    let title: String
}

protocol ProductsServiceProtocol {
    func fetchProducts() async throws -> [Product]
}

class ProductsService: ProductsServiceProtocol {
    let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            return []
        }
        return try await networkClient.get(url)
    }
}
