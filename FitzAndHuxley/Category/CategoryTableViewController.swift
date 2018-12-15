//
//  CategoryTableViewController.swift
//  FitzAndHuxley
//
//  Created by Philipp on 15.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var categoryArray = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CategoryCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CategoryTableViewCell else {
            fatalError("dequeued failed")
        }

        let categoryCurrent = categoryArray[indexPath.row]
        
        cell.categoryNameLabelOutlet.text = categoryCurrent.categoryName
        cell.categoryPhotoImageViewOutlet.image = categoryCurrent.categoryPhoto
        

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func loadCategories(){
        let photoBracelet = UIImage(named: "grey - Icon (Kategorie) - Bracelet")
        let photoPortemonnai = UIImage(named: "grey - Icon (Kategorie) - Portemonnai")
        let photoRucksack = UIImage(named: "grey - Icon (Kategorie) - Rucksack")
        let photoWeekenderBag = UIImage(named: "grey - Icon (Kategorie) - Weekender Bag")
        
        guard let categoryBracelet = Category(categoryName: "Armbänder", categoryPhoto: photoBracelet) else {
            fatalError("Unable to instantiate categoryBracelet")
        }
        guard let categoryPortemonnai = Category(categoryName: "Portemonnais", categoryPhoto: photoPortemonnai) else {
            fatalError("Unable to instantiate categoryPortemonnai")
        }
        guard let categoryRucksack = Category(categoryName: "Rucksäcke", categoryPhoto: photoRucksack) else {
            fatalError("Unable to instantiate categoryRucksack")
        }
        guard let categoryWeekenderBag = Category(categoryName: "Weekender Bags", categoryPhoto: photoWeekenderBag) else {
            fatalError("Unable to instantiate categoryWeekenderBag")
        }
        
        categoryArray += [categoryBracelet, categoryPortemonnai, categoryRucksack, categoryWeekenderBag]
        
    }

}
