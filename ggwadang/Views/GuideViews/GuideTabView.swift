//
//  HelpTabView.swift
//  GwadangAntony
//
//  Created by SeongHoon Jang on 2022/06/09.
//

import SwiftUI

struct GuideTabView: View {
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x9DD2B9), Color(hex: 0x6CADA5)]),
                           startPoint: .top, endPoint: .bottom)
            
            .edgesIgnoringSafeArea(.all)
            ZStack {
                TabView {
                    // 페이지 1:
                    GuidePageView(
                        imageName: "dang1",
                        title: "도움말 페이지에요.",
                        subtitle: "넹"
                    )
                    
                    // 페이지 2:
                    GuidePageView(
                        imageName: "dang2",
                        title: "숭구리당당 숭당당",
                        subtitle: "수구수구당당 숭당당"
                    )
                    
                    // 페이지 3: 마지막 페이지
                    GuideLastPageView(
                        imageName: "dang3",
                        title: "경로당",
                        subtitle: "노인들이 모여 여가를 선용할 수 있도록 지어 놓은 집 형태의 사회복지시설.방.",
                        isFirstLaunching: $isFirstLaunching
                    )
                }
                .tabViewStyle(PageTabViewStyle())   // tabView를 PageView처럼 만들어준다
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))    // 하단부 (. . .)
                
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            isFirstLaunching.toggle()
                        } label: {
                            Text("Skip")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding()
                        Spacer()
                    }
                }
            }
        }
    }
}
