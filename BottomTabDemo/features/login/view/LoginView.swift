//
//  LoginView.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    @ObservedObject var viewModel = LoginViewModel()
    
    @EnvironmentObject var navState: NavState
    
    @State private var rememberMe = false
    
    @State private var showToast = false
    
    var body: some View {
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 100)
                    VStack(spacing: 16) {
                        Text("Login to your account")
                            .font(.largeTitle)
                            .fontWeight(.none)
                        
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                            TextField("User ID", text: $viewModel.username)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                            SecureField("Password", text: $viewModel.password)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                        }
                        
                        HStack {
                            Toggle(isOn: $rememberMe) {
                                Text("Remember Me")
                            }
                            Spacer()
                        }
                        if viewModel.isLoading {
                            ProgressView("Please wait...").foregroundColor(Color.purple)
                        }
                        
                        if viewModel.errorMessage != nil &&  viewModel.errorMessage != "" {
                            MessageView(isError: true, message: viewModel.errorMessage ?? "")
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        withAnimation {
                                            viewModel.errorMessage = ""
                                        }
                                    }
                                }
                        }
                        
                        Button(action: {
                            if networkMonitor.isConnected {
                                viewModel.login()
                                showToast = false
                            }else{
                                print("Not connected")
                                showToast = true
                            }
                           
                        }) {
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .toast(isShowing: $showToast, message: "Not connected to internet")
                        
                        
                        Text("Version 1.0.0")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
            }
            .background(Color(.systemGray5).edgesIgnoringSafeArea(.all))
            .onChange(of: viewModel.isLoggedIn) { isLoggedIn in
                print("isLoggedIn:\(isLoggedIn)")
                if isLoggedIn {
                    navState.path.append(NavRoute.MainTabView)
                }
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(NavState())
            .environmentObject(LoginViewModel())
    }
}

