//
//  MovieRemoteApi.swift
//  MovieApp
//
//  Created by Waqas Sultan on 5/9/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//



import UIKit
import Alamofire
let APIURLPrefix = "https://api.themoviedb.org/3"
let imageURLPrefix = "https://image.tmdb.org/t/p"
/*          Worker
    The Worker component will handle all the API/CoreData requests and responses. The Response struct (from Models) will get the data ready for the Interactor. It will handle the success/error response, so the Interactor would know how to proceed.
 */
class MovieRemoteWorker: NSObject {
   
     private var requestURLString = "\(APIURLPrefix)/discover/movie?api_key=44d1c4d4e6c925a008c431d73ae8ff4a"
    
    func fetchMovies(request: Movie.Fetch.Request, complete :@escaping (Movie.Fetch.Response) -> Void, failure:@escaping (Error?) -> Void) {
        
        let reuest  =  Alamofire.request(requestURLString, method: .get, parameters: request.parameters, encoding: JSONEncoding.default, headers: nil)
        
        
        reuest.responseData(completionHandler: { response in
            if let json = response.result.value {
                do {
                  // let response = try JSONDecoder().decode(Movie.Fetch.Response.self, from: json as! Data)

                    let response = try Movie.Fetch.Response(data: json )
                    complete(response)
                } catch  {
                    failure(nil)
                }
            }
            
            if let error = response.result.error {
                failure(error)
            }
        })
    }
    
}
