//
//  ListTypeTableViewCell.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/27/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
//

import UIKit

class ListTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameType: UILabel!
    @IBOutlet weak var maps: UIButton!
    @IBOutlet weak var list: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDataForCellType(name: String){
        self.nameType.text = name
        
    }

}
