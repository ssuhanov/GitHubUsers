//
//  AvatarViewController.swift
//  GitHubUsers
//
//  Created by Serge Sukhanov on 17.06.16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    
    var user: GitHubUser?

    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = user {
            navigationItem.title = user.login
            avatarImageView.image = user.avatar
        }
    }

}
