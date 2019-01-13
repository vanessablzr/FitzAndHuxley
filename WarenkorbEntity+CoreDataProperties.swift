//
//  WarenkorbEntity+CoreDataProperties.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 13.01.19.
//  Copyright © 2019 Vanessa Balzer. All rights reserved.
//
//

import Foundation
import CoreData


extension WarenkorbEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WarenkorbEntity> {
        return NSFetchRequest<WarenkorbEntity>(entityName: "WarenkorbEntity")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var preis: Double
    @NSManaged public var farbe: String?
    @NSManaged public var groesse: String?
    @NSManaged public var anzahl: String?

}
