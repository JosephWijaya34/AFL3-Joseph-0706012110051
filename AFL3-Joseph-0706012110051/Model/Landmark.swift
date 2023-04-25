//
//  Landmark.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 25/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

// Identifiable untuk mentranslate kan code dalam hal ini untuk membaca id dari setiap data yang ada di JSON
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // add image data supaya bisa di passing ke struct landmark
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
    
    // add koordinat data supaya bisa di passing ke struct landmark
    private var coordinates: Coordinates
    //untuk mengetahui koordinat dari data yang diinginkan supaya data bisa di passing
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }

        struct Coordinates: Hashable, Codable {
            var latitude: Double
            var longitude: Double
        }
}
