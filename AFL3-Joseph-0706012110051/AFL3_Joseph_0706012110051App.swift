//
//  AFL3_Joseph_0706012110051App.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

@main
struct AFL3_Joseph_0706012110051App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
            }
            .commands {
                LandmarkCommands()
            }
    #if os(macOS)
        Settings {
            LandmarkSettings()
        }
    #endif
    }
}
