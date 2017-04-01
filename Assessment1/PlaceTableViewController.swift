//
//  PlaceTableViewController.swift
//  Assessment1
//
//  Created by Hayden Hastings on 4/1/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import UIKit

class PlaceTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaceController.shared.placesArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        
        let place = PlaceController.shared.placesArray[indexPath.row]
        cell.textLabel?.text = place.name
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPlaceVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let place = PlaceController.shared.placesArray[indexPath.row]
                
                let placesListTVC = segue.destination as? placeDetailViewController
                
                placesListTVC?.place = place
            }
            
        }
        
    }
}
