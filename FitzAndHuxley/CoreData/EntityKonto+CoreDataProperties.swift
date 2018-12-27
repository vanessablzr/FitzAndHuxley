//
//  EntityKonto+CoreDataProperties.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 14.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//
//

import Foundation
import CoreData


extension EntityKonto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityKonto> {
        return NSFetchRequest<EntityKonto>(entityName: "EntityKonto")
    }
    

    @NSManaged public var vorname: String?
    @NSManaged public var nachname: String?
    @NSManaged public var email: String?
    @NSManaged public var passwort: String?
    @NSManaged public var lieferStrasse: String?
    @NSManaged public var lieferStrassenNr: String?
    @NSManaged public var lieferPostleitzahl: Int16
    @NSManaged public var lieferStadt: String?
    @NSManaged public var rechnungStrasse: String?
    @NSManaged public var rechnungStrassenNr: String?
    @NSManaged public var rechnungPostleitzahl: Int16
    @NSManaged public var rechnungStadt: String?
    @NSManaged public var kreditkarteInhaber: String?
    @NSManaged public var kreditkarteNummer: Int32
    @NSManaged public var kreditkarteDatum: String?
    @NSManaged public var kreditkarteCvv: Int16

}
