//
//  Meal.swift
//  WhereRUDining?
//
//  Created by Shyam Lad on 11/20/17.
//  Copyright © 2017 Shyam Lad. All rights reserved.
//

import UIKit


class DiningHall {
    
    //MARK: Properties
    
    
    //This is the main data structure, each instance of DiningHall will cointain an array of structs that have the meal name and then the items in the meal.
    struct mealObj {
        var mealName:String
        var itemsInMeal: [String]
    }
    var name: String
    var fullName: String
    var breakfast = [mealObj]()
    var lunch = [mealObj]()
    var dinner = [mealObj]()
    
  
    
    //MARK: Initialization
    
    init?(name: String, fullName: String) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        
        // Initialize stored properties.
        self.name = name
        self.fullName = fullName
        
        //MARK: JSON
        DataManager.getTopAppsDataFromItunesWithSuccess { (data) -> Void in
           
            print("+++++++++++++ " + self.name + " +++++++++++++")
            print("\n")
            guard var json = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
                print("failed...")
                return
            }
            guard var first = json?.first,
                var meals = first["meals"] as? [[String: Any]],
                var locName = first["location_name"] as? String
                else {
                    //            print(json?.first)
                   return
            }
            
            while locName != self.fullName{
                json?.removeFirst()
//                print(json)
                guard let firstTemp = json?.first,
                    let mealsTemp = firstTemp["meals"] as? [[String: Any]],
                    let locNameTemp = firstTemp["location_name"] as? String
                    else {
                        print("this wquit")
                        return
                }
                first = firstTemp
                meals = mealsTemp
                locName = locNameTemp
               
            }
            self.breakfast = self.loadMeal(meal: meals)
            print(self.breakfast)
            print("\n")
        
            //MARK: Lunch
            
            meals.removeFirst()
            
            self.lunch = self.loadMeal(meal: meals)
            print(self.lunch)
            print("\n")
            
            //MARK: Dinner
            
            meals.removeFirst()
            self.dinner = self.loadMeal(meal: meals)
            
            print(self.dinner)
            print("\n")
           
        }
        
    }
    
    // give a meal and it will return an array of mealObj structs
    private func loadMeal(meal: [[String: Any]])->[mealObj]{
        
        
        var intoArray = [mealObj]()
        guard let genres = meal.first,
            let genres2 = genres["genres"] as? [[String: Any]]
            else{
                print("this has failed")
                return []
        }
       
        for indGenre in genres2 {
            //                print("Heres another one ...................................")
            //                print(indGenre["genre_name"]!)
            guard let items = indGenre["items"] as? [String]
                else{
                    print("faied")
                    return []
            }
            let bkfst = mealObj(mealName: indGenre["genre_name"]! as! String, itemsInMeal: items)
           intoArray.append(bkfst)
            
            
        }
        return intoArray
        
    }
    
}

