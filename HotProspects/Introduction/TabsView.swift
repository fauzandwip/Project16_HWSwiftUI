//
//  TabsView.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 25/07/23.
//

import SwiftUI

struct TabsView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
