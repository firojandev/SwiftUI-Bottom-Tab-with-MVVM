//
//  HomeView.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navState: NavState
    var body: some View {
        VStack {
            // Top Navbar
            TopbarView(pageTitle: "Home",actionTitle: "Add",action: {
                navState.path.append(NavRoute.AddPageView)
            })
            Spacer()
            // Body
            VStack {
                Text("Home View")
                    .font(.title)
                    .padding()
                
                // Additional content here
            }
            .padding()
        }
        .background(Color.colorBackground.ignoresSafeArea(.all))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
