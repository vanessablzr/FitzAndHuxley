//
//  CoreDataStack.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 17.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataController : NSObject {
    
    var managedObjectContext : NSManagedObjectContext
    init(completionClosure: @escaping () -> ()){
        persistentContainer = NSPersistentContainer(name : "DataModel")
        persistentContainer.load
        
    }
}
