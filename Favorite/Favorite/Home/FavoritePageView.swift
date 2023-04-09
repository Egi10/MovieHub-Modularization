//
//  FavoritePageView.swift
//  Favorite
//
//  Created by Julsapargi Nursam on 09/04/23.
//

import SwiftUI

public struct FavoritePageView: View {
    public init() {}
    
    @EnvironmentObject var viewModel: FavoriteViewModel
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    public var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Favorite List")
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                
                if case .loading = viewModel.favorite {
                    ProgressView()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                } else if case .success(let data) = viewModel.favorite {
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout) {
                            ForEach(data, id: \.self) { movie in
                                NavigationLink {
                                    let dependencies = FavoriteDependencies.shared
                                    
                                    DetailFavoritePageView(
                                        idMovie: movie.id,
                                        name: movie.title
                                    )
                                    .environmentObject(dependencies.detailFavoriteViewModel)
                                    .toolbar(.hidden, for: .tabBar)
                                } label: {
                                    MovieFavoriteItemView(
                                        image: movie.image,
                                        name: movie.title,
                                        releaseDate: movie.release,
                                        rating: movie.voteAverange
                                    )
                                }
                            }
                            .padding(.horizontal, 4)
                        }.padding(.horizontal, 16)
                    }
                } else if case .empty = viewModel.favorite {
                    Text("Empty")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                } else if case .error = viewModel.favorite {
                    Text("Ops, There is an error")
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .onAppear {
                self.viewModel.getFavoriteMovie()
            }
        }
    }
}

struct FavoritePageView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePageView()
            .environmentObject(FavoriteDependencies.shared.favoriteViewModel)
    }
}
