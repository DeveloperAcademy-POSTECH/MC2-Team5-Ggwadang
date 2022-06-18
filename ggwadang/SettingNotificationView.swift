//
//  SettingNotificationView.swift
//  ggwadang
//
//  Created by Hyemin Choi on 2022/06/18.
//

import SwiftUI

struct SettingNotificationView: View {
    
    @State private var someToggle = true
    @State var selectedButton: Int = 1
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 21, weight: .medium))
                Spacer()
                Text("알림 설정")
                Spacer()
                Image(systemName: "xmark")
                    .font(.system(size: 21, weight: .medium))
            }
            Spacer()
                .frame(height: 50)
            HStack {
                Toggle("알림 허용", isOn: $someToggle)
                        .toggleStyle(SwitchToggleStyle(tint: (Color("MainColor"))))
                someToggle ? Text("") : Text("")

            }
            Divider()
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            HStack {
                Text("반복")
                Spacer()
            }
//            Button(action: {
//                        print("")
//                        }) {
//                        Text("월")
//                            .frame(width: 36, height: 36)
//                            .foregroundColor(Color.gray)
//                            .clipShape(Circle())
//                    }
            HStack {
                Button(action: {
                            selectedButton = 0
                        }
                        , label: {
                            Text("월")
                        .frame(width: 36, height: 36)
                        .foregroundColor(Color.gray)
                        .clipShape(Circle())
                        })
                        .border(selectedButton == 0 ? Color.gray : Color.gray, width: 1)
            }
        }
        .padding()
    }
}

struct SettingNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        SettingNotificationView()
    }
}
