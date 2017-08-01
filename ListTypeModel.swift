//
//  ListTypeModel.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/27/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
//

import UIKit

class ListTypeModel: NSObject {
    var nameType: String = ""
    var valueType: Int
    init(name: String, value: Int) {
        self.nameType = name
        self.valueType = value
    }
}
