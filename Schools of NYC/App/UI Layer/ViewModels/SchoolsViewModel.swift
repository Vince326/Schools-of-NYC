//
//  SchoolsViewModel.swift
//  Schools of NYC
//
//  Created by Vincent Hunter on 2/2/25.
//

import Foundation
import Combine

class SchoolsViewModel {
    @Published private(set) var schools: [School] = []
    @Published private(set) var error: DataError? = nil
    
    private let apiService: SchoolAPILogic
    
    init(apiService: SchoolAPILogic = SchoolAPI()) {
        self.apiService = apiService
    }
    
    func fetchSchools( ){
        apiService.fetchSchools { [weak self] result in
            switch result {
            case .success(let schools):
                self?.schools = schools ?? []
                
            case .failure(let error):
                self?.error = error
               
            }
        }
    }
}
