//
//  MainView3.swift
//  ggwadang
//
//  Created by Hyemin Choi on 2022/06/17.
//

import SwiftUI

struct MainView3: View {
    //variable declaration
    @State private var intakeSugar: Int = 15
    @State private var targetSugar: Int = 100
    
    var body: some View {

            //배경이 그려짐 -> 둥글어진 사각형
//            ZStack {
//
//            }
//            RoundedRectangle(cornerRadius: 15)
//                .fill(.white)
//                .opacity(0.2)
//                .frame(width: 350, height: 80)
            
            //배경안에 들어갈 내용 삽입
        ZStack {
            VStack{
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .opacity(0.2)
                            .frame(width: 350, height: 80)
                        VStack {
                            Text("섭취량")
                                .font(.system(size:15, weight: .medium))
                            Spacer()
                                .frame(height: 5)
                            Text("\(intakeSugar)g")
                                .fontWeight(.bold)
                        }
                        Spacer()
                            .frame(width: 35)
                        Divider()
                            .background(Color.white)
                            .frame(height: 40)
                            .overlay(.white)
                        Spacer()
                            .frame(width: 35)
                        VStack {
                            Text("목표량")
                                .font(.system(size:15, weight: .medium))
                            Spacer()
                                .frame(height: 5)
                            Text("\(targetSugar)g")
                                .fontWeight(.bold)
                        }
                        Spacer()
                            .frame(width: 35)
                        Divider()
                            .background(Color.white)
                            .frame(height: 40)
                            .overlay(.white)
                        Spacer()
                            .frame(width: 35)
                        
                        VStack {
                            Text("남은 양")
                                .font(.system(size:15, weight: .medium))
                            Spacer()
                                .frame(height: 5)
                            Text("\(targetSugar - intakeSugar)g")
                                .fontWeight(.bold)
                        }
                    }
                    
                }
        }
            
                .foregroundColor(.white)
                Spacer()
                ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: 390, height: 40, alignment: .bottom)
                HStack {
                    Image(systemName: "house.fill")
                                      Spacer()
                                            .frame(width: 100)
                                        Image(systemName: "plus")
                                            .font(Font.title.weight(.bold))
                                        Spacer()
                                            .frame(width: 100)
                                        Image(systemName: "chart.bar")
                                    }
                                    .font(.system(size:21))
                }
            }
            
            
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.green)
        //
    }


struct MainView3_Previews: PreviewProvider {
    static var previews: some View {
        MainView3()
    }
}
