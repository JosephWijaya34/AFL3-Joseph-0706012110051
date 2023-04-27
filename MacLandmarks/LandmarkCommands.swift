//
//  LandmarkCommands.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct LandmarkCommands: Commands {
    //supaya tahu secara real time landmark key yang di select
    @FocusedBinding(\.selectedLandmark) var selectedLandmark

    var body: some Commands {
        SidebarCommands()// func untuk memunculkan sidebar kembali
        
        CommandMenu("Landmark") {
            // button
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            //untuk set keyboard shortcut
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark> // untuk inisiasi object yang akan di hubungkan
}

// untuk menentukan patern dan memfokuskan pada key yang di pilih di json landmark
extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
