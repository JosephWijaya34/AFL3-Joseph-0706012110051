//
//  LandmarkRow.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 25/04/23.
//

import SwiftUI

struct LandmarkRow: View {
    
    // inisialisasi variable sebagai object Landmark
    var landmark: Landmark
    
    var body: some View {
        // horizontal stack
        HStack {
            // panggil data gambar dari object array landmark
            landmark.image.resizable().frame(width: 50, height: 50)
            // panggil data nama dari object array landmark
            Text(landmark.name)
            //memberi spasi atau jarak
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        //inisialisasi parameter bahwa landmark data berupa array
        Group{
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
