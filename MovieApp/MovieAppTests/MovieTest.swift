//
//  MovieTest.swift
//  MovieAppTests
//
//  Created by Waqas Sultan on 5/1/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import MovieApp
class MovieTest: XCTestCase {
    let movie:Movie = Movie()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func createMovieObject() {
        XCTAssertNil(movie)
    }
    func checkMovieIdExist() {
        XCTAssertNil(movie.id)
    }
    func checkMovieNameExist() {
        XCTAssertNil(movie.name)
    }
    func checkMovieSynopsysExist() {
        XCTAssertNil(movie.synopsis)
    }
    func checkGenresExist() {
        XCTAssertNil(movie.genres)
    }
    func checkGenreCount() {
        XCTAssertEqual(movie.genres.count,0)
    }
    
}
