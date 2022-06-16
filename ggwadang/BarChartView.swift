//
//  BarChartView.swift
//  ggwadang
//
//  Created by Hyemin Choi on 2022/06/15.
//

import SwiftUI

struct BarChartView: View {
    
    
    @State var pickerSelectedItem = 0

    @State var dataPoints: [[Double]] = [
        [35.7868, 100.7, 150.7, 20.7, 50.7, 10, 100],
        [30.7, 140.7, 20.7, 50.7, 90.7, 100, 60],
        [150, 40, 60, 80.7, 120.7, 110.7, 20]
    ]
    
    @State var week: [String] = [
        "0", "1", "2", "3", "4", "5", "6"
    ]
    
    @State var number: Double = 38.034535
    
    var body: some View {

        
        ZStack {
            VStack {
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("주").tag(0)
                    Text("월").tag(1)
                    Text("년").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                VStack (alignment: .leading){
                    HStack {
                        Text("섭취한 당류")
                            .font(.system(size: 17))
                        Spacer()
                        Text("2022.06.06 - 2022.06.12")
                    }.padding(.trailing,30)
                    Text("\(String(format: "%.1f", number))g")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,30)
                
                HStack (alignment: .bottom, spacing: 20){
                    BarView(value: dataPoints[pickerSelectedItem][0], week: "월")
                        .onTapGesture {
                            number = dataPoints[pickerSelectedItem][0]
                        }
                    BarView(value: dataPoints[pickerSelectedItem][1], week: "화")
                        .onTapGesture {
                            number = dataPoints[pickerSelectedItem][1]
                        }
                    BarView(value: dataPoints[pickerSelectedItem][2], week: "수")
                        .onTapGesture {
                            number = (dataPoints[pickerSelectedItem][2])
                        }
                    BarView(value: dataPoints[pickerSelectedItem][3], week: "목")
                        .onTapGesture {
                            number = (dataPoints[pickerSelectedItem][3])
                        }
                    BarView(value: dataPoints[pickerSelectedItem][4], week: "금")
                        .onTapGesture {
                            number = (dataPoints[pickerSelectedItem][4])
                        }
                    BarView(value: dataPoints[pickerSelectedItem][5], week: "토")
                        .onTapGesture {
                            number = (dataPoints[pickerSelectedItem][5])
                        }
                    BarView(value: dataPoints[pickerSelectedItem][6], week: "일")
                        .onTapGesture {
                            number = (dataPoints[pickerSelectedItem][6])
                        }
                }
                .animation(.default)
            }
        }
    }
    
    
struct BarView: View {
    
    var value: CGFloat
    var week: String
        
    var body: some View {
        HStack(alignment: .bottom) {
            VStack {
                Capsule().frame(width: 20, height: value)
                    .foregroundColor(.green)
                Text(week)
            }
        }
    }
}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
