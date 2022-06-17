//
//  MainListView.swift
//  ggwadang
//
//  Created by Hyemin Choi on 2022/06/17.
//

import SwiftUI

struct MainListView: View {
    
    @State private var name: String = "오렌지주스"
    @State private var intakeVolume: String = "300ml"
    @State private var sugarVolume: String = "당류 10g"
    
    var body: some View {
        VStack {
            HStack {
                Text("오늘의 당 섭취")
                Spacer()
                Text("전체보기")
                    .foregroundColor(Color("MainColor"))
                    .font(.system(size: 17, weight: .medium))
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .frame(width: 350, height: 80)
                    .shadow(color: .gray.opacity(0.15), radius: 20, x: 0, y: 3)
                    .blur(radius: 0)
                HStack {
                    HStack {
                        VStack (alignment: .leading){
                            Text("\(name)")
                            Text("\(intakeVolume)")
                                .font(.system(size:13))
                        }
                        Spacer()
                        Text("\(sugarVolume)")
                    }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .frame(width: 350, height: 80)
                    .shadow(color: .gray.opacity(0.15), radius: 20, x: 0, y: 3)
                    .blur(radius: 0)
                HStack {
                    HStack {
                        VStack (alignment: .leading){
                            Text("\(name)")
                            Text("\(intakeVolume)")
                                .font(.system(size:13))
                        }
                        Spacer()
                        Text("\(sugarVolume)")
                    }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                }
            }
        }
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }


struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
}

