//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct LandmarkSettings: View {
    // setting map zoom dengan mengakses map view dari helper
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        // form picker untuk input data yang di pilih
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) {
                    level in Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
}

struct LandmarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSettings()
    }
}
