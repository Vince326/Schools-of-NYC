//
//  SchoolDirectory.swift
//  Schools of NYC
//
//  Created by Vincent Hunter on 1/30/25.
//

import Foundation
import Alamofire

typealias SuccessfulSchoolListApiResponse = (Swift.Result<[School]?, DataError>)-> Void

protocol SchoolAPILogic {
    func fetchSchools(completion: @escaping (SuccessfulSchoolListApiResponse))
    
}

class SchoolAPI: SchoolAPILogic {
    
    private struct Constants {
        static let schoolListURLString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$$app_token=VpAz3OFLmRB8FbS3aGsECuxEn"
    }
    
    func fetchSchools(completion: @escaping (SuccessfulSchoolListApiResponse)) {
        //TODO: Implement me here
        //Network Request, URL Session version
        ////        print(Constants.schoolListURLString)
        ////        print("Implement fetch schools")
        //        retrieveSchoolsFromAPI()
        
        //Network Request, Alamofire Version
        AF.request(Constants.schoolListURLString)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [School].self) { response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(.networkingError(error.localizedDescription)))
                    
                case .success(let schools):
                        completion(.success(schools))
                    break
                }
            }
    }
}
    
    private func retrieveSchoolsFromAPI(){
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "data.cityofnewyork.us"
        urlComponents.path = "/resource/s3k6-pzi2.json"
        urlComponents.queryItems = [URLQueryItem(name: "$$app_token",
                                                 value: "VpAz3OFLmRB8FbS3aGsECuxEn")]
        
        if let url = urlComponents.url {
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                guard error == nil else{
                    print("Error ocurred: \(error?.localizedDescription)")
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let schools = try decoder.decode([School].self, from: data)
                        print("shcools: \(schools)")
                    } catch let error {
                        print("error during parsing: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }

