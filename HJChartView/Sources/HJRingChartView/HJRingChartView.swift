//
//  HJRingChartView.swift
//  
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI

struct HJRingChartView: View {
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                VStack {
                    Text("123")
                        .font(.system(size: 25.0, weight: .bold, design: .default))
                        .italic()
                        //.foregroundColor(Color("Background_Medium"))
                    Text("Shots")
                }
                
                Circle()
                    .trim(from: 0.0, to: 0.3)
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .butt, lineJoin: .round))
                    .foregroundColor(Color(red: 72/255.0, green: 176/255.0, blue: 148/255.0))
                    .rotationEffect(Angle(degrees: 270.0))
                
                Circle()
                    .trim(from: 0.3, to: 0.8)
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .butt, lineJoin: .round))
                    .foregroundColor(Color(red: 159/255.0, green: 92/255.0, blue: 92/255.0))
                    .rotationEffect(Angle(degrees: 270.0))
                
                Circle()
                    .trim(from: 0.8, to: 1.0)
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .butt, lineJoin: .round))
                    .foregroundColor(Color(red: 186/255.0, green: 169/255.0, blue: 61/255.0))
                    .rotationEffect(Angle(degrees: 270.0))
            }
            .frame(height: 150)
            .padding()
            
            HStack(alignment: .center) {
                Spacer()
                VStack {
                    Circle()
                        .foregroundColor(Color(red: 72/255.0, green: 176/255.0, blue: 148/255.0))
                        .frame(width: 10, height: 10)
                    Text("Ground")
                        .font(.system(size: 15.0, weight: .light, design: .default))
                }
                
                VStack {
                    Circle()
                        .foregroundColor(Color(red: 159/255.0, green: 92/255.0, blue: 92/255.0))
                        .frame(width: 10, height: 10)
                    Text("Volly")
                        .font(.system(size: 15.0, weight: .light, design: .default))
                }
                
                VStack {
                    Circle()
                        .foregroundColor(Color(red: 186/255.0, green: 169/255.0, blue: 61/255.0))
                        .frame(width: 10, height: 10)
                    Text("Serve")
                        .font(.system(size: 15.0, weight: .light, design: .default))
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                
            
        }
        
    }
    
    
}

struct HJRingChartView_Previews: PreviewProvider {
    static var previews: some View {
        HJRingChartView()
    }
}
