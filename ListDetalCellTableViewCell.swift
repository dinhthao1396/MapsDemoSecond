//
//  ListDetalCellTableViewCell.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/27/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
//

import UIKit

class ListDetalCellTableViewCell: UITableViewCell {
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var addressDetail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDataDetailForCell(name: String, address: String){
        self.nameDetail.text = name
        self.addressDetail.text = address
    }

}
