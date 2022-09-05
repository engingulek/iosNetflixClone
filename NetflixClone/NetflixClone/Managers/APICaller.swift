//
//  APICaller.swift
//  NetflixClone
//
//  Created by engin gülek on 5.09.2022.
//

import Foundation


struct Constanst {
    
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>)->Void) {
        guard let url = URL(string: "\(Constanst.baseURL)/3/trending/movie/day?api_key=\(Constanst.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(TrendingMoviesResponse.self,from: data)
                completion(.success(result.results))
                
            }catch {
                completion(.failure(error))
            }
            

        }
        
        task.resume()
        
        
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[String],Error>)->Void){
        guard let url = URL(string: "\(Constanst.baseURL)/3/trending/tv/day?api_key=\(Constanst.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            
            do{
                let result = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                completion(.success([result]))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}
