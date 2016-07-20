//
//  ProductsViewController.swift
//  TrainingApp
//
//  Created by Igor Sapyanik on 24.02.16.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import UIKit
import Kinvey
import SVProgressHUD

class ProductsViewController: UITableViewController {
    
    var products = [Product]()
    var sordAscending = false
    
    
    //TODO: LAB: declare a data store variable
    lazy var store: DataStore<Product> = {
        return DataStore<Product>.collection()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.refreshControl?.addTarget(self, action: #selector(loadDataByQuery), forControlEvents: .ValueChanged)
        
        if Kinvey.sharedClient.activeUser == nil {
            self.tabBarController!.performSegueWithIdentifier("TabBarToLogin", sender: nil)
        }
        else {
            //TODO: LAB: get instance of data store
            loadDataByQuery()
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(loadDataByQuery), name: LoginViewController.didLoginNotificationName, object: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if Kinvey.sharedClient.activeUser != nil && self.refreshControl?.refreshing == false {
            loadDataByQuery()
        }
    }
    
    func loadDataByQuery(query:Query = Query()) {
        self.refreshControl?.beginRefreshing()
        store.find(query) { (products, error) -> Void in
            self.refreshControl?.endRefreshing()
            if let products = products {
                self.products = products
                if self.refreshControl?.refreshing ?? false {
                    self.refreshControl?.endRefreshing()
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        self.refreshControl?.enabled = !editing;
    }
    
    //MARK: - IB Actions
    @IBAction func tappedSort(sender: AnyObject) {
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: sordAscending)
        let query = Query(sortDescriptors:[sortDescriptor])

        loadDataByQuery(query)
        
        sordAscending = !sordAscending
    }
    
    @IBAction func tappedSkip(sender: AnyObject) {
    }
    
    @IBAction func tappedLimit(sender: AnyObject) {
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")!

        // Configure the cell...
        if indexPath.row < products.count {
            let product = products[indexPath.row]
            
            cell.textLabel?.text = product.name
            cell.detailTextLabel?.text = product.productDescription
        }

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            if indexPath.row < products.count {
                
                let product = products[indexPath.row]
                products.removeAtIndex(indexPath.row)
                
                if let _ = product.entityId {
                    
                    SVProgressHUD.show()
                    store.removeById(product.entityId!, completionHandler: { (count, error) -> Void in
                        
                        SVProgressHUD.dismiss()
                        
                        if (error != nil) {
                            let alert = UIAlertController(title: "Error", message: "Unable to delete", preferredStyle:.Alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                            alert.addAction(defaultAction)
                            self.tabBarController?.presentViewController(alert, animated:true, completion:nil)
                        }
                    })
                }
            }
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

   
}
