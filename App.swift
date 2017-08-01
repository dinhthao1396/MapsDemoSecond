//
//  Results.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/27/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
//

import Foundation

public struct App: Decodable {
    
    public let lat: float
    public let lng: float
    public let name: String
    public let vicinity: String
    
    public init?(json: JSON) {
        
        guard  let container: JSON = "geometry" <~~ json,
            let location: JSON = "location" <~~ json else {
            return nil
        }
        guard let lat: float = "lat" <~~ location,
            let lng: float = "id" <~~ location else {
            return nil
            }
        
        guard let name: String  = "name" <~~ json,
            let vicinity: String = "vicinity" <~~ json else {
                return nil
        }
        self.vicinity = vicinity
        self.name = name
        self.lat = lat
        self.lng = lng
    }
}
