//
//  BPUserTableViewCell.swift
//  BestPractice
//
//  Created by Lei Huang on 17/10/2017.
//  Copyright © 2017 leihuang. All rights reserved.
//

import UIKit

class BPUserTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var activeStatus: UIButton!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var gender: UIImageView!
    @IBOutlet weak var phone: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }

    func updateCellWithUserInfo(_ user: User) {
        self.nickName.text = user.nickName
        self.address.text = user.address
        self.activeStatus.isHidden = user.activeStatus == 1
        self.headerImageView.kf.setImage(with: URL.init(string: user.image))
        self.gender.image = user.getUserGenderImage()
        self.phone.text = user.phone
    }
}
