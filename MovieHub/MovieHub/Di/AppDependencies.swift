//
//  AppDependencies.swift
//  MovieHub
//
//  Created by Julsapargi Nursam on 20/03/23.
//

import Foundation
import Swinject
import RealmSwift
import Core

class AppDependencies {
    static let shared = AppDependencies()
    
    // ViewModel
    let detailFavoriteViewModel: DetailFavoriteViewModel
    let favoriteViewModel: FavoriteViewModel
    
    private init() {
        let container = Container()
        
        container.register(DetailFavoriteViewModel.self) { r in
            DetailFavoriteViewModel(
                getFavoriteMovieByIdUseCase: CoreAppDependencies.shared.getFavoriteMovieByIdUseCase,
                deleteFavoriteMovieByIdUseCase: CoreAppDependencies.shared.deleteFavoriteMovieByIdUseCase,
                addFavoriteMovieUseCase: CoreAppDependencies.shared.addFavoriteMovieUseCase
            )
        }
        
        container.register(FavoriteViewModel.self) { r in
            FavoriteViewModel(
                getFavoriteMovieUseCase: CoreAppDependencies.shared.getFavoriteMovieUseCase
            )
        }
        
        // View Model
        self.detailFavoriteViewModel = container.resolve(DetailFavoriteViewModel.self)!
        self.favoriteViewModel = container.resolve(FavoriteViewModel.self)!
    }
}
