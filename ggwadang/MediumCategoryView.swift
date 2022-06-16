//
//  MediumCategoryView.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import SwiftUI

struct MediumCategoryView: View {
    @Binding var large_isSelected: String
    @Binding var medium_isSelected: String
    @Binding var small_isSelected: String
    
    // TODO: 데이터베이스로부터 대분류가 large_isSelected인 카테고리셋 불러오기
    @State var mediumArray = ["a", "b", "c", "d", "e", "f", "g"]
    
    var body: some View {
        List(0..<mediumArray.count) { num in
            NavigationLink(destination: SmallCategoryView(large_isSelected: self.$large_isSelected, medium_isSelected: self.$mediumArray[num], small_isSelected: self.$small_isSelected)) {
                Text(mediumArray[num])
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text(large_isSelected)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action:{
                    UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
                }){Image(systemName: "xmark")}
            }
        }
    }
}
