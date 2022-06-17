//
//  MainView2.swift
//  ggwadang
//
//  Created by Hyemin Choi on 2022/06/15.
//

import SwiftUI

struct MainView2: View {
    
    @State private var intakeSugar: Int = 15
    @State private var targetSugar: Int = 100
    
    var body: some View {
        ZStack {
            Color.green
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .opacity(0.2)
                        .frame(width: 350, height: 80)
                    HStack {
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
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView2()
    }
}
