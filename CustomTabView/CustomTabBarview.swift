//
//  CustomTabBarview.swift
//  CustomTabView
//
//  Created by Skorobogatow, Christian on 8/8/22.
//

import SwiftUI

struct CustomTabBarview: View {
    
    @Binding var selection: TabBarItem
    let tabs: [TabBarItem]
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    
    var body: some View {
        tabBarVersion2
            .onChange(of: selection) { value in
                withAnimation {
                    localSelection = value
                }
            }
    }
}

struct CustomTabBarview_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [ .home, .favorites , .profile]
    
    static var previews: some View {
        
        VStack {
            Spacer()
            
            CustomTabBarview(selection: .constant(tabs.first!), tabs: tabs, localSelection: tabs.first!)
        }
    }
}


extension CustomTabBarview {
    private func tabview(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : .clear)
        .cornerRadius(10)
    }
    
    private var tabBarVersion1: some View {
        HStack{
            ForEach(tabs, id: \.self) { tab in
                tabview(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(.white).ignoresSafeArea(edges: .bottom)
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}

extension CustomTabBarview {
    
    private func tabview2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "id_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        HStack{
            ForEach(tabs, id: \.self) { tab in
                tabview2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(.white).ignoresSafeArea(edges: .bottom)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}





