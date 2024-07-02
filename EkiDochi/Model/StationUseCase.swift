//
//  StationUseCase.swift
//  EkiDochi
//
//  Created by user on 2024/06/28.
//

import Foundation
import SwiftData

class StationUseCase {
    private let repository: StationRepository
    private let context: ModelContext
    
    init(repository: StationRepository, context: ModelContext) {
        self.repository = repository
        self.context = context
    }
    
    func loadStations() -> [StationEntity]? {
        return repository.loadStationsFromCSV(fileName: "stations")
    }
    
    func saveStations(_ stations: [StationEntity]) {
        repository.saveStations(stations, context: context)
    }
}
