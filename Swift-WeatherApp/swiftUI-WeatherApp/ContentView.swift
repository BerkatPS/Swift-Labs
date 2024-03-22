//
//  ContentView.swift
//  swiftUI-WeatherApp
//
//  Created by Berkat Saragih on 22/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack{            // From Binding Struct BackgroundView
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(textCity: "Jakarta Barat")
                
                MainWeatherView(imageName: isNight ? "moon.dust.fill" : "sun.haze.fill", temperaturNum: 72)
                HStack(spacing: 25){
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.sun.fill",
                                   temperatur: 76)
                    
                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "sun.snow.fill",
                                   temperatur: 80)
                    
                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "sun.max.fill",
                                   temperatur: 70)
                    
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "cloud.rain.fill",
                                   temperatur: 85)
                    
                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "cloud.sun.bolt.fill",
                                   temperatur: 90)

                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(titleButton: "Getting Started", bgButton: isNight ? .lightblue : .black, textColor: isNight ? .black : .lightblue)
                      }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

// Make a struct for reusable component
struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperatur: Int
    
    var body: some View {
        VStack{
           Text(dayOfWeek)
                .foregroundStyle(.white)
                .font(.system(size: 25, weight: .heavy))
           Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperatur)°")
                .foregroundStyle(.white)
                .font(.system(size: 25, weight: .heavy))
        }
    }
}

struct BackgroundView: View {
    // Create Binding With Private State
    
    @Binding var isNight: Bool
    var body: some View {
//        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")],
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing
//                       )
//            .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}
    
struct CityTextView: View {
    var textCity: String
    var body: some View {
        Text("\(textCity)")
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.bottom)
        
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temperaturNum: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperaturNum)°")
                .font(.system(size: 70, weight: .regular))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 50)
    }
}

struct WeatherButton: View {
    
    var titleButton: String
    var bgButton: Color
    var textColor: Color
    
    var body: some View {
        Text(titleButton)
            .frame(width: 290, height: 50)
            .background(bgButton)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .heavy))
            .cornerRadius(10)

    }
}
