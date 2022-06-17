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
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"
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
                    .animation(.spring(), value: dataPoints)
                
                VStack (alignment: .leading){
                    HStack {
                        Text("섭취한 당류")
                            .font(.system(size: 15))
                        Spacer()
                        Text("2022.06.06 - 2022.06.12")
                    }.padding(.trailing,30)
                    Text("\(String(format: "%.1f", number))g")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,30)
                switch pickerSelectedItem{
                case 0:
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
                case 1:
                    HStack (alignment: .bottom, spacing: 20){
                        BarView(value: dataPoints[pickerSelectedItem][0], week: "1째주")
                            .onTapGesture {
                                number = dataPoints[pickerSelectedItem][0]
                            }
                        BarView(value: dataPoints[pickerSelectedItem][1], week: "2째주")
                            .onTapGesture {
                                number = dataPoints[pickerSelectedItem][1]
                            }
                        BarView(value: dataPoints[pickerSelectedItem][2], week: "3째주")
                            .onTapGesture {
                                number = (dataPoints[pickerSelectedItem][2])
                            }
                        BarView(value: dataPoints[pickerSelectedItem][3], week: "4째주")
                            .onTapGesture {
                                number = (dataPoints[pickerSelectedItem][3])
                            }
                    }
                    .animation(.default)
                case 2:
                    HStack (alignment: .bottom, spacing: 7){
                        Group {
                            BarView(value: dataPoints[pickerSelectedItem][0], week: "1월")
                                .onTapGesture {
                                    number = dataPoints[pickerSelectedItem][0]
                                }
                            BarView(value: dataPoints[pickerSelectedItem][1], week: "2월")
                                .onTapGesture {
                                    number = dataPoints[pickerSelectedItem][1]
                                }
                            BarView(value: dataPoints[pickerSelectedItem][6], week: "3월")
                                .onTapGesture {
                                    number = (dataPoints[pickerSelectedItem][6])
                                }
                            BarView(value: dataPoints[pickerSelectedItem][0], week: "4월")
                                .onTapGesture {
                                    number = dataPoints[pickerSelectedItem][0]
                                }
                            BarView(value: dataPoints[pickerSelectedItem][0], week: "5월")
                                .onTapGesture {
                                    number = dataPoints[pickerSelectedItem][0]
                                }
                            BarView(value: dataPoints[pickerSelectedItem][0], week: "6월")
                                .onTapGesture {
                                    number = dataPoints[pickerSelectedItem][0]
                                }
                            BarView(value: dataPoints[pickerSelectedItem][0], week: "7월")
                                .onTapGesture {
                                    number = dataPoints[pickerSelectedItem][0]
                                }
                            BarView(value: dataPoints[pickerSelectedItem][0], week: "8월")
                                .onTapGesture {
                                    number = dataPoints[pickerSelectedItem][0]
                                }
                            BarView(value: dataPoints[pickerSelectedItem][0], week: "9월")
                                .onTapGesture {
                                    number = dataPoints[pickerSelectedItem][0]
                                }
                            BarView(value: dataPoints[pickerSelectedItem][0], week: "10월")
                                .onTapGesture {
                                    number = dataPoints[pickerSelectedItem][0]
                                }
                        }
                        BarView(value: dataPoints[pickerSelectedItem][0], week: "11월")
                            .onTapGesture {
                                number = dataPoints[pickerSelectedItem][0]
                            }
                        BarView(value: dataPoints[pickerSelectedItem][0], week: "12월")
                            .onTapGesture {
                                number = dataPoints[pickerSelectedItem][0]
                            }
                    }
                    .animation(.default)
                    
                default:
                    EmptyView()
                }
            }
        }
    }
}

struct BarView: View {
    
    var value: CGFloat
    var week: String
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack {
                RoundedRectangle(cornerRadius: 20.00)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: 0x80BBB7), Color(hex: 0x80BF88)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 12, height: value)
                Text(week)
                .font(.system(size:13))
            }
        }
    }
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}


struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
