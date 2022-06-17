//
//  MainFullListView.swift
//  ggwadang
//
//  Created by Hyemin Choi on 2022/06/17.
//

import SwiftUI

struct MainFullListView: View {
    
    @State private var date: String = "2022년 6월 5일"
    @State private var name: String = "오렌지주스"
    @State private var intakeVolume: String = "300ml"
    @State private var sugarVolume: String = "당류 10g"
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 21, weight: .medium))
                Spacer()
                Text("\(date)")
                Spacer()
            }
            Spacer()
                .frame(height: 30)
            HStack {
                VStack (alignment: .leading){
                    Text("\(name)")
                    Text("\(intakeVolume)")
                        .font(.system(size:13))
                }
                Spacer()
                Text("\(sugarVolume)")
            }
            Divider()
            HStack {
                VStack (alignment: .leading){
                    Text("\(name)")
                    Text("\(intakeVolume)")
                        .font(.system(size:13))
                }
                Spacer()
                Text("\(sugarVolume)")
            }
            Divider()
            
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct MainFullListView_Previews: PreviewProvider {
    static var previews: some View {
        MainFullListView()
    }
}
