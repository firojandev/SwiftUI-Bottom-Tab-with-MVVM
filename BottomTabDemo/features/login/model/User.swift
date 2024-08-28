//
//  User.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import Foundation
struct User: Identifiable, Codable {
    var id = UUID()
    var userId:String? = "RM1"
    var status:String?
    var message:String?
    var mpGroup:String?
    var designation:String?
    var empName:String?
    var locName:String?
    var locCode:String?
    var depotName:String?
    var isTourPartialAllow:String?
    
    enum CodingKeys:String,CodingKey {
        case status = "Status"
        case message = "Message"
        case mpGroup = "MPGroup"
        case designation = "Designation"
        case empName = "EmpName"
        case locCode = "LocCode"
        case locName = "LocName"
        case depotName = "DepotName"
        case isTourPartialAllow = "IsTourPartialAllow"
    }
}
