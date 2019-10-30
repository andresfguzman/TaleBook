//
//  PostViewCell.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var networkAccount: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var verificationStatus: UILabel!
    @IBOutlet weak var networkIcon: UIImageView!
    @IBOutlet weak var textPost: UITextView!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var datePost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
