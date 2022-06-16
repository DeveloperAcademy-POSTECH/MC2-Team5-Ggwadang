//
//  EnterSugarView.swift
//  ggwadang
//
//  Created by SeongHoon Jang on 2022/06/13.
//

import SwiftUI

struct EnterSugarView: View {
    @AppStorage(StorageKeys.sugar.rawValue) private var sugar : Double = UserDefaults.standard.double(forKey: "sugar")
    
    @Binding var isFirstDataInput: Bool
    
    let genderType = ["남성","여성"]
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("하루 목표 당 섭취량을\n선택해 주세요.")
                .font(.title)
                .bold()
            Text("\(String(format: "%.1f", sugar))g")
                .font(.title3)
                .padding()
            Slider(value: $sugar, in: 0...100, step: 1.0)
                .accentColor(Color(hex: 0x6CADA5))
                .padding()
            Spacer()
            
            Button {
                isFirstDataInput.toggle()
            } label: {
                NextButton(buttonText: "시작하기")
                    .buttonStyle(PlainButtonStyle())
                    .frame(height: 50)
//                Text("시작하기")
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .frame(width: 200, height: 50)
//                    .background(Color.blue)
//                    .cornerRadius(6)
            }
            .padding()
        }
        // 커스텀 Navigation Back 버튼 구현 필요!
//        .navigationBarHidden(true)
        .padding()
    }
}
