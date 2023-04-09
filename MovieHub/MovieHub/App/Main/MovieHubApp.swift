//
//  MovieHubApp.swift
//  MovieHub
//
//  Created by Julsapargi Nursam on 18/03/23.
//

import SwiftUI
import netfox

@main
struct MovieHubApp: App {
    
    init() {
    #if DEBUG
        NFX.sharedInstance().start() // in didFinishLaunchingWithOptions:
    #endif
    }
    var body: some Scene {
        WindowGroup {
            DashboardPageView()
        }
    }
}
