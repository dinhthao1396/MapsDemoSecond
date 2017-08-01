//
//  Util.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/27/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
//

import UIKit

class Util: NSObject {

}
extension UIImageView {
    func downLoadFromUrlDemoSimple(urlSimple: String){
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string: urlSimple )!)
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        
    }
}
