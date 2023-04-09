//
//  DashboardPageView.swift
//  MovieHub
//
//  Created by Julsapargi Nursam on 20/03/23.
//

import SwiftUI
import Profile
import Home

struct DashboardPageView: View {
    var body: some View {
        let dependencies = AppDependencies.shared
        let homeDependencies = HomeDependencies.shared
        
        TabView {
            HomePageView()
                .environmentObject(homeDependencies.homeViewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            FavoritePageView()
                .environmentObject(dependencies.favoriteViewModel)
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
            
            ProfilePageView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct DashboardPageView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardPageView()
    }
}
