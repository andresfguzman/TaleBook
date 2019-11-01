//
//  UIImageView+Loader.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 31/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import UIKit

extension UIImageView {
    public func setImage(from url: URL, with placeholder: UIImage = UIImage(imageLiteralResourceName: "placeholder")) {
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                DispatchQueue.main.async {
                    self.image = placeholder
                }
                return
            }
            
            let image = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
