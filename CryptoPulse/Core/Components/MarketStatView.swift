//
//  MarketStatView.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/9/23.
//

import SwiftUI

struct MarketStatView: View {
    
    let stat: MarketStatModel
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack{
                
                Image(systemName: "triangle.fill").font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentageChange?.asPercentageString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
           
        }
    }
}

struct MarketStatView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MarketStatView(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            MarketStatView(stat: dev.stat2)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            MarketStatView(stat: dev.stat3)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}
