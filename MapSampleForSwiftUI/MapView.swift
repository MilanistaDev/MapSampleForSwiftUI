//
//  MapView.swift
//  MapSampleForSwiftUI
//
//  Created by Takuya Aso on 2020/05/06.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI
import MapKit   // これをimport

struct MapView: UIViewRepresentable {

    // 親のビューからlatitudeDelta，longitudeDelta用の値と変化を受け取る
    @Binding var zoomValue: CLLocationDegrees

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        return mapView
    }

    // マップ更新時に呼ばれる(拡大・縮小ボタンタップの際も呼ばれます)
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let lat = 37.335020000
        let lon = -122.009250000
        let center = CLLocationCoordinate2DMake(lat, lon)
        // zoomValueの値が変わるとここも更新される
        let span = MKCoordinateSpan(latitudeDelta: zoomValue, longitudeDelta: zoomValue)
        let region = MKCoordinateRegion(center: center, span: span)
        uiView.setRegion(region, animated: true)
        uiView.showsUserLocation = true
        uiView.userTrackingMode = .follow
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(zoomValue: .constant(0.005))
    }
}
