//
//  DetailHeaderView.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import SwiftUI

struct DetailHeaderView: View {
    
    var item: RocketViewItem
    
    var body: some View {
        VStack(spacing: 5) {
            
            Spacer().frame(height: 5)
            
            Image(uiImage: item.image)
                .resizable()
                .frame(height: 150)
                .clipShape(Circle())
                .aspectRatio(1, contentMode: .fill)
                .overlay(
                    Circle()
                        .stroke(UIColor.successRate(item.data.successRate).suiColor,
                                lineWidth: 4)
                )
                
            
            Text(item.data.name)
                .bold()
                .font(.title)
                .foregroundColor(.blue)
        }
    }
}
