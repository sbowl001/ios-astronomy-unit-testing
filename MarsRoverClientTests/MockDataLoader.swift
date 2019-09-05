//
//  MockDataLoader.swift
//  MarsRoverClientTests
//
//  Created by Stephanie Bowles on 9/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
@testable import Astronomy

class MockDataLoader: NetworkDataLoader {
    
    
    func loadData(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        self.request = request
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion(self.data, self.error)
        }
    }
        func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
            self.url = url
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                completion(self.data, self.error)
            }
        }
    var url: URL?
    var request: URLRequest?
    var data: Data?
    var error: Error?
    
  
}

