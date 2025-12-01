//
//  NetworkClient.swift
//  ProductGlovo
//
//  Created by Nikunj Modi on 01/12/25.
//
import Foundation

protocol NetworkClientProtocol {
    func get<T: Decodable>( _ url: URL) async throws -> T
}

final class NetworkClient: NetworkClientProtocol {
    func get<T: Decodable>( _ url: URL) async throws -> T {
        let(data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw URLError(.badServerResponse)
            }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
