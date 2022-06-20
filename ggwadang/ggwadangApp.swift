//
//  ggwadangApp.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/05.
//

import SwiftUI
import RealmSwift

@main
struct ggwadangApp: SwiftUI.App {
    var body: some Scene {
        let realm = try! Realm()
        WindowGroup {
            //tabView()
            ContentView()
                .environmentObject(RecordStore(realm: realm))
                .environmentObject(FoodStore(realm: realm))
        }
    }
}
