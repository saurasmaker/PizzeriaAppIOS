//
//  MapView.swift
//  PrimeraAPP
//
//  Created by Iván Saura Cuadrado on 9/7/21.
//


import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        
        MKMapView(frame: .zero)
 
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.9835, longitude: -1.12989)
        let span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
        let region = MKCoordinateRegion( center: coordinate, span: span)
    
        uiView.setRegion(region, animated: true)
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
