//
//  MainView.swift
//  ggwadang
//
//  Created by seungyeon oh on 2022/06/14.
//

import SwiftUI

var today = Date()

// 배경색 선언
let backgroundGreen = LinearGradient(gradient: Gradient(colors: [Color("mint"), Color("green")]), startPoint: .top, endPoint: .bottom)
let backgroundYellow = LinearGradient(gradient: Gradient(colors: [Color("yellow"), Color("orange")]), startPoint: .top, endPoint: .bottom)
let backgroundRed = LinearGradient(gradient: Gradient(colors: [Color("tangerine"), Color("coral")]), startPoint: .top, endPoint: .bottom)
let backgroundBlack = LinearGradient(gradient: Gradient(colors: [Color("gray"), Color("black")]), startPoint: .top, endPoint: .bottom)

struct MainView: View {
    @State private var todaySugarValue: Int = 18
    @State private var sugarGoalValue: Int = 40
    @State var progressValue: Float =  0.9
    
    public var testNumber: Float = 9.9
    static var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            
            //날짜, 설정
            VStack{
                HStack {
                    Text(" ")
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.white)
                        .padding(20.0)
                    Spacer()
                    Text("\(today, formatter: MainView.dateFormat)")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity, alignment: .center)
                    Spacer()
                    NavigationLink(destination: SettingView()) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(.white)
                            .padding(20.0)
                    }
                }
                ProgressCircleView(progress: self.$progressValue)
                Spacer()
            }.offset(y:-100)
                .background(backGround(number: progressValue))
        }
        .navigationBarTitle("main")
    }//end of Body()
    
    //Func backGround()
    func backGround(number: Float) -> LinearGradient {
        if progressValue <= 0.39 {
            return backgroundGreen
        } else if progressValue <= 0.79 {
            return backgroundYellow
        } else if progressValue <= 0.99 {
            return backgroundRed
        } else {
            return backgroundBlack
        }
    }
    //end of backGround()
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
