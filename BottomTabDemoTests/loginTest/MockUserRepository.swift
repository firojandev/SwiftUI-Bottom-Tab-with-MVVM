//
//  MockUserRepository.swift
//  BottomTabDemoTests
//
//  Created by Md Altaf Hoshain Firoj on 30/9/24.
//

import XCTest
import Combine
@testable import BottomTabDemo

class MockUserRepository: UserRepositoryProtocol {
    var loginResult: Result<User,Error>
    
    init(loginResult:Result<User,Error>){
        self.loginResult = loginResult
    }
    
    // Default initializer with a no-op success
    convenience init() {
        self.init(loginResult: .success(User(userId: "TestUser", status: "True")))
    }

    
    func login(userId: String, password: String, token: String) -> AnyPublisher<User, Error> {
        return loginResult.publisher.eraseToAnyPublisher()
    }
    
}
