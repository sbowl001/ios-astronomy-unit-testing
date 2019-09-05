//
//  NetworkDataLoader.swift
//  Astronomy
//
//  Created by Stephanie Bowles on 9/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    func loadData(from request: URLRequest, completion: @escaping( Data?, Error?) -> Void)
    
    func loadData(from url: URL, completion: @escaping( Data?, Error?) -> Void)
}
