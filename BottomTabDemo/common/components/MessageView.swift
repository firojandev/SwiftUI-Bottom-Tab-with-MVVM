//
//  MessageView.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 1/9/24.
//

import SwiftUI

struct MessageView: View {
    var isError:Bool
    var message:String
    
    var body: some View {
        VStack {
            Text(message)
                .font(.title3)
                .foregroundColor(.white)
                .padding()
        }
        .background(isError ? Color.red: Color.green)
        .cornerRadius(10)
        .padding(.horizontal,10)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(isError: true, message: "Error is occured")
    }
}
