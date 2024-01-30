//
//  ContentView.swift
//  BBQuotes
//
//  Created by Alperen Sarışan on 27.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Text("BB View")
                .tabItem {
                    Label("Breaking Bad", systemImage: "tortoise")
                }
            
            Text("BCS View")
                .tabItem {
                    Label("Better Call Saul", systemImage: "briefcase")
                }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
