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
    let requestUrl = "users"

    func fetchUsers() ->Promise<Users>{
        return appServiceClient.get(endpoint: requestUrl).responseModel(type: Users.self).then(execute: { (users) -> Users in
            self.users = users
            return users
        })
    }
}
