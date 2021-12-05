//
//  HJRingChartView.swift
//  
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI

struct HJRingChartView: View {
    
    let data: [HJRingChartData]
    
    
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
                
                ForEach(data, id: \.self) { datum in
                    
                    Circle()
                        .trim(from: CGFloat(datum.startValue), to: CGFloat(datum.endValue))
                        .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .butt, lineJoin: .round))
                        .foregroundColor(datum.color)
                        .rotationEffect(Angle(degrees: 270.0))

                }

            }
            .frame(height: 150)
            .padding()
            
            HStack(alignment: .center) {
                Spacer()
                
                ForEach(data, id: \.self) { datum in
                    VStack {
                        Circle()
                            .foregroundColor(datum.color)
                            .frame(width: 10, height: 10)
                        Text(datum.title)
                            .font(.system(size: 15.0, weight: .light, design: .default))
                    }
                }
                
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                
            
        }
        
    }
    
    
}

struct HJRingChartView_Previews: PreviewProvider {

    static var previews: some View {
        HJRingChartView(data: [
            HJRingChartData(title: "Ground", startValue: 0.0, endValue: 0.3, color: Color(red: 72/255.0, green: 176/255.0, blue: 148/255.0)),
            HJRingChartData(title: "Volley", startValue: 0.3, endValue: 0.8, color: Color(red: 159/255.0, green: 92/255.0, blue: 92/255.0)),
            HJRingChartData(title: "Serve", startValue: 0.8, endValue: 1.0, color: Color(red: 186/255.0, green: 169/255.0, blue: 61/255.0)),
        ])
    }
}
