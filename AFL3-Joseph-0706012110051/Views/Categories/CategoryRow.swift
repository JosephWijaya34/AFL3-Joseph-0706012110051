//
//  CategoryRow.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 26/04/23.
//

import SwiftUI

struct CategoryRow: View {
    //variable inisiasi
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }.frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    //panggil data object dari model data melalui variable
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
