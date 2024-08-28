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
    
    func checkLogin() {
        print("Is calling")
        let user = DatabaseService.shared.getUser()
        if user != nil {
            print("Is called")
            self.isLoggedIn = true
        }
    }
    
    func login() {
        self.isLoading = true
        NetworkService.shared.login(userId: username, password: password,token:"Test1")
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
                
            }, receiveValue:{ user in
                if user.status == "True" {
                    DatabaseService.shared.saveUser(user)
                    self.isLoggedIn = true
                }else{
                    self.isLoggedIn = false
                }
                
                self.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    
}
