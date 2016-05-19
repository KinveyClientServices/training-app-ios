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
    
    
    lazy var store: DataStore<Product>! = {
        return DataStore<Product>.getInstance(.Sync)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.refreshControl?.addTarget(self, action: #selector(loadDataFromServer), forControlEvents: .ValueChanged)
        
        if Kinvey.sharedClient.activeUser == nil {
            self.tabBarController!.performSegueWithIdentifier("TabBarToLogin", sender: nil)
        }
        else {
            loadDataFromServer()
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(loadDataFromServer), name: LoginViewController.didLoginNotificationName, object: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if Kinvey.sharedClient.activeUser != nil && self.refreshControl?.refreshing == false {
            loadDataFromCache()
        }
    }
    
    func loadDataFromServer() {
        self.refreshControl?.beginRefreshing()
        store.pull() { (products, error) -> Void in
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
    
    func loadDataFromCache(query:Query = Query()) {
        
        store.find(query) { (products, error) -> Void in
            if let products = products {
                self.products = products
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

        let predicate = NSPredicate(value: true)
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: sordAscending)
        let query = Query(predicate:predicate, sortDescriptors:[sortDescriptor])

        loadDataFromCache(query)
        
        sordAscending = !sordAscending
    }
    
    @IBAction func tappedSkip(sender: AnyObject) {
    }
    
    @IBAction func tappedLimit(sender: AnyObject) {
//        let query = Query()
//        loadDataFromCache(query)

    }
    
    @IBAction func tappedPush(sender: AnyObject) {
        
        SVProgressHUD.show()
        store.sync() { (count, products, errors) -> Void in
            SVProgressHUD.dismiss()
            if let errors = errors where errors.count > 0 {
                var message = "Unable to push"
                for error in errors {
                    if let error = error as? Error {
                        message = error.localizedDescription
                        break
                    }
                }
                
                let alert = UIAlertController(title: "Error", message: message, preferredStyle:.Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(defaultAction)
                self.presentViewController(alert, animated:true, completion:nil)
            }
        }
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
                
                if let _ = product.objectId {
                    
                    SVProgressHUD.show()
                    store.removeById(product.objectId!, completionHandler: { (count, error) -> Void in
                        
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
