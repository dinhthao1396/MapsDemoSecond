//
//  ListDetailModel.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/27/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
//

import UIKit

class ListDetailModel: NSObject {
    var nameDetail:String = ""
    var addressDetail: String = ""
    init(name: String, address: String) {
        self.nameDetail = name
        self.addressDetail = address
    }
}
