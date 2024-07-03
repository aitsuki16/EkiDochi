//
//  ViewController.swift
//  EkiDochi
//
//  Created by user on 2024/06/28.
//

import UIKit
import SwiftData

class StationViewController: UIViewController {
    private let useCase = StationUseCase(repository: StationRepository())

    override func viewDidLoad() {
        super.viewDidLoad()
        testLoadAndSaveStations()
        if let stations = useCase.loadStations() {
            // display stations
            for station in stations {
                print(station.stationName)
            }
        } else {
            print("Failed to load stations")
        }
    }
    
    //test
    func testLoadAndSaveStations() {
        if let stations = useCase.loadStations() {
            for station in stations {
                print("Loaded station: \(station.stationName)")
            }
            useCase.saveStations(stations)
        }
    }
}

