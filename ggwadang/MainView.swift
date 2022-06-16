//
//  MainView.swift
//  ggwadang
//
//  Created by seungyeon oh on 2022/06/14.
//

import SwiftUI

var today = Date()

struct MainView: View {
    static var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Text("\(today, formatter: MainView.dateFormat)")
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity, alignment: .center)
                    NavigationLink(destination: SettingView()) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(.white)
                            .padding(20.0)
                    }
                }
                .navigationBarTitle("main")
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
