//
//  MealTableViewController.swift
//  WhereRUDining
//
//  Created by Shyam Lad on 11/21/17.
//  Copyright © 2017 Shyam Lad. All rights reserved.
//

import UIKit

class BreakfastTableViewController: UITableViewController {
    
    var DHall: DiningHall?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        
        print("The data is !!!!!!!!!!!!!!!!!!")
        print("\n")
        print(DHall?.breakfast)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print((DHall?.breakfast.count)!)
        return (DHall?.breakfast.count)!
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        var rows = 0
        
        let B = (DHall?.breakfast)![section]
            print("Counting Rows...")
            rows += B.itemsInMeal.count
        
        return rows
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.DHall?.breakfast[section].mealName
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cellIdentifier = "MealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        cell.MealLabel.text =  self.DHall?.breakfast[indexPath.section].itemsInMeal[indexPath.row]
        return cell
    }
    
    //edit section properties
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.red
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
