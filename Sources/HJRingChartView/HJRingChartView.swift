//
//  HJRingChartView.swift
//  
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI
import HJChartView


public struct HJRingChartView<Content: View>: View {
    
    let data: HJChartData
    let content: () -> Content
    
    
    public var body: some View {
        
        VStack {
            
            // Chart
            ZStack {
                
                ForEach(data.elements, id: \.self) { element in
                    HJRingChartSection(element: element)
                }
                
                content()

            }
            .frame(height: 150)
            .padding()
            
            
            // Legend
            HStack(alignment: .center) {
                
                Spacer()
                
                ForEach(data.elements, id: \.self) { datum in
                    HJRingChartLegend(element: datum)
                }
                
                Spacer()
                
            }
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                
        }
        
    }
    
    
}


struct HJRingChartSection: View {
    
    let element: HJChartElement
    
    var body: some View {
        
        Circle()
            .trim(from: CGFloat(element.startValue), to: CGFloat(element.endValue))
            .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .butt, lineJoin: .round))
            .foregroundColor(element.color)
            .rotationEffect(Angle(degrees: 270.0))
        
    }
    
}


struct HJRingChartLegend: View {
    
    let element: HJChartElement
    
    var body: some View {
        
        VStack {
            Circle()
                .foregroundColor(element.color)
                .frame(width: 10, height: 10)
            Text(element.title)
                .font(.system(size: 15.0, weight: .light, design: .default))
        }
        
    }
    
}


struct HJRingChartView_Previews: PreviewProvider {
    
    static let data = HJChartData(elements: [
        HJChartElement(title: "Ground", startValue: 0.0, endValue: 0.3, color: Color(red: 72/255.0, green: 176/255.0, blue: 148/255.0)),
        HJChartElement(title: "Volley", startValue: 0.3, endValue: 0.8, color: Color(red: 159/255.0, green: 92/255.0, blue: 92/255.0)),
        HJChartElement(title: "Serve", startValue: 0.8, endValue: 1.0, color: Color(red: 186/255.0, green: 169/255.0, blue: 61/255.0)),
    ])
    
    

    static var previews: some View {
        HJRingChartView(data: HJRingChartView_Previews.data) {
            VStack {
                Text("123")
                    .font(.system(size: 25.0, weight: .bold, design: .default))
                    .italic()
                    //.foregroundColor(Color("Background_Medium"))
                Text("Shots")
            }
        }
    }
}
