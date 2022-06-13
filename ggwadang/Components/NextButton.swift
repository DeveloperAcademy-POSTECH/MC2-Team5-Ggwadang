//
//  NextButton.swift
//  ggwadang
//
//  Created by SeongHoon Jang on 2022/06/13.
//

import SwiftUI

// 다음으로 버튼
// 아래 Previews 처럼 사용하면 된다.
struct NextButton: View {
    var buttonText : String
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color(hex: 0x6CADA5))
            Text("\(buttonText)")
                .foregroundColor(.white)
        }
        
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        NextButton(buttonText: "다음으로")
            .frame(height: 50)
    }
}
