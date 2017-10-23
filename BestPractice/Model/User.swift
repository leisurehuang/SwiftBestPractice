//
//  User.swift
//  BestPractice
//
//  Created by Lei Huang on 17/10/2017.
//  Copyright © 2017 leihuang. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias Users = [User]

struct User:Codable {
    var activeStatus: Int
    var address: String
    var age: Int
    var email: String
    var gender: Int
    var id: Int
    var image: String
    var nickName: String
    var phone: String
    var status: Int
}

extension User {
    func getUserGenderImage() -> (UIImage) {
        switch gender {
        case 1:
            return R.image.male()!
        case 2:
            return R.image.female()!
        default:
            return R.image.sex()!
        }
    }
}
