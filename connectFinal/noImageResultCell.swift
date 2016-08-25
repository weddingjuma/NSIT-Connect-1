//
//  noImageResultCell.swift
//  connectFinal
//
//  Created by Swapnil Dhanwal on 22/06/16.
//  Copyright © 2016 SwApp. All rights reserved.
//

import UIKit

class noImageResultCell: UITableViewCell {
    
    @IBOutlet var paddingView: UIView!
    
    @IBOutlet var resultName: UILabel!
    
    @IBOutlet var resultAddress: UILabel!
    
    @IBOutlet var openStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
