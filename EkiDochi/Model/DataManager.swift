//
//  DataManager.swift
//  EkiDochi
//
//  Created by user on 2024/07/01.
//
import SwiftData

class DataManager {
    static let shared = DataManager()
    
    let context: ModelContext
    
    private init() {
        let container = try! ModelContainer(for: StationEntity.self)
        context = ModelContext(container)
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            fatalError("Unresolved error \(error.localizedDescription)")
        }
    }
}
