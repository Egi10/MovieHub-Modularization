//
//  HomeDependencies.swift
//  Home
//
//  Created by Julsapargi Nursam on 09/04/23.
//

import Foundation
import Core
import Swinject

public class HomeDependencies {
    public static let shared = HomeDependencies()
    
    // ViewModel
    let detailMovieViewModel: DetailMovieViewModel
    public let homeViewModel: HomeViewModel
    
    private init() {
        let container = Container()
        
        // ViewModel
        container.register(DetailMovieViewModel.self) { r in
            DetailMovieViewModel(
                getDetailMovieUseCase: CoreAppDependencies.shared.getDetailMovieUseCase,
                getFavoriteMovieByIdUseCase: CoreAppDependencies.shared.getFavoriteMovieByIdUseCase,
                addFavoriteMovieUseCase: CoreAppDependencies.shared.addFavoriteMovieUseCase,
                deleteFavoriteMovieByIdUseCase: CoreAppDependencies.shared.deleteFavoriteMovieByIdUseCase
            )
        }
        .inObjectScope(.container)
        
        container.register(HomeViewModel.self) { r in
            HomeViewModel(
                getPopularMovieUseCase: CoreAppDependencies.shared.getPopularMovieUseCase,
                getTopRatedMovieUseCase: CoreAppDependencies.shared.getTopRatedMovieUseCase
            )
        }
        
        // View Model
        self.detailMovieViewModel = container.resolve(DetailMovieViewModel.self)!
        self.homeViewModel = container.resolve(HomeViewModel.self)!
    }
}
