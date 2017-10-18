//
//  BPUserViewModel.swift
//  BestPractice
//
//  Created by Lei Huang on 18/10/2017.
//  Copyright © 2017 leihuang. All rights reserved.
//

import Alamofire
import SwiftyJSON

class BPUserViewModel {

    typealias successCallBack = ([User]?) -> (Void)
    typealias failCallBack = (Error) -> (Void)
    var users: [User]?
    let requestUrl = "http://10.205.22.250:3000/users"

    func fetchUsers(success: @escaping successCallBack, fail: @escaping failCallBack) {
        Alamofire.request(requestUrl, method: .get, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonArray = JSON(value).arrayValue
                self.users = jsonArray.map({ (json) -> User in
                    return User.init(fromJson: json)
                })
                success(self.users)
            case .failure(let error):
                fail(error)
            }
        }
    }
}
