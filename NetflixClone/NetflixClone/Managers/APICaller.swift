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
    
    func getTrendingMovies(completion: @escaping (Result<[Title],Error>)->Void) {
        guard let url = URL(string: "\(Constanst.baseURL)/3/trending/movie/day?api_key=\(Constanst.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self,from: data)
                completion(.success(result.results))
                
            }catch {
                completion(.failure(error))
            }
            

        }
        
        task.resume()
        
        
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title],Error>)->Void){
        guard let url = URL(string: "\(Constanst.baseURL)/3/trending/tv/day?api_key=\(Constanst.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    func getUpComingMovies(completion: @escaping (Result<[Title],Error>)->Void){
  
       
        guard let url = URL(string: "\(Constanst.baseURL)/3/movie/upcoming?api_key=\(Constanst.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, respomse, error in
            guard let data = data, error == nil else {return}
            
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
                
            }catch{
                completion(.failure(error))
            }

        }
        task.resume()
        
    }
    
    func getPopuler(completion: @escaping (Result<[Title],Error>)->Void){
        guard let url = URL(string: "\(Constanst.baseURL)/3/movie/populer/upcoming?api_key=\(Constanst.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, respomse, error in
            guard let data = data, error == nil else {return}
            
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
                
            }catch{
                completion(.failure(error))
            }

        }
        task.resume()
        
    }
    
    func getTopRated(completion: @escaping (Result<[Title],Error>)->Void){
        guard let url = URL(string: "\(Constanst.baseURL)/3/movie/top_rated/upcoming?api_key=\(Constanst.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, respomse, error in
            guard let data = data, error == nil else {return}
            
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
                
            }catch{
                completion(.failure(error))
            }

        }
        task.resume()
        
    }
    //https://api.themoviedb.org/3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
    func getDiscoverMovies(completion: @escaping (Result<[Title],Error>)->Void) {
        
        guard let url = URL(string: "\(Constanst.baseURL)/3/discover/movie?api_key=\(Constanst.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, respomse, error in
            guard let data = data, error == nil else {return}
            
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
                
            }catch{
                completion(.failure(error))
            }

        }
        task.resume()
        
    }
    
    
    func search(with query : String,completion: @escaping (Result<[Title],Error>)->Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constanst.baseURL)/3/search/movie?api_key=\(Constanst.API_KEY)&query=\(query)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, respomse, error in
            guard let data = data, error == nil else {return}
            
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
                
            }catch{
                completion(.failure(error))
            }

        }
        task.resume()
        
    }
        
}










