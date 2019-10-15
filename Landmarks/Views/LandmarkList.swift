//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jeremy Fleshman on 10/10/19.
//  Copyright © 2019 Jeremy Fleshman. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        List{
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites only")
            }

            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList()
                .environmentObject(UserData())
            .navigationBarTitle(Text("Landmarks"))
        }
//        ForEach(["iPhone 8", "iPhone 11"], id: \.self) {
//            deviceName in
//            LandmarkList()
//            .previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//        }
    }
}
