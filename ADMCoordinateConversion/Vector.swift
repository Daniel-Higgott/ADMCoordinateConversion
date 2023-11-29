//
//  Vector.swift
//  ADMCoordinateConversion
//
//Copyright (c) 2023 Daniel Higgott
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
//

import Foundation

class Vector {
    
    private(set) var x: Double = 0.0
    private(set) var y: Double = 0.0
    private(set) var z: Double = 0.0
    
    private(set) var azimuth: Double = 0.0
    private(set) var elevation: Double = 0.0
    private(set) var distance: Double = 0.0
    
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
