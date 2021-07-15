//
//  ContentView.swift
//  ConvertTemp
//
//  Created by Brittany Rima on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Farenheit"
    @State private var userInput = ""
    let units = ["Celsius", "Farenheit"]
    
    //    calculate farenheit to celsius
    var outputCelsius: Double {
        let farenheit = Double(userInput) ?? 0
        let celsius = (farenheit - 30) / 2
        
        return celsius
    }
    
    //    calculate celsius to farenheit
    var outputFarenheit: Double {
        let celsius = Double(userInput) ?? 0
        let farenheit = celsius * 1.8 + 32
        
        return farenheit
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    Spacer()
                    
                    //                OutputView
                    if inputUnit == "Farenheit" {
                        Text("\(outputCelsius , specifier: "%.2f")˚")
                            .padding(.horizontal)
                            .font(.system(size: 70).bold())
                            .foregroundColor(.white)
                        Text("Celsius")
                            .font(.headline)
                            .foregroundColor(.gray)
                    } else if userInput == "" {
                        Text("")
                    } else {
                        Text("\(outputFarenheit, specifier: "%.2f")˚")
                            .padding(.horizontal)
                            .font(.system(size: 70).bold())
                            .foregroundColor(.white)
                        Text("Farenheit")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundColor(Color(#colorLiteral(red: 0.6260772943, green: 0.6113114953, blue: 0.7309541106, alpha: 1)))
                    }
                    
                    Spacer()
                    //                InputView
                    VStack {
                        HStack {
                            Image(systemName: "chevron.right.square.fill")
                                .font(.system(size: 30))
                                .padding(.leading, 10)
                                .foregroundColor(.white)
                            
                            TextField("input number", text: $userInput)
                                .padding()
                                .font(.system(size: 30).bold())
                                .keyboardType(.decimalPad)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.white))
                        .padding(.horizontal)
                        
                        HStack {
                            HStack {
                                Text("input \(Image(systemName: "thermometer"))")
                                    .padding(.top)
                                    .font(.system(size: 25, weight: .medium))
                                    .foregroundColor(Color(#colorLiteral(red: 0.6260772943, green: 0.6113114953, blue: 0.7309541106, alpha: 1)))
                                Picker("Input Unit", selection: $inputUnit) {
                                    ForEach(units, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .padding(.top)
                                .pickerStyle(SegmentedPickerStyle())
                                .frame(width: 150)
                            }
                            
                            
                            
                        }
                        
                    }
                    
                    Spacer()
                    
                    
                    
                    
                    
                    
                    
                    
                }
                .navigationBarTitle("Celsius&Farenheit")
                
            }
            .background(Image("purpleGradient")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.vertical))
            
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
