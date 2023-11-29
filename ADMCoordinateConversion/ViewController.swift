//
//  ViewController.swift
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

import Cocoa

class ViewController: NSViewController {
    
    var vector:Vector = Vector(x: 0.0, y: 0.0, z: 0.0)

    @IBOutlet weak var xLabel: NSTextField!
    @IBOutlet weak var yLabel: NSTextField!
    @IBOutlet weak var zLabel: NSTextField!
    
    @IBOutlet weak var azimuthLabel: NSTextField!
    @IBOutlet weak var elevationLabel: NSTextField!
    @IBOutlet weak var distanceLabel: NSTextField!
    
    @IBOutlet weak var xSlider: NSSlider!
    @IBOutlet weak var ySlider: NSSlider!
    @IBOutlet weak var zSlider: NSSlider!
    
    @IBOutlet weak var azimuthSlider: NSSlider!
    @IBOutlet weak var elevationSlider: NSSlider!
    @IBOutlet weak var distanceSlider: NSSlider!
    
    @IBOutlet weak var xReset: NSButton!
    @IBOutlet weak var yReset: NSButton!
    @IBOutlet weak var zReset: NSButton!
    
    @IBOutlet weak var azimuthReset: NSButton!
    @IBOutlet weak var elevationReset: NSButton!
    @IBOutlet weak var distanceReset: NSButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePolarValues()
        updateCartesianValues()
    }

    @IBAction func sliderDidChange(_ sender: Any) {
        
        guard let slider = sender as? NSSlider else {return}
        
        switch slider {
        case xSlider:
            vector.set(x: round(100 * slider.doubleValue)/100)
        case ySlider:
            vector.set(y: round(100 * slider.doubleValue)/100)
        case zSlider:
            vector.set(z: round(100 * slider.doubleValue)/100)
        case azimuthSlider:
            vector.set(azimuth: round(100 * slider.doubleValue)/100)
        case elevationSlider:
            vector.set(elevation: round(100 * slider.doubleValue)/100)
        case distanceSlider:
            vector.set(distance: round(100 * slider.doubleValue)/100)
        default:
            break
        }
        updatePolarValues()
        updateCartesianValues()
    }
    
    @IBAction func resetClicked(_ sender: Any) {
        
        guard let button = sender as? NSButton else {return}
        
        switch button {
        case xReset:
            vector.set(x: 0.0)
        case yReset:
            vector.set(y: 0.0)
        case zReset:
            vector.set(z: 0.0)
        case azimuthReset:
            vector.set(azimuth: 0.0)
        case elevationReset:
            vector.set(elevation: 0.0)
        case distanceReset:
            vector.set(distance: 0.0)
        default:
            break
        }
        updatePolarValues()
        updateCartesianValues()
    }
    
    
    func updateCartesianValues() {
        xLabel.stringValue = String(round(100 * vector.x)/100)
        xSlider.doubleValue = vector.x
        
        yLabel.stringValue = String(round(100 * vector.y)/100)
        ySlider.doubleValue = vector.y
        
        zLabel.stringValue = String(round(100 * vector.z)/100)
        zSlider.doubleValue = vector.z
    }
    
    func updatePolarValues() {
        azimuthLabel.stringValue = String(round(100 * vector.azimuth)/100) + "°"
        azimuthSlider.doubleValue = vector.azimuth
        
        elevationLabel.stringValue = String(round(100 * vector.elevation)/100) + "°"
        elevationSlider.doubleValue = vector.elevation
        
        distanceLabel.stringValue = String(round(100 * vector.distance)/100)
        distanceSlider.doubleValue = vector.distance
    }

}

