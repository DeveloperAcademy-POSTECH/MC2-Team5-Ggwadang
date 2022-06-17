//
//  IntakeAmountView.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import SwiftUI

struct IntakeAmountView: View {
    @EnvironmentObject var store: RecordStore
    @Binding var isPresented: Bool
    @State var Today = Date.now
    @Binding var large_isSelected: String
    @Binding var medium_isSelected: String
    @Binding var small_isSelected: String
    
    let servingCount = ["1/3", "1/2", "1", "2", "3"]
    @State var isSelected = [false, false, false, false, false]
    @State var directTyping = false
    
    @State var intake = 0.0
    // TODO: 데이터베이스로부터 제품 1g당 당류 불러오기 (=sugarAmount)
    var sugarAmount = 0.1
    // TODO: 카테고리별로 단위, 1회제공량 정의해야함 (제품당 단위 ex. 음료1캔=190ml)
    var servingSize = 190.0
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack{
            LazyVGrid(columns: gridItemLayout, spacing: 10) {
                ForEach((0..<servingCount.count), id: \.self) { num in
                    Button {
                        for temp in 0..<servingCount.count {
                            self.isSelected[temp] = false
                            directTyping = false
                        }
                        self.isSelected[num].toggle()
                        intake = (servingCount[num] as NSString).doubleValue * servingSize
                    } label: {
                        Text("\(servingCount[num])컵")
                            .padding()
                            .foregroundColor(self.isSelected[num] ?Color.white : Color.black)
                    }
                    .frame(width: 100, height: 70)
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(self.isSelected[num] ? Color.accentColor : Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, y: 3))
                }
                Button {
                    directTyping.toggle()
                    for temp in 0..<servingCount.count {
                        self.isSelected[temp] = false
                    }
                } label: {Text("직접 입력").foregroundColor(self.directTyping ?Color.white : Color.black)}
                    .frame(width: 100, height: 70)
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(self.directTyping ? Color.accentColor : Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, y: 3))
            }
            .padding(.top, 5)
            .padding([.leading, .trailing], 20)
            if(directTyping) {
                TextField("섭취량(g/ml)을 입력하세요.", value: $intake, format: .number)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .padding(20)
            }
            
            Spacer()
            Button {
                saveRecord()
                isPresented.toggle()
            } label: {
                Text("당 \(intake*sugarAmount, specifier: "%.1f")g 추가하기")
                    .foregroundColor(Color.white)
            }
            .frame(width: 350, height: 50)
            .background(RoundedRectangle(cornerRadius: 30).fill(Color.accentColor))
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text(small_isSelected)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action:{
                    isPresented.toggle()
                }){Image(systemName: "xmark")}
            }
        }
    }
}

extension IntakeAmountView {
    func saveRecord() {
        store.create(
            date: dateFormatter(date: Today),
            large: large_isSelected,
            medium: medium_isSelected,
            small: small_isSelected,
            sugar: intake*sugarAmount)
    }
    
    func dateFormatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let converted = formatter.string(from: date)
        return converted
    }
}
