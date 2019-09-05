//
//  MarsRoverClientTests.swift
//  MarsRoverClientTests
//
//  Created by Stephanie Bowles on 9/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class MarsRoverClientTests: XCTestCase {

    func fetchMarsRoverTest(){
        let mock = MockDataLoader()
        mock.data = validRoverJSON
        let resultsExpectation = expectation(description: "Wait for results")
        
        let controller = MarsRoverClient(networkLoader: mock)
        controller.fetchMarsRover(named: "Curiosity") { (data, error) in
            resultsExpectation.fulfill()
        }
        wait(for: [resultsExpectation], timeout: 2)
        XCTAssertEqual("Curiosity", controller.marsRover?.name)
        XCTAssertNotNil(controller.marsRover)
    }
    func fetchPhotosTest(){
    
    }

}
