//
//  CategoryTableViewController.swift
//  FitzAndHuxley
//
//  Created by Philipp on 15.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    var modifier = ""
    var categoryArray = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        title = "Kategorien"

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
        
        cell.categoryNameLabel.text = categoryCurrent.categoryName
        cell.categoryPhotoImage.image = categoryCurrent.categoryPhoto
        

        return cell
    }
 

    
    private func loadCategories(){
        let photoBracelet = UIImage(named: "grey - Icon (Kategorie) - Bracelet")
        let photoPortemonnai = UIImage(named: "grey - Icon (Kategorie) - Portemonnai")
        let photoRucksack = UIImage(named: "grey - Icon (Kategorie) - Rucksack")
        let photoWeekenderBag = UIImage(named: "grey - Icon (Kategorie) - Weekender Bag")
        
        guard let categoryBracelet = Category(categoryName: "Armbänder", categoryPhoto: photoBracelet, categoryId: "armband") else {
            fatalError("Unable to instantiate categoryBracelet")
        }
        guard let categoryPortemonnai = Category(categoryName: "Portemonnaies", categoryPhoto: photoPortemonnai, categoryId: "portemonnaie") else {
            fatalError("Unable to instantiate categoryPortemonnai")
        }
        guard let categoryRucksack = Category(categoryName: "Rucksäcke", categoryPhoto: photoRucksack, categoryId: "rucksack") else {
            fatalError("Unable to instantiate categoryRucksack")
        }
        guard let categoryWeekenderBag = Category(categoryName: "Weekender Bags", categoryPhoto: photoWeekenderBag, categoryId: "weekender") else {
            fatalError("Unable to instantiate categoryWeekenderBag")
        }
        
        categoryArray += [categoryBracelet, categoryPortemonnai, categoryRucksack, categoryWeekenderBag]
        
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        modifier = categoryArray[indexPath.row].categoryId
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CategoryDetailCollectionViewController{
            let subcategories = segue.destination as? CategoryDetailCollectionViewController
            subcategories?.subcategoryModifier = modifier
        }

    }
    
}

