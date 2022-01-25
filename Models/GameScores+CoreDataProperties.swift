//
//  GameScores+CoreDataProperties.swift
//  Lab1_KarimElJazzar_C0826750_iOS
//
//  Created by Karim El Jazzar on 25/01/2022.
//
//

import Foundation
import CoreData


extension GameScores {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameScores> {
        return NSFetchRequest<GameScores>(entityName: "GameScores")
    }

    @NSManaged public var player1Score: Int16
    @NSManaged public var player2Score: Int16

}

extension GameScores : Identifiable {

}
