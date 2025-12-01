//
//  ProductsViewModel.swift
//  ProductGlovo
//
//  Created by Nikunj Modi on 21/11/25.
//

import Foundation
import Combine

final class ProductsViewModel {
    
    private let service: ProductsServiceProtocol
    
    @Published private(set) var products: [Product] = []
    @Published private(set) var errorMessage: String?
    
    init(service:ProductsServiceProtocol) {
        self.service = service
    }
    
    func loadProducts() async {
        do {
            products = try await service.fetchProducts()
            print(products)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
