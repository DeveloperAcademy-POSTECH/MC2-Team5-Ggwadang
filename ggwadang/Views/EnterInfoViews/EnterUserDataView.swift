//
//  EnterUserDataView.swift
//  ggwadang
//
//  Created by SeongHoon Jang on 2022/06/13.
//

import SwiftUI

struct EnterUserDataView: View {
    @AppStorage(StorageKeys.nickName.rawValue) private var nickName: String = UserDefaults.standard.string(forKey: "nickName") ?? ""    // 닉네임
    @AppStorage(StorageKeys.gender.rawValue) private var gender: Int = UserDefaults.standard.integer(forKey: "gender") // 유저의 성별(남:0, 여:1)
    @AppStorage(StorageKeys.age.rawValue) private var age: Int =  20 // 유저의 만나이(기본값 20)
    @AppStorage(StorageKeys.sugar.rawValue) private var sugar : Double = UserDefaults.standard.double(forKey: "sugar")  // 유저의 설탕값

    @Binding var isFirstDataInput: Bool

    let genderType = ["남성","여성"]    // 성별 테이블

    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                // 닉네임 입력
                Text("닉네임을 입력하세요.")
                    .font(.title)
                    .bold()
                ZStack {
                    TextFieldBox()
                    TextField("홍길동", text: $nickName).keyboardType(.default)
                        .padding(.leading)
                }
                .frame(height: 50)

                // 성별 선택(애니메이션 기능 구현 예정)
                Text("성별을 선택해주세요.")
                    .font(.title)
                    .bold()
                GenderSegmentedBar(selected: $gender)
                    .frame(height: 100)
                    .padding(.horizontal, 60)

                // 나이 선택
                Text("나이를 선택하세요.")
                    .font(.title)
                    .bold()
                Picker("나이를 선택하셈",selection: $age){
                    // 1살부터 75살까지
                    ForEach(0 ..< 76){
                        if $0 == 75 {
                            Text("만 76세 이상")
                        } else {
                            Text("만 \($0+1)세")
                        }

                    }
                }
                .pickerStyle(.wheel)
                .cornerRadius(20)

                NavigationLink(destination: EnterSugarView(isFirstDataInput: $isFirstDataInput)) {
                    NextButton(buttonText: "다음으로")
                        .frame(height: 50)
                }
                    .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .navigationBarHidden(true)

        }
        // 달력의 값이 변경될 때 마다 설탕 값 새롭게 갱신
        .onChange(of: $age.wrappedValue) { _ in
            sugar = sugarGram()
        }
        // 성별의 값이 변경될 때 마다 설탕 값 새롭게 갱신
        .onChange(of: $gender.wrappedValue) { _ in
            sugar = sugarGram()
        }
        // 처음 뷰가 생성되었을 때도 설탕 값을 갱신
        .onAppear {
            sugar = sugarGram()
        }
    }

    // 나이와 성별에 따른 kcal를 통해 권장 섭취 당을 구하는 함수
    func sugarGram() -> Double {
        var kcal : Double = 0
        let realAge = age + 1
        if gender == 0 {    // 남자인 경우
            switch realAge {
            case 1...2:     // 1~2 세
                kcal = 900
            case 3...5:     // 3~5 세
                kcal = 1400
            case 6...8:
                kcal = 1700
            case 9...11:
                kcal = 2000
            case 12...14:
                kcal = 2500
            case 15...18:
                kcal = 2700
            case 19...29:
                kcal = 2600
            case 30...49:
                kcal = 2500
            case 50...64:
                kcal = 2200
            case 65...74:
                kcal = 2000
            case 75... :
                kcal = 1900
            default:
                kcal = 0
            }
        } else if gender == 1 { // 여자인 경우
            switch realAge {
            case 1...2:
                kcal = 900
            case 3...5:
                kcal = 1400
            case 6...8:
                kcal = 1500
            case 9...11:
                kcal = 1800
            case 12...14:
                kcal = 2000
            case 15...18:
                kcal = 2000
            case 19...29:
                kcal = 2000
            case 30...49:
                kcal = 1900
            case 50...64:
                kcal = 1700
            case 65...74:
                kcal = 1600
            case 75... :
                kcal = 1500
            default:
                kcal = 0
            }
        }
        // 하루 필요 추정량(kcal)의 10%에 대한 당(g)을 계산
        return kcal / 40
    }

}
