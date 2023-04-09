//
//  FavoriteDependencies.swift
//  Favorite
//
//  Created by Julsapargi Nursam on 09/04/23.
//

import Foundation
import Core
import Swinject

public class FavoriteDependencies {
    public static let shared = FavoriteDependencies()
    
    // ViewModel
    let detailFavoriteViewModel: DetailFavoriteViewModel
    public let favoriteViewModel: FavoriteViewModel
    
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
