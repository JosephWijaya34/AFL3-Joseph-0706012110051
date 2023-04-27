//
//  LandmarkList.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 25/04/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData // input model data json di tampung pada variable
    @State private var showFavoritesOnly = false // variable show favorite
    @State private var filter = FilterCategory.all // variable untuk filter data
    @State private var selectedLandmark: Landmark? //variable untuk selected landmark dari json
    
    // set data filter category filter catergory
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }
    
    //untuk filter dari object yang favorite dan tidak
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            landmark in (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    // untuk set data title pada sebuah variable dan di filter
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }

    
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
            List(selection: $selectedLandmark) {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark
                    in
                    //navigation link untuk intent ke view detail dan label di gunakan untuk mengetahui data yang passing
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(title)// beri judul atau h1
            .frame(minWidth: 300)// ukuran frame navigation
            .toolbar {
                ToolbarItem {// mengset comment di atas
                    Menu {// pilihan menu
                        //set yang sedang di pilih
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                            Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        //set isi dari tools di atas samping logo mac
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            Text("Select a Landmark")
        }
        // focused value digunakan untuk parsing data ke navigation view dari array data
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
//        }
        LandmarkList().environmentObject(ModelData())
    }
}
