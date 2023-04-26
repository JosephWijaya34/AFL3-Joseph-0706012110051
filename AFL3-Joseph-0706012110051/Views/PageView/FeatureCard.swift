//
//  FeatureCard.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 26/04/23.
//

import SwiftUI

struct FeatureCard: View {
    // identifikasi struct landmark pada sebuah variable
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()// biar fit screen
            .aspectRatio(3 / 2, contentMode: .fit)// mengukur aspek ratio gambar
            .overlay {
                TextOverlay(landmark: landmark)// fitur overlay agar terdapat tulisan di gambar
            }
    }
}

struct TextOverlay: View {
    var landmark: Landmark

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
