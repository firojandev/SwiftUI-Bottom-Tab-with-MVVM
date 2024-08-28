//
//  NavState.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 28/8/24.
//

import Foundation
import SwiftUI

class NavState: ObservableObject {
    @Published var path = NavigationPath()
}
