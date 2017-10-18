//
//  BPUserViewController.swift
//  BestPractice
//
//  Created by Lei Huang on 17/10/2017.
//  Copyright © 2017 leihuang. All rights reserved.
//

import UIKit

import Kingfisher

class BPUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var usersTable: UITableView!

    fileprivate let viewModel = BPUserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateTitle()
        self.setUpTable()
        self.fetchUsers()
    }

    fileprivate func updateTitle() {
        self.title = "用户列表"
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }

    fileprivate func setUpTable() {
        self.usersTable.estimatedRowHeight = 45
        self.usersTable.rowHeight = UITableViewAutomaticDimension
        self.usersTable.tableFooterView = UIView()
    }

    func fetchUsers() {
        self.showProgressHUD()
        self.viewModel.fetchUsers(success: { users in
            self.hiddenAllHUD()
            self.usersTable.reloadData()
        }) { error in
            self.hiddenAllHUD()
            self.showFailHUD(error)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let users: [User] = self.viewModel.users {
            return users.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "BPUserTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BPUserTableViewCell
        if let user: User = self.viewModel.users?[indexPath.row] {
            cell.updateCellWithUserInfo(user)
        }
        return cell
    }
}
