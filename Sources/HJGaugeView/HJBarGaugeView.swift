//
//  HJBarGaugeView.swift
//  
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI

public struct HJBarGaugeView: View {
    
    let value: Float
    let color: Color
    
    
    public init(value: Float, color: Color = Color.black) {
        
        self.value = value
        self.color = color
    }
    
    public var body: some View {
        
        GeometryReader { geometry in
        
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                
                color.opacity(0.1)
                    .frame(height: geometry.size.height, alignment: .leading)
                    .cornerRadius(geometry.size.height/2)
                color
                    .frame(width: CGFloat(value) * geometry.size.width, height: geometry.size.height, alignment: .leading)
                    .cornerRadius(geometry.size.height/2)
            }
            
        }
        
    }
}

struct HJBarGaugeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            HJBarGaugeView(value: 0.3, color: Color.orange)
                .previewLayout(.fixed(width: 200, height: 10))
            
            HJBarGaugeView(value: 0.5, color: Color.orange)
                .previewLayout(.fixed(width: 300, height: 15))
            
            HJBarGaugeView(value: 0.8, color: Color.orange)
                .previewLayout(.fixed(width: 400, height: 20))
            
        }
        
    }
    
}
