//
//  LargeCategoryView.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import SwiftUI

struct LargeCategoryView: View {
    @State var large_isSelected = ""
    @State var medium_isSelected = ""
    @State var small_isSelected = ""
    
    // FIXME: 대분류 확정되면 변경
    let largeArray = [["베이커리","🥐"], ["과자","🍪"], ["음료","🥤"], ["아이스크림","🍦"], ["캔디,젤리,양갱","🍬"], ["초콜릿,캐러멜","🍫"], ["유가공품","🥛"], ["떡","🍡"],["견과류","🥜"]]
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            VStack {
                Button {
                    UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
                } label: {
                    Image(systemName: "xmark")
                }.frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 20)
                NavigationLink(destination: SearchView()) {
                    Text("검색")
                    Image(systemName: "magnifyingglass")
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 20)
                
                LazyVGrid(columns: gridItemLayout, spacing: 10) {
                    ForEach((0..<largeArray.count), id: \.self) { num in
                        NavigationLink(destination: MediumCategoryView(large_isSelected: self.$large_isSelected, medium_isSelected: self.$medium_isSelected, small_isSelected: self.$small_isSelected)) {
                            VStack {
                                Text(largeArray[num][1])
                                Text(largeArray[num][0]).foregroundColor(.black)
                            }
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            large_isSelected=largeArray[num][0]
                        })
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarHidden(true)
                        .frame(width: 110, height: 110)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5, y: 3))
                    }
                }.padding(.top, 5)
                Spacer()
            }
        }
    }
}
