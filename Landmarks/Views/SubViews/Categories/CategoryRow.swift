//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Jeremy Fleshman on 10/15/19.
//  Copyright © 2019 Jeremy Fleshman. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
        .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var landmark: Landmark

    var body: some View {
        VStack {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155.0, height: 155.0)
                .cornerRadius(5.0)

            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }.padding(.leading, 15.0)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkData[0].category.rawValue,
            items: Array(landmarkData.prefix(4))
        )//.previewLayout(.fixed(width: 300, height: 70))
    }
}
