//
//  StationRepository.swift
//  EkiDochi
//
//  Created by user on 2024/06/28.
//
import Foundation
import SwiftData

class StationRepository {
    func loadStationsFromCSV(fileName: String) -> [StationEntity]? {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "csv") else {
            print("CSV file not found")
            return nil
        }
        
        do {
            let csvData = try String(contentsOf: fileURL, encoding: .utf8)
            let rows = csvData.components(separatedBy: "\n").filter { !$0.isEmpty }
            var stations: [StationEntity] = []
            
            for row in rows {
                let columns = row.components(separatedBy: ",")
                if columns.count >= 15 {
                    if let stationCd = Int(columns[0]),
                       let stationGcd = Int(columns[1]),
                       let lineCd = Int(columns[3]),
                       let prefCd = Int(columns[4]),
                       let lon = Double(columns[9]),
                       let lat = Double(columns[10]),
                       let eStatus = Int(columns[13]),
                       let eSort = Int(columns[14]) {
                        
                        let station = StationEntity(
                            stationCd: stationCd,
                            stationGcd: stationGcd,
                            stationName: columns[2],
                            stationNameK: columns[5],
                            stationNameR: columns[6],
                            lineCd: lineCd,
                            prefCd: prefCd,
                            post: columns[7],
                            address: columns[8],
                            lon: lon,
                            lat: lat,
                            openYmd: columns[11],
                            closeYmd: columns[12],
                            eStatus: eStatus,
                            eSort: eSort
                        )
                        stations.append(station)
                    }
                }
            }
            return stations
        } catch {
            print("Error reading CSV file: \(error)")
            return nil
        }
    }
    
    func saveStations(_ stations: [StationEntity], context: ModelContext) {
        for station in stations {
            context.insert(station)
        }
        do {
            try context.save()
        } catch {
            print("Failed to save stations: \(error)")
        }
    }
}
