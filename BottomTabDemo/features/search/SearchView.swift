//
//  SearchView.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var navState: NavState
    
    var colleagesList: [ColleageModel] = [
        ColleageModel(
        userId: "MIO1", name: "MIO Name1", designation: "MIO", market: "MIO Market 1"
        ),
        ColleageModel(
        userId: "MIO2", name: "MIO Name2", designation: "MIO", market: "MIO Market 2"
        )
    ]

    var body: some View {
        VStack {
            // Top Navbar
            TopbarView(pageTitle: "Search",actionTitle: "Add",action: {
                
            })
            Spacer()
            // Body
            VStack {
                ScrollView {
                    ForEach(colleagesList){ colleage in
                        TpColleageRowView(colleageModel: colleage,userAction: {
                            navState.path.append(NavRoute.TPColleagesView)
                        })
                    }
                }
            }
            .padding()
        }
        .background(Color.colorBackground.ignoresSafeArea(.all))
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
