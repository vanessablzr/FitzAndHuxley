//
//  ArtikelEntity+CoreDataProperties.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 04.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//

import Foundation
import CoreData

extension ArtikelEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArtikelEntity>{
        return NSFetchRequest<ArtikelEntity>(entityName: "ArtikelEntity")
    }
    
    @NSManaged public var name : String
    @NSManaged public var preis : Double
    @NSManaged public var anzahl : Int
    @NSManaged public var eigenschaften : String
    @NSManaged public var farbe : String
    @NSManaged public var groesse : String
    @NSManaged public var material : String
    @NSManaged public var image : String
    @NSManaged public var inWarenkorb : Bool
}
