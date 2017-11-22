//
//  DiningHallTableViewController.swift
//  WhereRUDining
//
//  Created by Shyam Lad on 11/20/17.
//  Copyright © 2017 Shyam Lad. All rights reserved.
//

import UIKit

class DiningHallTableViewController: UITableViewController {
  
    var dhall = [DiningHall]()
    var selected: Int?
    var selectedVC:MealViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        loadDiningHalls()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dhall.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cellIdentifier = "DiningHallTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DiningHallTableViewCell  else {
            fatalError("The dequeued cell is not an instance of DiningHallTableViewCell.")
        }
        
        // Fetches the appropriate dining hall for the data source layout.
        let d_h = dhall[indexPath.row]
        
        cell.DHallName.text = d_h.name
      
        
        return cell
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

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        
        self.selected = indexPath.row
        
      
        let svc = self.selectedVC?.viewControllers![0] as! BreakfastTableViewController
        let svc2 = self.selectedVC?.viewControllers![1] as! LunchTableViewController
        let svc3 = self.selectedVC?.viewControllers![2] as! DinnerTableViewController
        
        svc.DHall = self.dhall[self.selected!]
        svc2.DHall = self.dhall[self.selected!]
        svc3.DHall = self.dhall[self.selected!]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        print("*******Preparing to segue***********")
        self.selectedVC = segue.destination as! MealViewController
//        let svc = tabBarController.viewControllers![0] as! MealTableViewController
        
       
    }
   

    
    
    //MARK: Private Methods
    
    private func loadDiningHalls() {
        
        guard let hall1 =  DiningHall(name: "Brower", fullName:"Brower Commons") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let hall2 = DiningHall(name: "Busch" , fullName:"Busch Dining Hall") else {
            fatalError("Unable to instantiate meal2")
        }
        
       
        guard let hall3 = DiningHall(name: "Livingston", fullName:"Livingston Dining Commons") else {
            fatalError("Unable to instantiate meal2")
        }
        guard let hall4 = DiningHall(name: "Neilson", fullName:"Neilson Dining Hall") else {
            fatalError("Unable to instantiate meal2")
        }
        
        
        
        dhall += [hall1, hall2, hall3, hall4]
        
        
    }
    
    
    
    
}
