//
//  MovieConfigurator.swift
//  MovieApp
//
//  Created by Waqas Sultan on 5/14/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

extension MovieListViewController: MoviePresenterOutput
{
    func successFetchedItems(viewModel: [Movie.Fetch.ViewModel.DisplayViewModel]) {
        //self.viewModels = viewModel
        self.tableViewDataSource.displayMovies = viewModel
        self.tableView.reloadData()
        
    }
    
    func errorFetchingItems(viewModel: [Movie.Fetch.ViewModel.DisplayViewModel]) {
      //  self.viewModels = viewModel
        self.tableViewDataSource.displayMovies = viewModel
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // open next view controller from here
       // router.passDataToNextScene(segue: segue)
    }
}

extension MovieInteractor: MovieListViewControllerOutput
{
    func fetchItems(request: Movie.Fetch.Request) {
          MovieConfigurator.sharedInstance.interactor.fetchMovies(request: request)
    }
    
    
}

extension MoviePresenter: MovieInteractorOutput
{
    func presentFetchMovies(movies: [Movie]) {
        MovieConfigurator.sharedInstance.presenter.presentFetchResults(movies: movies)
    }
}

class MovieConfigurator: NSObject {

    static let sharedInstance = MovieConfigurator()
    let presenter = MoviePresenter()
    let interactor = MovieInteractor()
    let router = MovieAppRouter()

    private override init() {}
    
    // MARK: - Configuration
    
    func configure(viewController: MovieListViewController)
    {
        router.movieListViewController = viewController
        
       
        presenter.output = viewController
        
      
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
