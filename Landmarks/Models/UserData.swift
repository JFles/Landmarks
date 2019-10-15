//
//  UserData.swift
//  Landmarks
//
//  Created by Jeremy Fleshman on 10/10/19.
//  Copyright © 2019 Jeremy Fleshman. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
