//
//  StationUseCase.swift
//  EkiDochi
//
//  Created by user on 2024/06/28.
//

import UIKit
import SwiftData

class StationUseCase {
    private let repository: StationRepository
    
    init(repository: StationRepository) {
        self.repository = repository
    }
    
    func loadStations() -> [StationEntity]? {
        return repository.loadStationsFromCSV(fileName: "station")
    }
    
    func saveStations(_ stations: [StationEntity]) {
        repository.saveStations(stations)
    }
}

