//
//  MovieInteractor.swift
//  MovieApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
/*                  Interactor
   This is the “mediator” between the Worker and the Presenter. Here is how the Interactor works. First, it communicates with the ViewController which passes all the Request params needed for the Worker. Before proceeding to the Worker, a validation is done to check if everything is sent properly. If everything is ok, the Worker returns a response and the Interactor passes that response towards the Presenter. */
protocol MovieInteractorInput {

    func fetchMovies(request:Movie.Fetch.Request)
}

protocol MovieInteractorOutput {
    func presentFetchMovies(movies:[Movie])

}
class MovieInteractor:MovieInteractorInput {

    var output: MovieInteractorOutput!
    var worker: MovieRemoteWorker!
    
    func fetchMovies(request: Movie.Fetch.Request) {
        
        if request.parameters.count  == 0  {
           self.output.presentFetchMovies(movies: [])
        }
        worker = MovieRemoteWorker()
        worker.fetchMovies(request: request, complete: { (response) in
            self.output.presentFetchMovies(movies: response.movies)
        }) { (error) in
            
            self.output.presentFetchMovies(movies: [])

        }
       }

}
