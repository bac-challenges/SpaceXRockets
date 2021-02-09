//
//  DetailSubHeaderView.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import SwiftUI

struct DetailSubHeaderView: View {
    
    var item: RocketViewItem
    
    var body: some View {
        Group {
            HStack {
                Text("Country of origin:").font(.caption)
                Text(item.data.country)
                    .foregroundColor(.blue)
                    .font(.caption)
            }
            
            HStack {
                Text("First Flight:").font(.caption)
                Text(item.data.date)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            
            HStack {
                Text("Success Rate:").font(.caption)
                Text("\(item.data.successRate)%")
                    .font(.caption)
                    .foregroundColor(.blue)
                
                Rectangle()
                    .fill(UIColor.successRate(item.data.successRate).suiColor)
                    .frame(width: 10, height: 10)
            }
            
            HStack {
                Text("Cost:").font(.caption)
                Text(item.data.cost.toCurrency())
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            
            HStack {
                Text("Active:").font(.caption)
                Text(item.data.active ? "Yes":"No")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
        }
    }
}
