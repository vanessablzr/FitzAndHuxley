//
//  Category.swift
//  FitzAndHuxley
//
//  Created by Philipp on 15.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import Foundation
import UIKit

class Category {
    var categoryName: String
    var categoryPhoto: UIImage?
    var categoryId: String
    
    init! (categoryName: String, categoryPhoto: UIImage?, categoryId: String){
        guard !categoryName.isEmpty else {
            return nil
        }
        self.categoryName = categoryName
        self.categoryPhoto = categoryPhoto
        self.categoryId = categoryId
    }
}
