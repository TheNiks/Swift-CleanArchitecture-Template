//
//  ProductGlovoTests.swift
//  ProductGlovoTests
//
//  Created by Nikunj Modi on 01/12/25.
//

import Testing
import XCTest
import Foundation
@testable import ProductGlovo

struct ProductGlovoTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

}

final class MockProductsService: ProductsServiceProtocol {
    
    var shouldReturnError = false
    
    func fetchProducts() async throws -> [Product] {
        if shouldReturnError {
            throw URLError(.badServerResponse)
        } else {
            return [
                Product(title: "Test Product 1"),
                Product(title: "Test Product 2")
            ]
        }
    }
}

@MainActor
final class ProductsViewModelTests: XCTestCase {

    var viewModel: ProductsViewModel!
    var mockService: MockProductsService!

    override func setUp() {
        super.setUp()
        mockService = MockProductsService()
        viewModel = ProductsViewModel(service: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }

    func testLoadProductsSuccessfully() async {
        // Given
        mockService.shouldReturnError = false

        // When
        await viewModel.loadProducts()

        // Then
        XCTAssertEqual(viewModel.products.count, 2)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.products.first?.title, "Test Product 1")
    }

    func testLoadProductsFailure() async {
        // Given
        mockService.shouldReturnError = true

        // When
        await viewModel.loadProducts()

        // Then
        XCTAssertEqual(viewModel.products.count, 0)
        XCTAssertNotNil(viewModel.errorMessage)
    }
}
