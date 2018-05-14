//
//  ViewController.swift
//  MovieApp
//
//  Created by Waqas Sultan on 5/10/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

protocol MovieListViewControllerInput
{
    
}

protocol MovieListViewControllerOutput
{
    func fetchItems(request: Movie.Fetch.Request)
}

class MovieListViewController: UIViewController, MovieListViewControllerInput {
    
    @IBOutlet weak var tableView: UITableView!
    var output: MovieListViewControllerOutput!
    var router: MovieAppRouter!
  //  var viewModels:[Movie.Fetch.ViewModel.DisplayViewModel] = []
    let tableViewDataSource:MovieListViewDataSource = MovieListViewDataSource()
    // MARK: - Object lifecycle
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        MovieConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.tableView.delegate = self.tableViewDataSource
        self.tableView.dataSource = self.tableViewDataSource
        output.fetchItems(request: Movie.Fetch.Request(parameters: [
            "api_key": APIKey,
            "sort_by": "popularity.desc"
            ]))
    }
}
