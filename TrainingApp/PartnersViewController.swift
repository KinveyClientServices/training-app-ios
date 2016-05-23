//
//  PartnersViewController.swift
//  TrainingApp
//
//  Created by Igor Sapyanik on 24.02.16.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import UIKit
import Kinvey
import SVProgressHUD

class PartnersViewController: UITableViewController {

    
    var partners = [Partner]()
    
    //TODO: LAB: create sync data store
    lazy var store: DataStore<Partner>! = {
        return DataStore<Partner>.getInstance(.Sync)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.refreshControl?.addTarget(self, action: #selector(pullData), forControlEvents: .ValueChanged)

        pullData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if Kinvey.sharedClient.activeUser != nil && self.refreshControl?.refreshing == false {
            findPressed()
        }
    }
    
    func pullData() {
        self.refreshControl?.beginRefreshing()
        //TODO: LAB: Pull data from Kinvey
        store.pull() { (partners, error) -> Void in
            self.refreshControl?.endRefreshing()
            if (error != nil) {
                let alert = UIAlertController(title: "Error", message: "Unable to pull", preferredStyle:.Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(defaultAction)
                self.tabBarController?.presentViewController(alert, animated:true, completion:nil)
            }

            if let partners = partners {
                self.partners = partners
                if self.refreshControl?.refreshing ?? false {
                    self.refreshControl?.endRefreshing()
                }
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func findPressed() {
        SVProgressHUD.show()
        //TODO: LAB: Get all Partners
        store.find() { (partners, error) -> Void in
            SVProgressHUD.dismiss()
            if let partners = partners {
                self.partners = partners
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func syncPressed(){
        SVProgressHUD.show()
        //TODO: LAB: sync cached changes and get new updates
        store.sync() { (count, partners, error) -> Void in
            SVProgressHUD.dismiss()
            if (error != nil) {
                let alert = UIAlertController(title: "Error", message: "Unable to sync", preferredStyle:.Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(defaultAction)
                self.tabBarController?.presentViewController(alert, animated:true, completion:nil)
            }
            
            if let partners = partners {
                self.partners = partners
                if self.refreshControl?.refreshing ?? false {
                    self.refreshControl?.endRefreshing()
                }
                self.tableView.reloadData()
            }
        }
    }

    
    @IBAction func pushPressed(){
        SVProgressHUD.show()
        //TODO: LAB: Push cached changes to Kinvey
        store.push() { (count, error) -> Void in
            SVProgressHUD.dismiss()
            if (error != nil) {
                let alert = UIAlertController(title: "Error", message: "Unable to push", preferredStyle:.Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(defaultAction)
                self.tabBarController?.presentViewController(alert, animated:true, completion:nil)
            }
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        self.refreshControl?.enabled = !editing;
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partners.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")!

        // Configure the cell...
        if indexPath.row < partners.count {
            let product = partners[indexPath.row]
            
            cell.textLabel?.text = product.name
            cell.detailTextLabel?.text = product.company
        }

        return cell
    }
    
    // MARK: - Navigation
    
    @IBAction func cancelAddingPartner(segue: UIStoryboardSegue) {
    }
    
    @IBAction func savePartner(segue: UIStoryboardSegue) {
        if let addPartnerViewController = segue.sourceViewController as? AddPartnerViewController {
            
            //TODO: LAB: get partner to be saved
            if let partner = addPartnerViewController.partner {
                SVProgressHUD.show()
                
                //TODO: LAB: Save a new Partner
                store.save(partner) { (partner, error) -> Void in
                    SVProgressHUD.dismiss()
                    
                    if error != nil {
                        let alert = UIAlertController(title: "Error", message: "Unable to save", preferredStyle:.Alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                        alert.addAction(defaultAction)
                        self.tabBarController?.presentViewController(alert, animated:true, completion:nil)
                    }
                    
                    if let partner = partner{
                        self.partners.append(partner);
                        self.tableView.reloadData()
                    }
                }
                
            }
        }
    }
    


}
