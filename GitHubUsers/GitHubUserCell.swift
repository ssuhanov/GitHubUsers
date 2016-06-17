//
//  GitHubUserCell.swift
//  GitHubUsers
//
//  Created by Serge Sukhanov on 17.06.16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

import UIKit

class GitHubUserCell: UITableViewCell {
    
    var user: GitHubUser?

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var profileLinkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellForUser() {
        if let user = user {
            loginLabel.text = user.login
            profileLinkButton.setTitle(user.profileLink, forState: .Normal)
            //images
        }
    }

    @IBAction func profileLinkButtonPressed(sender: AnyObject) {
        if let user = user {
            if let url = NSURL(string: NSLocalizedString(user.profileLink, comment: "")) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
}
