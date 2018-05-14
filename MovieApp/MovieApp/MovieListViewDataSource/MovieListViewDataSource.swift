//
//  MovieListViewDataSource.swift
//  MovieApp
//
//  Created by Waqas Sultan on 5/14/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

class MovieListViewDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var displayMovies:[Movie.Fetch.ViewModel.DisplayViewModel] = []
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        let displayMovieModel:Movie.Fetch.ViewModel.DisplayViewModel = displayMovies[indexPath.row]
        tableViewCell.textLabel?.text = displayMovieModel.name
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayMovies.count
        
    }

}
