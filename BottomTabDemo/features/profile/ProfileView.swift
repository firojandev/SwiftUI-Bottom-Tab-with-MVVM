//
//  ProfileView.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var navState: NavState
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            // Top Navbar
            TopbarView(pageTitle: "Profile")
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.user?.empName ?? "")
                            .font(.headline)
                        Text(viewModel.user?.mpGroup ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                    Spacer()
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding(10)
            
            Section {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Link("Privacy Policy", destination: URL(string: "https://your-privacy-url.com")!)
                            .font(.footnote)
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    
                    Divider()
                    
                    HStack {
                        Link("Terms & Conditions", destination: URL(string: "https://your-terms-url.com")!)
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 16)
            } header: {
                HStack {
                    Text("Links")
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            
            CommonButtonView(title: "Logout", backgroundColor: Color.red, action: {
                viewModel.willLogout()
            })
            .padding()
            
            Spacer()
            
            
        }
        .background(Color.colorBackground.ignoresSafeArea(.all))
        .onChange(of: viewModel.isLogout) { isLogout in
            print("isLogout:\(isLogout)")
            if isLogout {
                navigate(to: NavRoute.LoginView)
            }
        }
        .onAppear{
            viewModel.getUser()
        }
        
    }
    
    private func navigate(to route: NavRoute) {
           navState.path.append(route)
       }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
