//
//  ProfileViewModel.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import Foundation
class ProfileViewModel: ObservableObject {
    
    @Published var user:User?
    @Published var isLogout = false
   
    func getUser() {
           let savedUser = DatabaseService.shared.getUser()
           if savedUser != nil {
               self.user = savedUser
               
           }
       }
       
    
    func willLogout(){
        DatabaseService.shared.clearUserData()
        self.isLogout = true
    }
}
