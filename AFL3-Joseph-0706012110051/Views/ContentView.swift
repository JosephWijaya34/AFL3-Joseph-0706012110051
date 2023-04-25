//
//  ContentView.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    //untuk mengurutkan dari 1
    enum Tab {
        case featured
        case list
        }
    
    var body: some View {
        //show landmark list
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }.tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }.tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
