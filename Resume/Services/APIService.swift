//
//  APIService.swift
//  Resume
//
//  Created by Luis Eduardo Barajas Perez on 7/30/19.
//  Copyright © 2019 Luis Barajas. All rights reserved.
//

import Foundation

class APIService: NSObject {
    lazy var endPoint: String = {
        return "https://gist.githubusercontent.com/luisbarajasp/19edb2a83748268c916aef9a4e5cdba0/raw/d2e2266c8acb4abee3f90f1bc1eae401932ceb74/cv.json"
    }()
    
    func getDataWith(completion: @escaping (Result<[String: AnyObject]>) -> Void) {
        guard let url = URL(string: endPoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return completion(.Error(error!.localizedDescription)) }
            guard let data = data else { return completion(.Error(error?.localizedDescription ?? "There is no resume to show")) }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
//                    guard let resume = json as? [[String: AnyObject]] else {  return completion(.Error(error?.localizedDescription ?? "There is no resume to show"))  }
                    DispatchQueue.main.async {
                        completion(.Success(json))
                    }
                }
            } catch let error {
                return completion(.Error(error.localizedDescription))
            }
            }.resume()
    }
}

enum Result <T>{
    case Success(T)
    case Error(String)
}
