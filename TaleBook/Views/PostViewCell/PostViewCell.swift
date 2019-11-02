//
//  PostViewCell.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import UIKit
import ImageLoader

class PostViewCell: UITableViewCell {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var networkAccount: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var verificationStatus: UILabel!
    @IBOutlet weak var networkIcon: UIImageView!
    @IBOutlet weak var textPost: UITextView!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var contentViewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func reset() {
        imagePost.image = nil
        profilePicture.image = nil
    }
    
    func configure(with post: PostCellViewModel) {
        reset()
        self.contentViewCell.addRoundedCorner()
        self.profilePicture.roundedView()
        self.profilePicture.load.request(with: post.authorProfilePic)
        self.networkAccount.text = post.authorAccount
        self.userName.text = post.authorName
        self.verificationStatus.text = post.verifiedAccount ? "✓" : " "
        self.textPost.attributedText = post.text
        self.textPost.font = UIFont(name: textPost.font?.fontName ?? "Helvetica", size: 20.0)
        
        if let postImage = post.postPicture {
            self.imagePost.isHidden = false
            self.imagePost.load.request(with: postImage)
        } else {
            self.imagePost.isHidden = true
        }
        
        self.datePost.text = post.date
        self.networkIcon.image = UIImage(imageLiteralResourceName: post.network.stringValue)
    }
}
