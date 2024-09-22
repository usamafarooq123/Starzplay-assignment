//
//  MoviesDetailsViewModelTests.swift
//  Starzplay-AssignmentTests
//
//  Created by usama farooq on 22/09/2024.
//

import Foundation
import XCTest
@testable import NetworkingLibrary
@testable import Starzplay_Assignment

class MoviesDetailsViewModelTests: XCTestCase {
    
    var mockService: MockMovieService!
    var viewModel: MoviesDetailsViewModelImpl!
    
    override func setUp() {
        super.setUp()
        mockService = MockMovieService()
        viewModel = MoviesDetailsViewModelImpl(service: mockService)
    }
    
    override func tearDown() {
        mockService = nil
        viewModel = nil
        super.tearDown()
    }
    
    // Fetching season details success
    func testFetchSeasonDetailsSuccess() {
        // Arrange: Mock the season details response
        let mockSeasonDetailResponse = SeasonDetailResponse.mock()
        mockService.seasonResult = .success(mockSeasonDetailResponse)
        
        // Act: Trigger the fetching of season details
        viewModel.viewModelDidLoad()
        
        // Assert: Ensure the seasonDetails property is set and output is called
        XCTAssertEqual(viewModel.seasonDetails?.name, mockSeasonDetailResponse.name)
        XCTAssertEqual(viewModel.numberOfRows(), 2)  // Should return 2 rows since season details are available
    }
    
    // Fetching season details failure
    func testFetchSeasonDetailsFailure() {
        // Arrange: Mock an error response
        mockService.seasonResult = .failure(.noInternet)
        
        // Act: Trigger the fetching of season details
        viewModel.viewModelDidLoad()
        
        // Assert: Ensure that no rows are displayed on failure
        XCTAssertNil(viewModel.seasonDetails)
        XCTAssertEqual(viewModel.numberOfRows(), 0)
    }
    
       // Validate cell view model types
    func testCellViewModels() {
        // Arrange: Mock the season details
        viewModel.seasonDetails = SeasonDetailResponse.mock()
        
        // Act: Retrieve the cell view models
        let headerCell = viewModel.cellViewModel(forRow: 0)
        let bodyCell = viewModel.cellViewModel(forRow: 1)
        
        // Assert: Check that the correct cell view models are returned
        XCTAssertTrue(headerCell is SeasonDetailsHeaderCellModel)
        XCTAssertTrue(bodyCell is SeasonsEpisodesViewModel)
    }
    
}
