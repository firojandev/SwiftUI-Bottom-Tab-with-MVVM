//
//  UserRepositoryProtocol.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 30/9/24.
//

import Foundation
import Combine

protocol UserRepositoryProtocol {
    func login(userId: String, password: String, token: String) -> AnyPublisher<User, Error>
}
