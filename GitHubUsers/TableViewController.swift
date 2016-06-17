//
//  TableViewController.swift
//  GitHubUsers
//
//  Created by Serge Sukhanov on 17.06.16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayOfUsers = [GitHubUser]()
    let gitHubUsersURL = "https://api.github.com/users?per_page=100"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "GitHub users"
        
        //fetch array of users
        getUsers()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfUsers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GitHubUserCell
        let user = arrayOfUsers[indexPath.row]
        cell.user = user
        cell.configureCellForUser()

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - Getting data from URL
    func getUsers() {
        let request = NSURLRequest(URL: NSURL(string: gitHubUsersURL)!)
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithRequest(request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            //Parsing
            if let data = data {
                self.parseJsonData(data)
            }
            
        }
        task.resume()
    }
    
    func parseJsonData(data: NSData) {
        if !arrayOfUsers.isEmpty {
            return
        }
        
        do {
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
            let jsonArray = jsonResult as! [AnyObject]
            for jsonElement in jsonArray {
                let user = GitHubUser(jsonElement as! [String : AnyObject])
                arrayOfUsers.append(user)
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            }
        } catch {
            print(error)
        }
    }

}
