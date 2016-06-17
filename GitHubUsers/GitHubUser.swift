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
    var avatar: UIImage?
    
    init(_ jsonDictionary: [String : AnyObject]) {
        self.login = jsonDictionary["login"] as! String
        self.profileLink = jsonDictionary["html_url"] as! String
        
        guard let avatarURL = NSURL(string: jsonDictionary["avatar_url"] as! String),
            let avatarData = NSData(contentsOfURL: avatarURL) else {
                return
        }
        self.avatar = UIImage(data: avatarData)
    }
}
