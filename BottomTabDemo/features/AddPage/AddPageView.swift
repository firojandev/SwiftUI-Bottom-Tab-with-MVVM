//
//  AddPageView.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import SwiftUI

struct AddPageView: View {

    @EnvironmentObject var navState: NavState
    
    var body: some View {
        VStack {
          
            Spacer()
            
            CommonButtonView(title: "Add", backgroundColor: Color.red, action: {
                
            })
        }
        .background(Color.colorBackground.ignoresSafeArea(.all))
        .navigationTitle("Add")
    }
}

struct AddPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddPageView()
    }
}
