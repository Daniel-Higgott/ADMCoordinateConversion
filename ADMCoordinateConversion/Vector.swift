//
//  Vector.swift
//  ADMCoordinateConversion
//
//  Created by Daniel Higgott on 11/11/2023.
//

import Foundation

class Vector {
    
    var x: Double = 0.0
    var y: Double = 0.0
    var z: Double = 0.0
    
    var azimuth: Double = 0.0
    var elevation: Double = 0.0
    var distance: Double = 0.0
    
    init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
        setPolarCoordinates()
    }
    
    init(azimuth: Double, elevation: Double, distance: Double) {
        self.azimuth = azimuth
        self.elevation = elevation
        self.distance = distance
        
        setCartesianCoordinates()
    }
    
    func set(x: Double) {
        self.x = x
        setPolarCoordinates()
    }
    
    func set(y: Double) {
        self.y = y
        setPolarCoordinates()
    }
    
    func set(z:Double) {
        self.z = z
        setPolarCoordinates()
    }
    
    func set(azimuth: Double) {
        self.azimuth = azimuth
        setCartesianCoordinates()
    }
    
    func set(elevation: Double) {
        self.elevation = elevation
        setCartesianCoordinates()
    }
    
    func set(distance:Double) {
        self.distance = distance
        setCartesianCoordinates()
    }
    
    private func setCartesianCoordinates() {
        let cartesianCoordinates = pointPolarToCart(azimuth: azimuth, elevation: elevation, distance: distance)
        self.x = cartesianCoordinates.0
        self.y = cartesianCoordinates.1
        self.z = cartesianCoordinates.2
    }
    
    private func setPolarCoordinates() {
        let polarCoordinates = pointCartToPolar(x: x, y: y, z: z)
        self.azimuth = polarCoordinates.0
        self.elevation = polarCoordinates.1
        self.distance = polarCoordinates.2
    }
    
    private func pointPolarToCart(azimuth: Double, elevation: Double, distance: Double) -> (Double, Double, Double) {
        
        let azimuthRadian = -(Double(azimuth) * Double.pi/180)
        let elevationRadian = (Double(-elevation) * Double.pi/180) + Double.pi/2
        let distance = Double(distance)/2
        
        let y = distance * sin(elevationRadian) * cos(azimuthRadian) * 2
        let x = distance * sin(elevationRadian) * sin(azimuthRadian) * 2
        let z = distance * cos(elevationRadian) * 2

        return (x, y, z)
    }
    
    private func pointCartToPolar(x: Double, y:Double, z:Double) -> (Double, Double, Double) {
        
        let azimuthRadian = -(atan2(x, y))
        let azimuthDegrees = azimuthRadian * 180/Double.pi
        
        var elevationRadian = 0.0
        if !(x == 0.0 && y == 0.0 && z == 0.0) {
            elevationRadian = (atan2(sqrt(pow(x,2)+pow(y,2)),z)) - (Double.pi/2)
        }
        let elevationDegrees = -(elevationRadian * 180/Double.pi)
        
        let distance = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))
        
        return (azimuthDegrees, elevationDegrees, distance)
    }
    
}
