//
//  AgeSegmentedBar.swift
//  ggwadang
//
//  Created by SeongHoon Jang on 2022/06/13.
//

import SwiftUI

struct GenderSegmentedBar: View {
    
    @Binding var selected: Int
    // 버튼을 누르면 숫자가 바뀐다.(남자: 0, 여자: 1)
    // 다른 버튼을 누르면 원래 눌렀던 버튼이 해제되는 애니메이션이 적용되어있음
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button {
                    withAnimation {
                        self.selected = 0
                    }
                } label: {
                    Text("남자")
                        .font(.headline)
                        .frame(width: geometry.size.width/2)
                        .foregroundColor(selected == 0 ? .white: .black)
                        .padding(13)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .fill(selected == 0 ? Color(hex: 0x6CADA5) : Color.clear)
                        )
                }
                Spacer()
                Button {
                    withAnimation {
                        self.selected = 1
                    }
                } label: {
                    Text("여자")
                        .font(.headline)
                        .frame(width: geometry.size.width/2)
                        .foregroundColor(selected == 1 ? .white : .black)
                        .padding(13)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .fill(selected == 1 ? Color(hex: 0x6CADA5) : Color.clear)
                        )
                }
                
            }
            .padding(5)
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

///** 테스트용 **/
//struct CustomSegmentedView: View {
//    @State private var selection: Int = 0
//    var body: some View {
//        VStack {
//            GenderSegmentedBar(selected: $selection)
//        }
//    }
//}
//
//struct CustomSegmentedView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSegmentedView()
//    }
//}
