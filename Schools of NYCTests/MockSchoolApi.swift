//
//  MockSchoolApi.swift
//  Schools of NYCTests
//
//  Created by Vincent Hunter on 2/3/25.
//

import Foundation
@testable import Schools_of_NYC

class MockSchoolApi: SchoolAPILogic {
    var loadState: SchoolListLoadState = .empty
    
    func fetchSchools(completion: @escaping (Schools_of_NYC.SuccessfulSchoolListApiResponse)) {
        switch loadState {
        case .error:
            completion(.failure(.networkingError("Could not fetch schools")))
        case .loaded:
            let mock = School(dbn: "02M260",
                              schoolName: "Clinton School Writers & Artists, M.S. 260",
                              overviewParagraph: "Students who are prepared for college must have an education that encourages them to take...",
                              schoolEmail: "admissions@theclintonschool.net",
                              academicOpportunities1: "Free college courses at neighboring universities",
                              academicOpportunities2: "International Travel, Special Arts, Programs, Music, Internships, College Level Mentoring,  Elnglish Language Learner Programs: English as a New Language",
                              neighborhood: "Chelsea-Union Square",
                              phoneNumber: "212-524-4360",
                              website: "www.theclintonschool.net",
                              finalGrades: "6-12",
                              totalStudents: "376",
                              schoolSports: "Cross Country, Track and Field, Soccer, Flag Football, Basketball", primaryAddressLine: "10 east 15th Street",
                              city: "Manhattan",
                              zipCode: "10003",
                              latitude: "40.73653",
                              longitude: "-73.9927")
                completion(.success([mock]))
        case .empty:
            completion(.success([]))
        }
    }
    
    
}

