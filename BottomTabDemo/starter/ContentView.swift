//
//  ContentView.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var navState: NavState
       
    var body: some View {
        NavigationStack(path: $navState.path) {
            VStack {
                if loginViewModel.isLoggedIn {
                    MainTabView().navigationBarBackButtonHidden(true)
                } else {
                    LoginView().navigationBarBackButtonHidden(true)
                }
            }
            .navigationDestination(for: NavRoute.self) { destination in
                switch destination {
                case .LoginView:
                    LoginView().navigationBarBackButtonHidden(true)
                case .MainTabView:
                    MainTabView().navigationBarBackButtonHidden(true)
                case .AddPageView:
                    AddPageView()
                case .TPColleagesView:
                    TPColleagesView()
                    
                }
            }
        }
        .onAppear {
            loginViewModel.checkLogin()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NavState()).environmentObject(LoginViewModel())
    }
}
