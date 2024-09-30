//
//  LoginViewModelTests.swift
//  BottomTabDemoTests
//
//  Created by Md Altaf Hoshain Firoj on 30/9/24.
//

import XCTest
import Combine
@testable import BottomTabDemo

class LoginViewModelTests: XCTestCase {
    
    private var viewModel: LoginViewModel!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = nil
    }
    
    func testLoginSuccess(){
        let mockUser = User(userId: "RM1",status: "True")
        let mockRepository = MockUserRepository(loginResult: .success(mockUser))
        
        let expectation = XCTestExpectation(description: "User login success")
        
        viewModel = LoginViewModel(userRepository: mockRepository)

        viewModel?.$isLoading.sink { isLoggedIn in
            
            if isLoggedIn  {
                XCTAssertTrue((isLoggedIn))
                XCTAssertNil(self.viewModel.errorMessage)
                expectation.fulfill()
            }
            
        }
        .store(in: &cancellables)
        
        viewModel.login()
        
        wait(for: [expectation],timeout: 2.0)

    }
    
//    func testLoginFailed() {
//        // Simulate an error (e.g., wrong credentials or network error)
//        let mockError = URLError(.badServerResponse)
//        let mockRepository = MockUserRepository(loginResult: .failure(mockError))
//
//        let expectation = XCTestExpectation(description: "User login failure")
//
//        // Initialize the ViewModel with the mock repository
//        viewModel = LoginViewModel(userRepository: mockRepository)
//
//        // Observe the error message and isLoggedIn state
//        viewModel?.$errorMessage.sink { errorMessage in
//            if let errorMessage = errorMessage {
//                XCTAssertEqual(errorMessage, NetworkError.customErrorMessage(from: mockError))
//                XCTAssertFalse(self.viewModel.isLoggedIn)
//                expectation.fulfill()
//            }
//        }
//        .store(in: &cancellables)
//
//        // Trigger the login function
//        viewModel.login()
//
//        // Wait for the expectation to be fulfilled
//        wait(for: [expectation], timeout: 2.0)
//    }
    
    func testLoginWithEmptyUserId() {
        let expectation = XCTestExpectation(description: "Login with empty user ID fails")
        
        // Initialize the ViewModel with a mock repository (if necessary)
        viewModel = LoginViewModel(userRepository: MockUserRepository())
        
        // Set up empty credentials
        viewModel.username = "" // Empty user ID
        viewModel.password = "somePassword" // A valid password
        
        // Observe the errorMessage and isLoggedIn state
        viewModel.$errorMessage
            .dropFirst() // Ignore the initial value
            .sink { errorMessage in
                if let errorMessage = errorMessage {
                    XCTAssertEqual(errorMessage, "User ID cannot be empty") // Check for the correct error message
                    XCTAssertFalse(self.viewModel.isLoggedIn) // Ensure not logged in
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        // Trigger the login function
        viewModel.login()
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 2.0)
    }


    


}
