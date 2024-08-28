//
//  ColleageModel.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import Foundation
struct ColleageModel: Identifiable {
    var id = UUID()
    var userId:String
    var name:String
    var designation:String
    var market:String
    
    init(userId: String, name: String, designation: String, market: String) {
        self.userId = userId
        self.name = name
        self.designation = designation
        self.market = market
    }
}
