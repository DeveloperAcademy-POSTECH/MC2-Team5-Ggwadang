//
//  ListView.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import SwiftUI
import RealmSwift

struct ListView: View {
    @EnvironmentObject var store: RecordStore
    @State var isPresented = false
    let records: [Record]
    
    var body: some View {
        VStack{
            List {
                if records.isEmpty {
                    Text("List is now empty...")
                }
                ForEach(records) { record in
                    RecordRow(record: record).environmentObject(self.store)
                }
            }
            Spacer()
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "plus")
            }
            .fullScreenCover(isPresented: $isPresented, content: {LargeCategoryView(isPresented: self.$isPresented).environmentObject(self.store)})
        }
    }
}

struct RecordRow: View {
    @EnvironmentObject var store: RecordStore
    let record: Record
    
    var body: some View {
        HStack {
            Text("\(record.large) > \(record.medium) > \(record.small) / \(record.date)")
            Spacer()
            Text("\(record.sugar, specifier: "%.1f")g").bold()
            Button(action: deleteRecord) {
                Image(systemName: "trash.circle.fill")
            }
        }
    }
}

extension RecordRow {
    func deleteRecord() {
        withAnimation {
            store.delete(id: record.id)
        }
    }
}

