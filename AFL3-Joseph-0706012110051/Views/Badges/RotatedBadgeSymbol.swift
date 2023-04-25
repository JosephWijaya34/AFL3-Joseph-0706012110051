//
//  RotatedBadgeSymbol.swift
//  AFL3-Joseph-0706012110051
//
//  Created by MacBook Pro on 25/04/23.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol().padding(-60).rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
