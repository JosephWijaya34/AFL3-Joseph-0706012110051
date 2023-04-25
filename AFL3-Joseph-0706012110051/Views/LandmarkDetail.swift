//
//  LandmarkDetail.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 25/04/23.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        //scroll view agar bisa di scroll
        ScrollView {
            //panggil map untuk di show dengan besar frame 300 dan tanpa menghiraukan top edges nya
            MapView(coordinate: landmark.locationCoordinate).frame(height: 300).ignoresSafeArea(edges:.top)
            
            // panggil image dari file circle image dengan offset dan padding agar terlihat seperti gambar
            CircleImage(image: landmark.image).offset(y: -130).padding(.bottom, -130)
            
            //vertical stack dengan posisi leading yaitu dari kanan ke kiri
            VStack (alignment: .leading) {
                
                Text(landmark.name)
                    .font(.title)
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                    
                }.font(.subheadline).foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)").font(.title2)
                Text(landmark.description)
                
            }
            .padding()
        }.navigationTitle(landmark.name).navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
