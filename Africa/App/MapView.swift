//
//  MapView.swift
//  Africa
//
//  Created by COMATOKI on 2024-04-16.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        // Mark:- 1 Basic Map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            //option 1
//            MapPin(coordinate: item.location, tint: .accentColor)
            //option 2
//            MapMarker(coordinate: item.location, tint: .accentColor)
            //option 3
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }
        }
        
        
    }
}

//#Preview {
//    MapView()
//}
