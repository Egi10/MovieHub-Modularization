//
//  DashboardPageView.swift
//  MovieHub
//
//  Created by Julsapargi Nursam on 20/03/23.
//

import SwiftUI
import Profile
import Home
import Favorite

struct DashboardPageView: View {
    var body: some View {
        let favoriteDependencies = FavoriteDependencies.shared
        let homeDependencies = HomeDependencies.shared
        
        TabView {
            HomePageView()
                .environmentObject(homeDependencies.homeViewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            FavoritePageView()
                .environmentObject(favoriteDependencies.favoriteViewModel)
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
