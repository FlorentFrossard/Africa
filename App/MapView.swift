//
//  MapView.swift
//  Africa
//
//  Created by Florent on 15/10/2020.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        
        var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4737599)
        
        var mapZoomLevel: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
       
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            
//            MapPin(coordinate: item.location, tint: .accentColor)
            
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })
        .overlay(
            HStack {
                Image("compass")
                .resizable()
                .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: . leading, spacing: 3) {
                    HStack {
                        
                        Text("Latitude:")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                   
                    Divider()
                   
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.15)
            )
            .padding(), alignment: .top)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
