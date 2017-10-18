//
//  BPUserViewController.swift
//  BestPractice
//
//  Created by Lei Huang on 17/10/2017.
//  Copyright © 2017 leihuang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class BPUserViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var usersTable: UITableView!
    var users:[User]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "用户列表"
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        self.usersTable.estimatedRowHeight = 45
        self.usersTable.rowHeight = UITableViewAutomaticDimension
        
        self.fetchUsers()
    }
    
    func fetchUsers() {
        Alamofire.request("http://10.205.22.250:3000/users", method: .get, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonArray = JSON(value).arrayValue
                self.users =  jsonArray.map({ (json) -> User in
                    return User.init(fromJson: json)
                })
                self.usersTable.reloadData()
            case .failure(let error):
                print(error)
            }        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let users:[User] = users{
            return users.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "BPUserTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BPUserTableViewCell
        if let user:User = self.users?[indexPath.row] {
            cell.nickName.text = user.nickName
            cell.address.text = user.address
            cell.activeStatus.isHidden = user.activeStatus == 1
            cell.headerImageView.kf.setImage(with: URL.init(string: user.image))
            cell.gender.image = user.getUserGenderImage()
            cell.phone.text = user.phone
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    
}

