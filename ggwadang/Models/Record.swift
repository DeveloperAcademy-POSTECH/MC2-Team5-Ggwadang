//
//  Record.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import Foundation

struct Record: Identifiable {
    let id: Int
    let date: String
    let large: String
    let medium: String
    let small: String
    let calculatedSugar: Double
    let foodAmount: Double
    let unit: String
}

extension Record {
    init(recordDB: RecordDB) {
        id = recordDB.id
        date = recordDB.date
        large = recordDB.large
        medium = recordDB.medium
        small = recordDB.small
        calculatedSugar = recordDB.calculatedSugar
        foodAmount = recordDB.foodAmount
        unit = recordDB.unit
    }
}
