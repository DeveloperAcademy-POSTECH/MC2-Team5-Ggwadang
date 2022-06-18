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
    @Binding var nickName: String
    
    @State var recommendSugar : Double = 0
    
    let genderType = ["남성","여성"]
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("하루 목표 당 섭취량을\n선택해 주세요.")
                .font(.body)
                .bold()
                .padding(.bottom, 30)
            Text("\(String(format: "%.0f", sugar))g")
                .font(.largeTitle)
                .bold()
            
            Slider(value: $sugar, in: 0...100, step: 1.0)
                .accentColor(Color(hex: 0x6CADA5))
            
            Text("* \(nickName)님의 일일 당 섭취 권장량은 \(Int(recommendSugar))g 입니다.")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Spacer()
            
            Button {
                isFirstDataInput.toggle()
            } label: {
                NextButton(buttonText: "시작하기")
                    .buttonStyle(PlainButtonStyle())
                    .frame(height: 50)
            }
            .padding()
        }
        .onAppear {
            // 권장 섭취량을 기억한다.
            recommendSugar = sugar
        }
        // 커스텀 Navigation Back 버튼 구현 필요!
        //        .navigationBarHidden(true)
        .padding()
    }
}
