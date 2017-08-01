//
//  TopApps.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/27/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
//

import Foundation

public struct TopApps: Decodable {
    
    // 1
    public let results: [Apps]?
    
    // 2
    public init?(json: JSON) {
        results = "results" <~~ json
    }
    
}
