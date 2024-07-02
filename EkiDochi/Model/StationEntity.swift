//
//  StationEntity.swift
//  EkiDochi
//
//  Created by user on 2024/06/28.
//

import Foundation
import SwiftData

@Model
class StationEntity {
    var id: UUID?
    var stationCd: Int
    var stationGcd: Int
    var stationName: String
    var stationNameK: String?
    var stationNameR: String?
    var lineCd: Int
    var prefCd: Int
    var post: String?
    var address: String
    var lon: Double
    var lat: Double
    var openYmd: String?
    var closeYmd: String?
    var eStatus: Int
    var eSort: Int

    init(stationCd: Int, stationGcd: Int, stationName: String, stationNameK: String? = nil, stationNameR: String? = nil, lineCd: Int, prefCd: Int, post: String? = nil, address: String, lon: Double, lat: Double, openYmd: String? = nil, closeYmd: String? = nil, eStatus: Int, eSort: Int) {
        self.id = UUID()
        self.stationCd = stationCd
        self.stationGcd = stationGcd
        self.stationName = stationName
        self.stationNameK = stationNameK
        self.stationNameR = stationNameR
        self.lineCd = lineCd
        self.prefCd = prefCd
        self.post = post
        self.address = address
        self.lon = lon
        self.lat = lat
        self.openYmd = openYmd
        self.closeYmd = closeYmd
        self.eStatus = eStatus
        self.eSort = eSort
    }
}
