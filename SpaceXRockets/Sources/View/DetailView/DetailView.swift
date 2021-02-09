//
//  DetailView.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import SwiftUI

struct DetailView: View, DetailViewModelInjected {
    
    var item: RocketViewItem
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    
                    DetailHeaderView(item: item)
                    
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 1)
                    
                    DetailSubHeaderView(item: item)
                    
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 1)
                    
                    Text(item.data.descr)
                }.padding(EdgeInsets(top: 0,
                                     leading: 10,
                                     bottom: 0,
                                     trailing: 10))
            }

            Spacer()
            
            HStack(alignment: .center) {
                Spacer()
                Button("Wikipedia") { detailsViewModel.open(item.data.url) }
                Spacer()
            }
            
            Spacer().frame(height: 10)
        }
    }
}
