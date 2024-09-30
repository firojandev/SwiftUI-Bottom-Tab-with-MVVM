//
//  LoginViewModel.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var username = AppConstants.testUserId
    @Published var password = AppConstants.testPassword
    
    @Published var isLoggedIn = false
    @Published var errorMessage:String?
    
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    
    private let userReposiotry:UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol = UserRepository()){
        self.userReposiotry = userRepository
    }
    
    func checkLogin() {
        print("Is calling")
        let user = DatabaseService.shared.getUser()
        if user != nil {
            print("Is called")
            self.isLoggedIn = true
        }
    }
    
    func login(){
        
        // Validate if the username is empty
        guard !username.isEmpty else {
            self.errorMessage = "User ID cannot be empty"
            return
        }
        
        self.isLoading = true
        userReposiotry.login(userId: username, password: password, token: "Test1")
            .sink(receiveCompletion:{ completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "Network Error: \(error.localizedDescription)"
                }
            },
                  receiveValue: { user in
                if user.status == "True" {
                    DatabaseService.shared.saveUser(user)
                    self.isLoggedIn = true
                } else {
                    self.errorMessage = "Login failed! Try again"
                    self.isLoggedIn = false
                }
            })
            .store(in: &cancellables)
    }
    
//    func login() {
//        self.isLoading = true
//        NetworkService.shared.login(userId: username, password: password,token:"Test1")
//            .sink(receiveCompletion: { completion in
//                self.isLoading = false
//                switch completion {
//                case .finished:
//                    // No error occurred
//                    break
//                case .failure(let error):
//                    self.errorMessage = NetworkError.customErrorMessage(from: error)
//                    break
//                }
//
//            }, receiveValue:{ user in
//                if user.status == "True" {
//                    DatabaseService.shared.saveUser(user)
//                    self.isLoggedIn = true
//                }else{
//                    self.errorMessage = "Login failed! Try again"
//                    self.isLoggedIn = false
//                }
//
//                self.isLoading = false
//            })
//            .store(in: &cancellables)
//    }
    
    
}
