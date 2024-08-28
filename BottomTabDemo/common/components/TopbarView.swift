//
//  TopbarView.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import SwiftUI

struct TopbarView: View {
    var pageTitle: String
    var actionTitle: String?
    var action: (() -> Void)?  // Make the action closure optional
    
    var body: some View {
        HStack {
            Text(pageTitle)
                .font(.headline)
                .padding()
            Spacer()
            if let actionTitle = actionTitle, let action = action {
                Button(action: action) {
                    Text(actionTitle)
                        .padding()
                }
            }
        }
        .background(Color.purple.opacity(0.2))
        .foregroundColor(.black)
    }
}

struct TopbarView_Previews: PreviewProvider {
    static var previews: some View {
        TopbarView(pageTitle: "Home", actionTitle: "Add", action: {
            // Action code here
        })
    }
}
