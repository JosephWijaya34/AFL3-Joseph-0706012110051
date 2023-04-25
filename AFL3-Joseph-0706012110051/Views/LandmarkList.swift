//
//  LandmarkList.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 25/04/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // panggil list untuk menunjukan data secara statis
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
        
        // panggil list untuk menunjukan data secara dinamis
        
        //Navigation View digunakan untuk embeded atau pindah view
        
        //navigation title memberi judul di List
        NavigationView{
            List(landmarks) { landmark in
                //navigation link untuk intent ke view detail dan label di gunakan untuk mengetahui data yang passing
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                }label: {
                    LandmarkRow(landmark: landmark)
                }
            }.navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
        }
    }
}
