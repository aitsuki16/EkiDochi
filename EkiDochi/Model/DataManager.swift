//
//  DataManager.swift
//  EkiDochi
//
//  Created by user on 2024/07/01.
//

import Foundation
import SwiftData

class DataManager {
    static let shared = DataManager()
    
    let context: ModelContext
    
    private init() {
        context = ModelContext(StationEntity.self)
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
