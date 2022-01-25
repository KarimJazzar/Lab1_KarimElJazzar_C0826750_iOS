//
//  GameState+CoreDataProperties.swift
//  Lab1_KarimElJazzar_C0826750_iOS
//
//  Created by Karim El Jazzar on 25/01/2022.
//
//

import Foundation
import CoreData


extension GameState {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameState> {
        return NSFetchRequest<GameState>(entityName: "GameState")
    }

    @NSManaged public var turn: Int16
    @NSManaged public var topLeft: String?
    @NSManaged public var topMid: String?
    @NSManaged public var topRight: String?
    @NSManaged public var midLeft: String?
    @NSManaged public var midMid: String?
    @NSManaged public var midRight: String?
    @NSManaged public var bottomLeft: String?
    @NSManaged public var bottomMid: String?
    @NSManaged public var bottomRight: String?
    @NSManaged public var crossFirst: Bool

}

extension GameState : Identifiable {

}
