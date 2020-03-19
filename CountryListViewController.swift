//
//  FirstViewController.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import UIKit

/**
 ViewController which shows the Corona Data for each country
 */
class CountryListViewController: CoronaTableViewController {
    // Task 2
    var m = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        m.fetchData(completion: {
            return
            
        })
        
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.confirmedLabel.text = m.countryDict["confirmed"]!
            destination.recoveredLabel.text = m.countryDict["recovered"]!
            destination.deathLabel.text = m.countryDict["deaths"]!
            destination.nameLabel.text = m.countryDict["name"]!
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let locationString = searchBar.text,
            !locationString.isEmpty {
            //updateWeatherForLocation(location: locationString)
        }
    }
}

