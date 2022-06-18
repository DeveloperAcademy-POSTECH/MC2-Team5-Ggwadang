//
//  MainView2.swift
//  ggwadang
//
//  Created by Hyemin Choi on 2022/06/15.
//

import SwiftUI

struct MainView2: View {
    var body: some View {
        VStack{
            ZStack {
                Color.green
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
                        Text("15g")
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
                        Text("100g")
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
                        Text("85g")
                            .fontWeight(.bold)
                    }
                }
                .foregroundColor(Color.white)
            }
            ZStack {
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
}

struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView2()
    }
}
