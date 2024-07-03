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

        if let stations = useCase.loadStations() {
            // display stations
            for station in stations {
//                print(station.stationName)
//                print(station.lat)
                print(station.address)
            }
        } else {
            print("Failed to load stations")
        }
    }
}

