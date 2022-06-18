//
//  ContentView.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/05.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: RecordStore
    var body: some View {
        ListView(records: store.records)
//        Text("Hello, world!")
//            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
