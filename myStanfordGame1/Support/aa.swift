//
//  aa.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/25/21.
//

import SwiftUI

struct aa: View {
    var body: some View {
        ZStack {
            
                RoundedRectangle(cornerRadius: 5).fill(Color.white)
                RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 3)
                Pie(startAngle: Angle.degrees(0.0), endAngle: Angle.degrees(110.0))
                    .padding(5).opacity(0.4)
                Text("A").font(Font.largeTitle)
            
        }
        
        
        
    }
}

struct aa_Previews: PreviewProvider {
    static var previews: some View {
        aa()
    }
}
