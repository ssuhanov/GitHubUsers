//
//  GitHubUser.swift
//  GitHubUsers
//
//  Created by Serge Sukhanov on 17.06.16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

import Foundation
import UIKit

class GitHubUser {
    var login: String
    var profileLink: String
//    var avatarPreview: UIImage = UIImage()
//    var avatar: UIImage = UIImage()
    
    init(_ jsonDictionary: [String : AnyObject]) {
        self.login = jsonDictionary["login"] as! String
        self.profileLink = jsonDictionary["html_url"] as! String
    }
}
