//
//  extentions.swift
//  GwadangAntony
//
//  Created by SeongHoon Jang on 2022/06/09.
//

import SwiftUI

// Color에 기능을 추가하였다.
// Color(hex: 0x6CADA5) 와 같이 hex 값으로 색을 바로 쓸 수 있음.
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
