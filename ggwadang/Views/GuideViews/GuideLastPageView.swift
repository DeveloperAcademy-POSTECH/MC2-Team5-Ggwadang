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
            // 이미지 적용 완료
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: (UIScreen.main.bounds.width)*0.7, height: (UIScreen.main.bounds.width)*0.7)
                .padding()
            }
            
            VStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                .padding()
                Text(subtitle)
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Spacer()
                //MARK: - 도움말 온보딩 완료 버튼
                Button {
                    isFirstLaunching.toggle()
                } label: {
                    Text("시작하기")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .frame(width: 350, height: 50)
                        .background(Color.white)
                        .cornerRadius(30)
                }
                
            }
            .foregroundColor(.white)
            .frame(height: 300)

            
        }

    }
}
