//
//  ListView.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import SwiftUI

struct ListView: View {
    @State var isPresented = false
    
    var body: some View {
        VStack{
            Spacer()
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "plus")
            }
            .fullScreenCover(isPresented: $isPresented, content: {LargeCategoryView(isPresented: self.$isPresented)})
        }
    }
}
