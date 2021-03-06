//
//  IntakeAmountView.swift
//  ggwadang
//
//  Created by kimjimin on 2022/06/16.
//

import SwiftUI

struct IntakeAmountView: View {
    @FocusState private var isFocused: Bool
    
    @EnvironmentObject var store: RecordStore
    @EnvironmentObject var food: FoodStore
    
    @Binding var isPresented: Bool
    @State var Today = Date.now
    @Binding var large_isSelected: String
    @Binding var medium_isSelected: String
    @Binding var small_isSelected: String
    
    let categoryEmoG = ["๊ณผ์":"๐ช", "๋กยท๊ฒฌ๊ณผ๋ฅ":"๐ก", "๋ฒ ์ด์ปค๋ฆฌ":"๐ฅ", "์์ด์คํฌ๋ฆผ":"๐ฆ", "์ ๊ฐ๊ณตํ":"๐ฅ", "์๋ฃ":"๐ฅค", "์ด์ฝ๋ฆฟ":"๐ซ", "์บ๋ฌ๋ฉยท์๊ฐฑ":"๐ฎ", "์บ๋ยท์ ค๋ฆฌ":"๐ญ"]
    
    let servingCategory = ["1/3", "1/2", "1", "2", "3", "์ง์ ์๋ ฅ"]
    let categoryRate : [Double] = [0.333, 0.5, 1, 2, 3, -1] // ๊ณ์ฐํ๊ธฐ ์ฝ๋๋ก ํ์ด๋ธ ์์ฑ
    @State var isSelected = [false, false, false, false, false, false]
    @State private var showingAlert = false // 0 g/ml ์๋ ฅํ๋ฉด ๋จ๊ฒ ํ๋ ์ฉ๋
    
    @State var directTyping = false
    @State var buttonState : Int = 0    // ํ์ฌ ์ ํํ ์นดํ๊ณ ๋ฆฌ๋ช
    
    @State var foodAmount : Double = 0  // ์ญ์ทจํ๋ ์์์ ์ด๋
    @State var calculatedSugar: Double = 0
    @State var unit = ""
        
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    // TextField์ ์ซ์๋ฅผ ํ์ํ๋ ค๋ฉด NumberFormatter ๋ฅผ ์ฌ์ฉํด์ผ ํฉ๋๋ค
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        ForEach(food.foods.filter{
            $0.large == large_isSelected &&
            $0.medium == medium_isSelected &&
            $0.small == small_isSelected
        }) { foo in // ๋ฅ์ด์์
            VStack{
                ZStack {
                    // ์์ ๋ฐฐ๊ฒฝ๋ถ๋ถ
                    LinearGradient(gradient: Gradient(colors: [Color(hex: 0x80BBB7), Color(hex: 0x80BF88)]),
                                   startPoint: .top, endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                    
                    HStack {
                        VStack {
                            VStack {
                                HStack {
                                    Text("\(small_isSelected)") // ์ต๋ 11๊ธ์
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .lineLimit(1)
                                    Spacer()
                                }
                                
                                
                                HStack {
                                    VStack (alignment: .leading){
                                        Text("๋น๋ฅ \(String(format: "%.1f", foodAmount*(Double(foo.sugarPerGram) ?? 0)))g")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        HStack {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 15)
                                                    .fill(Color.white)
                                                    .opacity(0.1)
                                                    .shadow(color: .black.opacity(0.15), radius: 20, y: 3)
                                                
                                                HStack {
                                                    
                                                    TextField("\(foo.servingSize)",
                                                              value: $foodAmount,
                                                              formatter: formatter)
                                                    .frame(height: 60)
                                                    .padding(.leading, 10)
                                                    .focused($isFocused)    // ํ์คํธํ๋๋ฅผ ๋ฐ๋ผ๋ณด๋๋ก ํ์ฑํ
                                                    .keyboardType(.numberPad)
                                                    .font(.title2)
                                                    
                                                    Text("\(foo.unit)")
                                                        .font(.title2)
                                                        .fontWeight(.bold)
                                                        .padding(.trailing, 5)
                                                    Spacer()
                                                }
                                                
                                            }.frame(width: 110, height: 60)
                                            
                                        }
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    Text("\(categoryEmoG[foo.large] ?? "๐ช")")
                                        .modifier(FittingFontSizeModifier()) // .resizable()์ฒ๋ผ ์ฌ์ฉํ๊ธฐ ์ํด ์ถ๊ฐํจ
                                        .frame(width: 100, height: 100)
                                }
                                
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            
                            
                        }
                    }
                }
                .frame(height: 250) // ์ค์บ์น ๊ธฐ์ค 300์ด๋ผ ์ผ๋จ ์ด๋ ๊ฒํจ
                
                LazyVGrid(columns: gridItemLayout, spacing: 10) {
                    ForEach((0 ..< servingCategory.count - 1), id: \.self) { num in
                        // ์ด์ ์ ๋๋ ๋ ๋ฒํผ์ ํด์ ํ ๋ค ํ์ฌ num์ ๋ํ ๋ฒํผ์ ํ์ฑํ
                        Button {
                            // ์ง์ ์๋ ฅ์ ๋๋ ๋ค๊ฐ ๋ค๋ฅธ ๋ฒํผ์ ๋๋ฅด๋ ๊ฒฝ์ฐ ํฌ์ปค์ค ํด์ 
                            if isFocused { isFocused.toggle() }
                            // ์ด์ ์ ๋๋ ๋ ๋ฒํผ์ ํด์ 
                            self.isSelected[buttonState].toggle()
                            // ์ด๋ฒ์ ๋๋ ๋ ๋ฒํผ์ index๋ฅผ ์ ์ฅํ๊ณ  ๋ฒํผ ํ์ฑํ
                            buttonState = num
                            self.isSelected[buttonState].toggle()
                            // ๊ฐ ๋ฒํผ์ ๋ฐฐ์ x ๊ฐ๋น(์ปต,๊ฐ,๋ฉ์ด๋ฆฌ) ์ฉ๋ = ์ ํํ ์ฉ๋
                            foodAmount = Double(String(format: "%.0f", categoryRate[buttonState] * (Double(foo.servingSize) ?? 0) )) ?? 0
                        } label: {
                            HStack {
                                Text("\(servingCategory[num])")
                                Text("\(foo.servingUnit)")
                            }
                            .padding()
                            .foregroundColor(self.isSelected[num] ? Color.white : Color.black)
                        }
                        .frame(width: 110, height: 60)
                        .background(RoundedRectangle(cornerRadius: 15)
                            .fill(self.isSelected[num] ? Color(hex: 0x6CADA5) : Color.white)
                            .shadow(color: .gray.opacity(0.15), radius: 20, y: 3)
                                    
                        )
                    }
                    
                    Button {
                        // ์ง์ ์๋ ฅ
                        // ์ด์ ์ ๋๋ ๋ ๋ฒํผ์ ํด์ 
                        self.isSelected[buttonState].toggle()
                        buttonState = servingCategory.count - 1
                        self.isSelected[buttonState].toggle()
                        // ํ์คํธ ํ๋์ ๋ํ focus๋ฅผ On
                        isFocused = true
                    } label: {
                        Text("์ง์ ์๋ ฅ")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(Color(hex: 0x6CADA5))
                        
                    }
                    .frame(width: 110, height: 60)
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.15), radius: 20, y: 3))
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(self.isFocused ? Color(hex: 0x6CADA5) : Color.clear, lineWidth: 2))
                    
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                // ๋ฑ์ฅ๊ณผ ๋์์ foodAmount์ ๊ฐ์ ๋ฃ์ด์ค๋ค.(๋ํดํธ๋ก ์ ํํ 0๋ฒ ๋ฒํผ์ ๊ฐ์ด ๋ค์ด๊ฐ)
                .onAppear {
                    isSelected[buttonState].toggle()
                    foodAmount = Double(String(format: "%.0f", categoryRate[buttonState] * (Double(foo.servingSize) ?? 0) )) ?? 0
                    unit = foo.unit
                }
                
                Spacer()
                Button {
                    if foodAmount <= 0 || foodAmount > 10000 {
                        showingAlert.toggle()
                    } else {
                        calculatedSugar = (Double(foo.sugarPerGram)! * foodAmount )
                        saveRecord()
                        isPresented.toggle()
                    }
                } label: {
                    Text("์ถ๊ฐํ๊ธฐ")
                        .frame(width: (UIScreen.main.bounds.width)*0.9, height: 56)
                        .foregroundColor(Color.white)
                }
                .background(RoundedRectangle(cornerRadius: 30).fill(Color(hex: 0x6CADA5)))
                .padding(.vertical, 20)
                .alert("๋ฒ์ ์ด๊ณผ", isPresented: $showingAlert) {
                    Button("OK") {
                        isFocused.toggle()
                        foodAmount = Double(foo.servingSize)!
                    }
                } message: {
                    Text("0~10000 ์ฌ์ด์ ๊ฐ์ ์๋ ฅํด์ฃผ์ธ์.")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:{
                        isPresented.toggle()
                    }){Image(systemName: "xmark")}
                }
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
            calculatedSugar: calculatedSugar,
            foodAmount: foodAmount,
            unit: unit)
    }
}
