//
//  NetworkService.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import Foundation
import Combine

class NetworkService {
    static let shared = NetworkService()
    
    func login(userId:String,password:String,token:String) -> AnyPublisher<User, Error> {
        
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
                
                let responseDataString = String(data: data, encoding: .utf8)
                print("Response Data: \(responseDataString ?? "No Data")")
                
                return data
            }
            .decode(type: User.self, decoder: JSONDecoder())
            .tryMap { user in
                var modifiedUser = user
                modifiedUser.userId = userId
                print("modified user \(modifiedUser)")
                return modifiedUser
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
