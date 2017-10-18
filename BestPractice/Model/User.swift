//
//  User.swift
//  BestPractice
//
//  Created by Lei Huang on 17/10/2017.
//  Copyright © 2017 leihuang. All rights reserved.
//

import Foundation
import SwiftyJSON


class User: NSObject, NSCoding {
    var activeStatus: Int!
    var address: String!
    var age: Int!
    var email: String!
    var gender: Int!
    var id: Int!
    var image: String!
    var nickName: String!
    var phone: String!
    var status: Int!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!) {
        if json.isEmpty {
            return
        }
        activeStatus = json["activeStatus"].intValue
        address = json["address"].stringValue
        age = json["age"].intValue
        email = json["email"].stringValue
        gender = json["gender"].intValue
        id = json["id"].intValue
        image = json["image"].stringValue
        nickName = json["nickName"].stringValue
        phone = json["phone"].stringValue
        status = json["status"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if activeStatus != nil {
            dictionary["activeStatus"] = activeStatus
        }
        if address != nil {
            dictionary["address"] = address
        }
        if age != nil {
            dictionary["age"] = age
        }
        if email != nil {
            dictionary["email"] = email
        }
        if gender != nil {
            dictionary["gender"] = gender
        }
        if id != nil {
            dictionary["id"] = id
        }
        if image != nil {
            dictionary["image"] = image
        }
        if nickName != nil {
            dictionary["nickName"] = nickName
        }
        if phone != nil {
            dictionary["phone"] = phone
        }
        if status != nil {
            dictionary["status"] = status
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder) {
        activeStatus = aDecoder.decodeObject(forKey: "activeStatus") as? Int
        address = aDecoder.decodeObject(forKey: "address") as? String
        age = aDecoder.decodeObject(forKey: "age") as? Int
        email = aDecoder.decodeObject(forKey: "email") as? String
        gender = aDecoder.decodeObject(forKey: "gender") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        nickName = aDecoder.decodeObject(forKey: "nickName") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        status = aDecoder.decodeObject(forKey: "status") as? Int

    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder) {
        if activeStatus != nil {
            aCoder.encode(activeStatus, forKey: "activeStatus")
        }
        if address != nil {
            aCoder.encode(address, forKey: "address")
        }
        if age != nil {
            aCoder.encode(age, forKey: "age")
        }
        if email != nil {
            aCoder.encode(email, forKey: "email")
        }
        if gender != nil {
            aCoder.encode(gender, forKey: "gender")
        }
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if image != nil {
            aCoder.encode(image, forKey: "image")
        }
        if nickName != nil {
            aCoder.encode(nickName, forKey: "nickName")
        }
        if phone != nil {
            aCoder.encode(phone, forKey: "phone")
        }
        if status != nil {
            aCoder.encode(status, forKey: "status")
        }

    }

    func getUserGenderImage() -> (UIImage) {
        switch gender {
        case 1:
            return UIImage.init(named: "male")!
        case 2:
            return UIImage.init(named: "female")!
        default:
            return UIImage.init(named: "sex")!
        }
    }

}
