//
//  APISercive.swift
//  uikitproj
//
//  Created by Furkan ic on 12.03.2024.
//

import Foundation

class APIService {
    func fetchItems( closure: @escaping (ResponseDTO?) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let data else { return }
            do {
                let response = try JSONDecoder().decode(ResponseDTO.self, from: data)
                closure(response)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        })

        task.resume()
    }
}
