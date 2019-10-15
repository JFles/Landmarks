//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Jeremy Fleshman on 10/15/19.
//  Copyright © 2019 Jeremy Fleshman. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    // this prop keys off the Environment's \.editMode
    // it can be used to read and write the current edit scope
    @Environment(\.editMode) var mode

    // To avoid updating the global app state before confirming
    // any edits, the editing view operates on a copy of itself
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }

                Spacer()

                EditButton()
            }

            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: draftProfile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                .onDisappear {
                    self.userData.profile = self.draftProfile
                }
            }
        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
