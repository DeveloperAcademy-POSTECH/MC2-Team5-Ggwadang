//
//  GuideLastPageView.swift
//  ggwadang
//
//  Created by SeongHoon Jang on 2022/06/13.
//

import SwiftUI

struct GuideLastPageView: View {
    let imageName: String
    let title: String
    let subtitle: String
    
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        VStack {
            Image(imageName)
                .font(.system(size: 100))
                .padding()
            
            VStack (alignment: .leading){
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text(subtitle)
                    .font(.title2)
                    .padding()
            }
            
            Button {    // 온보딩 완료 버튼
                isFirstLaunching.toggle()
            } label: {
                Text("시작하기")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .frame(width: 200, height: 50)
                    .background(Color.white)
                    .cornerRadius(30)
            }
            .padding()
        }

    }
}
