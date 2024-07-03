//
//  StationRepository.swift
//  EkiDochi
//
//  Created by user on 2024/06/28.
//
import Foundation
import SwiftData

class StationRepository {
    private let dataManager = DataManager.shared
    
    func loadStationsFromCSV(fileName: String) -> [StationEntity]? {
        guard let fileURL = Bundle.main.url(forResource: "station", withExtension: "csv") else {
            print("CSV file not found")
            return nil
        }
        
        do {
            let csvData = try String(contentsOf: fileURL, encoding: .utf8)
            let rows = csvData.components(separatedBy: "\n").filter { !$0.isEmpty }
            var stations: [StationEntity] = []
            
            for row in rows {
                let columns = row.components(separatedBy: ",")
                if columns.count >= 15,
                   let stationCd = Int(columns[0]),
                   let stationGcd = Int(columns[1]),
                   let lineCd = Int(columns[5]),
                   let prefCd = Int(columns[6]),
                   let lon = Double(columns[9]),
                   let lat = Double(columns[10]),
                   let eStatus = Int(columns[13]),
                   let eSort = Int(columns[14]) {
                    
                    let station = StationEntity(
                        stationCd: stationCd,
                        stationGcd: stationGcd,
                        stationName: columns[2],
                        stationNameK: columns[3].isEmpty ? nil : columns[3],
                        stationNameR: columns[4].isEmpty ? nil : columns[4],
                        lineCd: lineCd,
                        prefCd: prefCd,
                        post: columns[7].isEmpty ? nil : columns[7],
                        address: columns[8],
                        lon: lon,
                        lat: lat,
                        openYmd: columns[11].isEmpty ? nil : columns[11],
                        closeYmd: columns[12].isEmpty ? nil : columns[12],
                        eStatus: eStatus,
                        eSort: eSort
                    )
                    stations.append(station)
                }
            }
            return stations
            
        } catch {
            print("Error reading CSV file: \(error)")
            return nil
        }
    }
    
    
    func saveStations(_ stations: [StationEntity]) {
        for station in stations {
            dataManager.context.insert(station)
        }
        dataManager.saveContext()
    }
}
