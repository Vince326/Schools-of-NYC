//
//  Schools_of_NYCTests.swift
//  Schools of NYCTests
//
//  Created by Vincent Hunter on 1/27/25.
//

import XCTest
import Combine
@testable import Schools_of_NYC

final class Schools_of_NYCTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    override func setUp() async throws {
        try await super.setUp()
        cancellables.removeAll()
    }
    func testGettingSchoolsWithMockEmptyResult (){
        let expectation = XCTestExpectation(description: "testing empty state with mock api")
        
        let mockApi = MockSchoolApi()
        mockApi.loadState = .empty
        
        let viewModel = SchoolsViewModel(apiService: mockApi)
        viewModel.fetchSchools()
        
        viewModel.$schools
            .receive(on: RunLoop.main)
            .sink { schools in
                XCTAssertTrue(schools.isEmpty == true , "Expected Schools to be empty, but recieved some values")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("Expectation Failed: \(error)")
            }
            
        }
    }
    
    func testGettingSchoolsWithErrorResult(){
        let expectation = XCTestExpectation(description: "testing error state with mock api")
        
        let mockApi = MockSchoolApi()
        mockApi.loadState = .error
        
        let viewModel = SchoolsViewModel(apiService: mockApi)
        viewModel.fetchSchools()
         
        viewModel.$error
            .receive(on: RunLoop.main)
            .sink { error in
                    XCTAssertNotNil(error, "Expected to get an error but didn't recieve error")
                    expectation.fulfill()
                }
            .store(in: &cancellables)
            
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("waitForExpectations error: \(error)")
            }
            
        }
     }
    
    func testGettingSchoolWithSuccessResult(){
        let expectation = XCTestExpectation(description: "testing success state with mock api")
       let mockAPI = MockSchoolApi()
        mockAPI.loadState = .loaded
        
        let viewModel = SchoolsViewModel(apiService: mockAPI)
        viewModel.fetchSchools()
        
        viewModel.$schools
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { schools in
                guard let schools = schools else {
                    XCTFail("Did not return results")
                    return
                }
                XCTAssert(schools?.isEmpty == false, "Expected to get schools")
                expectation.fulfill()
                
            }
                .store(in: &cancellables)
}
            }
