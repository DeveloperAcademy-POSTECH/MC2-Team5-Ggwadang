//
//  RecordDB.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import Foundation
import RealmSwift

class RecordDB: Object {
    @objc dynamic var id = 0
    @objc dynamic var date = ""
    @objc dynamic var large = ""
    @objc dynamic var medium = ""
    @objc dynamic var small = ""
    @objc dynamic var sugar = 0.0
    
    override static func primaryKey() -> String? {
        "id"
    }
}
