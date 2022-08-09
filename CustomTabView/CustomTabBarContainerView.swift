//
//  CustomTabBarContainerView.swift
//  CustomTabView
//
//  Created by Skorobogatow, Christian on 9/8/22.
//

import SwiftUI


struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    public init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
        
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            
            CustomTabBarview(selection: $selection, tabs: tabs, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
        
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [.home, .favorites , .profile]
    
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
