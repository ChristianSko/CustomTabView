//
//  TabBarItem.swift
//  CustomTabView
//
//  Created by Skorobogatow, Christian on 9/8/22.
//

import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}


enum TabBarItem: Hashable {
    case home, favorites , profile, message
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "heart"
        case .profile:
            return "person"
        case .message:
            return "message"
        }
    }
    
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        case .profile:
            return "Profile"
        case .message:
            return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .red
        case .favorites:
            return .blue
        case .profile:
            return .green
        case .message:
            return .orange
        }
    }
}
