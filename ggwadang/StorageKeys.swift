//
//  StorageKeys.swift
//  GwadangAntony
//
//  Created by SeongHoon Jang on 2022/06/05.
//

import SwiftUI

// AppStorage에 저장되는 키값을 열거
enum StorageKeys: String {
    case nickName, gender, age, sugar, isFirstLaunching, isFirstDataInput
}

/*
 사용자 기본값에서 읽고자 하는 각 데이터 조각의 키를 제공해야 합니다.
 그러나 @AppStorage앱에서 속성을 더 많이 사용할수록 키에 오타 오류가 발생할 위험이 높아집니다.
 그렇게 중요하게 들리지 않더라도 사용자 기본값에서 읽거나 쓰기가 제대로 작동하지 않는 이유를 파악하는 데 불필요한 시간 손실이 발생할 수 있습니다.

 따라서 이 모든 것을 피하고 키 이름을 입력하는 동안 우발적인 오류가 발생하지 않도록 하기 위해 개인적으로 열거형을 정의하는 것을 선호합니다.
 출처: https://serialcoder.dev/text-tutorials/swiftui/using-the-appstorage-property-wrapper-in-swiftui/
 */
