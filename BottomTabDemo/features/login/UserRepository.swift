//
//  UserRepository.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 30/9/24.
//

import Foundation
import Combine

class UserRepository: UserRepositoryProtocol {
    
    func login(userId: String, password: String, token: String) -> AnyPublisher<User, Error> {
        var urlComponents = URLComponents(string: "\(AppConstants.apiBaseURL)/login")
        urlComponents?.queryItems = [
            URLQueryItem(name: "UserID", value: userId),
            URLQueryItem(name: "Password", value: password),
            URLQueryItem(name: "Token", value: token)
        ]
        
        guard let url = urlComponents?.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
