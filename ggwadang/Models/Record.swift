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
    let sugar: Double
}

extension Record {
    init(recordDB: RecordDB) {
        id = recordDB.id
        date = recordDB.date
        large = recordDB.large
        medium = recordDB.medium
        small = recordDB.small
        sugar = recordDB.sugar
    }
}
