//
//  MediumCategoryView.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import SwiftUI

struct MediumCategoryView: View {
    @EnvironmentObject var store: RecordStore
    @Binding var isPresented: Bool
    @Binding var large_isSelected: String
    @Binding var medium_isSelected: String
    @Binding var small_isSelected: String
    
    // TODO: 데이터베이스로부터 대분류가 large_isSelected인 카테고리셋 불러오기
    @State var mediumArray = ["a", "b", "c", "d", "e", "f", "g"]
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 10) {
            ForEach((0..<mediumArray.count), id: \.self) { num in
                NavigationLink(destination: SmallCategoryView(isPresented: self.$isPresented, large_isSelected: self.$large_isSelected, medium_isSelected: self.$medium_isSelected, small_isSelected: self.$small_isSelected).environmentObject(self.store)) {
                        Text(mediumArray[num]).foregroundColor(.black)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    medium_isSelected=mediumArray[num]
                })
                .modifier(gridModifier())
            }
        }
        .padding(.top, 20)
        .padding([.leading, .trailing], 20)
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text(large_isSelected)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action:{
                    isPresented.toggle()
                }){Image(systemName: "xmark")}
            }
        }
        Spacer()
    }
}


struct gridModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 110, height: 60)
            .background(RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, y: 3))
    }
    
}
