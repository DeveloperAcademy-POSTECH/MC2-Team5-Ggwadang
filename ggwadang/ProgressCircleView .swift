//
//  ProgressBarView .swift
//  ggwadang
//
//  Created by seungyeon oh on 2022/06/16.
//

import SwiftUI

struct ProgressCircleView : View {
    @Binding var progress: Float

    var body: some View {
        ZStack {
            ZStack{
                Circle()
                    .stroke(lineWidth: 23.0)
                    .opacity(0.25)
                    .foregroundColor(Color.white)
                
                Circle()
                    .trim(from:0.0, to: CGFloat(min(self.progress, 2.0)))
                    .stroke(style: StrokeStyle(lineWidth: 23.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(-90.0))
                    .animation(.easeOut, value: progress)
            }.frame(width: 250, height: 250)
            //https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/

            ZStack {
                Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                if progress <= 0.39 {
                    Image("꽈당이 1")
                        .resizable()
                        .frame(width: 200, height: 200)
                } else if progress <= 0.79 {
                    Image("꽈당이 2")
                        .resizable()
                        .frame(width: 200, height: 200)
                } else if progress <= 0.99 {
                    Image("꽈당이 3")
                        .resizable()
                        .frame(width: 200, height: 200)
                } else {
                    Image("꽈당이 4")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
            }
        }//.background(LinearGradient(gradient: Gradient(colors: [Color("mint"), Color("green")]), startPoint: .top, endPoint: .bottom))
         .padding()
    }
}
struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progress: .constant(30))
    }
}

