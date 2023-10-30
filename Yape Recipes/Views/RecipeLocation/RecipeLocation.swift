//
//  RecipeLocation.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import SwiftUI
import MapKit

struct RecipeLocationView: View {
    var mapLocation: RecipeMapLocationModel
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    ))
    
    var body: some View {
        ZStack (alignment: .top) {
            Color.white
            VStack {
                Map(position: $cameraPosition) {
                    Annotation(
                        "",
                        coordinate: CLLocationCoordinate2D(
                            latitude: mapLocation.location.lat,
                            longitude: mapLocation.location.lng
                        )) {
                            VStack {
                                Text(mapLocation.name)
                                    .font(.title3)
                                    .accessibilityIdentifier("recipe_location_view_title")
                                Image(systemName: "fork.knife.circle.fill")
                                    .font(.system(size: 24))
                            }
                            .foregroundColor(.red)
                            .padding()
                            .background(in: .buttonBorder)
                        }
                }
            }
        }
        .onAppear() {
            cameraPosition = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: mapLocation.location.lat,
                        longitude: mapLocation.location.lng
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 1,
                        longitudeDelta: 1
                    )
                )
            )
        }
    }
}

#Preview {
    let location = PreviewRecipesRequestData.recipes.first!
    let mapLocation = RecipeMapLocationModel(location: location.location, name: location.name)
    return RecipeLocationView(mapLocation: mapLocation)
}
