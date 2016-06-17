//
//  TableViewController.swift
//  GitHubUsers
//
//  Created by Serge Sukhanov on 17.06.16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let arrayOfUsers = [GitHubUser]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "GitHub users"
        
        //fetch array of users
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GitHubUserCell
        let user = GitHubUser()
        user.login = "ssuhanov"
        user.profileLink = "https://github.com/ssuhanov"
        cell.user = user
        cell.configureCellForUser()

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
