//
//  RecordStore.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import SwiftUI
import Foundation
import RealmSwift

final class RecordStore: ObservableObject {
    private var recordResults: Results<RecordDB>
    
    init(realm: Realm) {
        recordResults = realm.objects(RecordDB.self)
    }
    var records: [Record] {
        recordResults.map(Record.init)
    }
}

extension RecordStore {
    func create(date: String, large: String, medium: String, small: String, sugar: Double) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            
            let recordDB = RecordDB()
            recordDB.id = UUID().hashValue
            recordDB.large = large
            recordDB.medium = medium
            recordDB.small = small
            recordDB.date = date
            recordDB.sugar = sugar
            
            try realm.write {
                realm.add(recordDB)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func delete(id: Int) {
        objectWillChange.send()
        guard let recordDB = recordResults.first(
            where: { $0.id == id })
        else { return }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(recordDB)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
