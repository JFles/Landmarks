//
//  MapView.swift
//  Landmarks
//
//  Created by Jeremy Fleshman on 10/9/19.
//  Copyright © 2019 Jeremy Fleshman. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // create coordinates
        let coordinates = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
        // create span
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        // create region w/ coords and span
        let region = MKCoordinateRegion(center: coordinates, span: span)
        // view.setregion
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
