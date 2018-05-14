//
//  Movie.swift
//  MovieApp
//
//  Created by Waqas Sultan on 5/1/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
/*                    Models
 We will store all the models related to the controller. The Models class will be related to each component, as you can see in the Flow Diagram. It will be of type struct and mostly it will contain Request, Response, and ViewModel structs.
 For this example, let’s assume you are working with an API call on this scene. You will need the following structs:
 
 Request - parameters that need to be sent to the API request.
 Response - intercepts the response from the API and stores the appropriate data.
 ViewModel - everything that you need to show to the UI is stored here. For example, your API returns objects with 10 parameters, but you only need to show 4 of them.
 */
let APIKey = "44d1c4d4e6c925a008c431d73ae8ff4a"

private var parameters: Dictionary<String, String> = [
    "api_key": APIKey as String,
    "sort_by": "popularity.desc" as String
]

import Foundation



struct Movie: Codable {
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String
    let adult: Bool
    let overview, releaseDate: String
    
    struct Fetch {
        
        struct Request {
            var parameters:Dictionary<String, String> = [
                "api_key": APIKey,
                "sort_by": "popularity.desc"
            ]
        }
        struct Response: Codable {
            let page, totalResults, totalPages: Int
            let movies: [Movie]
            
            enum CodingKeys: String, CodingKey {
                case page
                case totalResults = "total_results"
                case totalPages = "total_pages"
                case movies = "results"
            }
//            init(from decoder: Decoder) throws {
//                let movies = try decoder.container(keyedBy: Movie.self)
//                let page: Int = try container.decode(Int.self, forKey: .page)
//                let totalResults: Int = try container.decode(Int.self, forKey: .totalResults)
//                let totalPages: Int = try container.decode(Int.self, forKey: .totalPages)
//                self.ini
//                
//            }
            init(data: Data) throws {
                self = try JSONDecoder().decode(Response.self, from: data)
            }
            
            init(_ json: String, using encoding: String.Encoding = .utf8) throws {
                guard let data = json.data(using: encoding) else {
                    throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
                }
                try self.init(data: data)
            }
            
            init(fromURL url: URL) throws {
                try self.init(data: try Data(contentsOf: url))
            }
            
            func jsonData() throws -> Data {
                return try JSONEncoder().encode(self)
            }
            
            func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
                return String(data: try self.jsonData(), encoding: encoding)
            }
        }
        struct ViewModel {
           
            
            struct DisplayViewModel {
                var id:String = ""
                var name:String = ""
                var synopsis:String  = ""
            }
            
            var displayModels:[DisplayViewModel] = []
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
      case es = "es"
}




extension Movie {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Movie.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

