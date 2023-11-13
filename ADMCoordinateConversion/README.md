#  ADM Coordinate Conversion

The purpose of this repository is to provide a simple example of coordinate system conversion between Cartesian and Polar coordinates. This conversion is useful when working with the Audio Definition Model, where both coordinate systems are supported.

The repository contains an example Xcode project, written in Swift. This project builds a macOS example app, visualising the conversion with some basic sliders and labels.

## Maths

The conversion happens within two functions. These can be found in the Vector.swift file. Here is the function for converting from a polar coordinate to a cartesian coordinate:

```swift
    func pointPolarToCart(azimuth: Double, elevation: Double, distance: Double) -> (Double, Double, Double) {
        
        let azimuthRadian = -(Double(azimuth) * Double.pi/180)
        let elevationRadian = (Double(-elevation) * Double.pi/180) + Double.pi/2
        let distance = Double(distance)/2
        
        let y = distance * sin(elevationRadian) * cos(azimuthRadian) * 2
        let x = distance * sin(elevationRadian) * sin(azimuthRadian) * 2
        let z = distance * cos(elevationRadian) * 2

        return (x, y, z)
    }
```

Here is the function for converting from cartesian coordinates to polar coordinates:

```swift
        func pointCartToPolar(x: Double, y:Double, z:Double) -> (Double, Double, Double) {
        
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
```
## Summary

This is designed to provide a simple example of coordinate system conversion. Additional work will be needed to guarantee complience with ADM. For example, minimum and maximum values are not limited, and so conversion could produce out of range values.
