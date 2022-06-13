//
//  TextFieldBox.swift
//  ggwadang
//
//  Created by SeongHoon Jang on 2022/06/13.
//

import SwiftUI

// 텍스트필드의 배경입니다.
// shadow를 통해 입체적으로 보이게 하였음.
struct TextFieldBox: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(.white)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//            .frame(height: 50)
    }
}

struct TextFieldBox_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBox()
    }
}
