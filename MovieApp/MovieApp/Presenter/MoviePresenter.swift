//
//  MoviePresenter.swift
//  MovieApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

/*                             Presenter
      Now that we have the Response from the Interactor, it’s time to format it into a ViewModel and pass the result back to the ViewController. Presenter will be in charge for the presentation logic. This component decides how the data will be presented to the user. In the presentFetchResults() function you can see that I am handling 2 delegate methods. (1) handling success situation, (2) handling error situation.*/
import UIKit
protocol MoviePresenterInput
{
    func presentFetchResults(movies:[Movie]);
}

protocol MoviePresenterOutput: class
{
    func successFetchedItems(viewModel: [Movie.Fetch.ViewModel.DisplayViewModel])
    func errorFetchingItems(viewModel: [Movie.Fetch.ViewModel.DisplayViewModel])
}
class MoviePresenter:MoviePresenterInput {

    var output:MoviePresenterOutput!
    
    
    func presentFetchResults(movies: [Movie]) {
        
        if movies.count == 0 {
            output.errorFetchingItems(viewModel: [])
        }
        var displayMovies:[Movie.Fetch.ViewModel.DisplayViewModel] = []
        for movie in movies {
            let displayViewModel = Movie.Fetch.ViewModel.DisplayViewModel(id: "\(movie.id)", name: movie.title, synopsis: movie.overview)
            displayMovies.append(displayViewModel)
        }
        output.successFetchedItems(viewModel: displayMovies)
    }
}
