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
                .trim(from:0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 23.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            }.frame(width: 250, height: 250)
        }//.background(.yellow)
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progress: .constant(30))
    }
}

//https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/
