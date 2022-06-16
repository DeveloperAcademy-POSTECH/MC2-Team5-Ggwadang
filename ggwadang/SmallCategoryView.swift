//
//  SmallCategoryView.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import SwiftUI

struct SmallCategoryView: View {
    @Binding var large_isSelected: String
    @Binding var medium_isSelected: String
    @Binding var small_isSelected: String
    
    //  TODO: 데이터베이스에서 대분류가 large_isSelected이고 중분류가 medium_isSelected인 카테고리셋 불러오기
    @State var smallArray = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차"]

    var body: some View {
        List(0..<smallArray.count) { num in
            NavigationLink(destination: IntakeAmountView(large_isSelected: self.$large_isSelected, medium_isSelected: self.$medium_isSelected, small_isSelected: self.$smallArray[num])) {
                Text(smallArray[num])
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text(medium_isSelected)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action:{
                    UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
                }){Image(systemName: "xmark")}
            }
        }
    }
}
