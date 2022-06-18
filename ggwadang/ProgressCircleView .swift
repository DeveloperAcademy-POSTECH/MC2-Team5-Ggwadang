//
//  ProgressBarView .swift
//  ggwadang
//
//  Created by seungyeon oh on 2022/06/16.
//

import SwiftUI

struct ProgressCircleView : View {
    @Binding var progress: Float
    @State var start = 1.0
    
    var body: some View {
        ZStack {
            ZStack{
                // 진행률 100% 이상일 때 진행바 검정색
                if progress >= 1.0 {
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 21.0)
                            .foregroundColor(Color.black)
                        Circle()
                            .trim(from:0.0, to: CGFloat(min(self.progress-1, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 21.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(-90.0))
                        Circle()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color("gray"))
                            .offset(y: -125)
                            .opacity(0.5)
                            .rotationEffect(.degrees(Double(progress)) * 360)
                        
                    }
                } else {
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 21.0)
                            .opacity(0.25)
                            .foregroundColor(Color.white)
                        Circle()
                            .trim(from:0.0, to: CGFloat(min(self.progress, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 21.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(-90.0))
                            .animation(.easeIn, value: progress)
                        
                        // 진행률에 따른 진행바 끝 원 색 변경
                        if progress <= 0.39 {
                            Circle()
                                .frame(width: 22, height: 22)
                                .foregroundColor(Color("mint"))
                                .offset(y: -125)
                                .opacity(0.5)
                                .rotationEffect(.degrees(Double(progress)) * 360)
                        } else if progress <= 0.79 {
                            Circle()
                                .frame(width: 22, height: 22)
                                .foregroundColor(Color("yellow"))
                                .offset(y: -125)
                                .opacity(0.5)
                                .rotationEffect(.degrees(Double(progress)) * 360)
                        } else {
                            Circle()
                                .frame(width: 22, height: 22)
                                .foregroundColor(Color("tangerine"))
                                .offset(y: -125)
                                .opacity(0.5)
                                .rotationEffect(.degrees(Double(progress)) * 360)
                        }
                    }
                }
            }.frame(width: 250, height: 250)
            //https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/
            
            // 진행률 표시, 진행률에 따른 이미지 변경
            ZStack {
                Text(String(format: "%.0f %%", min(self.progress, 3.0)*100.0))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 0, y: -55)
                ZStack{
                    mainImage(number: progress)
                        .resizable()
                        .frame(width: 200, height: 200)
                }.offset(x: 0, y: 20)
            }
        }.padding()
    }
    
    //func mainImage
    func mainImage(number: Float) -> Image {
        if progress <= 0.39 {
            return Image("꽈당이 1")
        } else if progress <= 0.79 {
            return Image("꽈당이 2")
        } else if progress <= 0.99 {
            return Image("꽈당이 3")
        } else {
            return Image("꽈당이 4")
        }
    }
    //end mainImage
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progress: .constant(1.5))
    }
}

