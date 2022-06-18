//
//  GuidePageView.swift
//  ggwadang
//
//  Created by SeongHoon Jang on 2022/06/13.
//

import SwiftUI

struct GuidePageView: View {
    let imageName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack {
            // Assets에 이미지 추가 필요함
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
            }
            .foregroundColor(.white)
            .frame(height: 300)
//            .background(Color.blue)
        }
    }
}

struct GuidePageView_Previews: PreviewProvider {
    static var previews: some View {
        GuidePageView(
            imageName: "note.text.badge.plus",
            title: "쓰기 탭",
            subtitle: "이 앱은 개인 메모장으로 쓸 수 있어요"
        )
    }
}
