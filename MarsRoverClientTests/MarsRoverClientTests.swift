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

func testfetchMarsRover(){
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
    
func testfetchPhotos(){
     let mock = MockDataLoader()
        mock.data = validSol1JSON
        let resultsExpectation = expectation(description: "wait for photos")
        let controller = MarsRoverClient(networkLoader: mock)
        
        let dictionary = try? MarsPhotoReference.jsonDecoder.decode([String: MarsRover].self, from: validRoverJSON)
        guard let marsRover = dictionary?["photo_manifest"] else {
            XCTFail()
            return
        }
        
        controller.fetchPhotos(from: marsRover, onSol: 1) { (marsPhotoReferences, error) in
            resultsExpectation.fulfill()
        }
        wait(for: [resultsExpectation], timeout: 2)
        XCTAssertNotNil(controller.marsPhotoReferences)
    }

    func testThatNothing() {
        XCTAssertTrue(true, "True should be true")
    }
    
    
    
}
