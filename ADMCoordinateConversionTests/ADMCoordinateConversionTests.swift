//
//  ADMCoordinateConversionTests.swift
//  ADMCoordinateConversionTests
//
//  Created by Daniel Higgott on 11/11/2023.
//

import XCTest
@testable import ADMCoordinateConversion

final class ADMCoordinateConversionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRadiusTransform(){
        let origin = Vector(x: 0.0, y: 0.0, z: 0.0)
        XCTAssertEqual(origin.distance, 0.0)
        
        let front = Vector(x: 0.5, y: 0.0, z: 0.0)
        XCTAssertEqual(front.distance, 0.5)
        
        let back = Vector(x: 0.0, y: 1.0, z: 0.0)
        XCTAssertEqual(back.distance, 1.0)
        
        let left = Vector(x: -0.5, y: 0.0, z: 0.0)
        XCTAssertEqual(left.distance, 0.5)
        
        let right = Vector(x: 1.0, y: 0.0, z: 0.0)
        XCTAssertEqual(right.distance, 1.0)
        
        let rearLeft = Vector(x: -0.5, y: -0.5, z: 0.0)
        XCTAssertEqual(rearLeft.distance, 0.7071067811865476)
    }
    
    func testAzimuthTransform(){
        let origin = Vector(x: 0.0, y: 0.0, z: 0.0)
        XCTAssertEqual(origin.azimuth, 0.0)
        
        let front = Vector(x: 0.0, y: 0.5, z: 0.0)
        XCTAssertEqual(front.azimuth, 0.0)
        
        let back = Vector(x: 0.0, y: -0.5, z: 0.0)
        XCTAssertEqual(back.azimuth, -180.0)
        
        let left = Vector(x: -0.5, y: 0.0, z: 0.0)
        XCTAssertEqual(left.azimuth, 90.0)
        
        let right = Vector(x: 0.5, y: 0.0, z: 0.0)
        XCTAssertEqual(right.azimuth, -90.0)
        
        let rearLeft = Vector(x: -0.5, y: -0.5, z: 0.0)
        XCTAssertEqual(rearLeft.azimuth, 135)
    }
    
    func testElevationTransform(){
        let origin = Vector(x: 0.0, y: 0.0, z: 0.0)
        XCTAssertEqual(origin.elevation, 0.0)
        
        let front = Vector(x: 0.0, y: 0.5, z: 0.0)
        XCTAssertEqual(front.elevation, 0.0)
        
        let back = Vector(x: 0.0, y: -0.5, z: 0.0)
        XCTAssertEqual(back.elevation, 0.0)
        
        let top = Vector(x: 0.0, y: 0.0, z: 0.5)
        XCTAssertEqual(top.elevation, 90.0)
        
        let bottom = Vector(x: 0.0, y: 0.0, z: -0.5)
        XCTAssertEqual(bottom.elevation, -90.0)
        
        let topRearLeft = Vector(x: 0.0, y: -0.5, z: 0.5)
        XCTAssertEqual(topRearLeft.elevation, 45.0)
    }
    
    func testPolarToCartTransform(){
        let origin = Vector(azimuth: 0.0, elevation: 0.0, distance: 0.0)
        XCTAssertEqual(origin.x, 0.0, accuracy: 1.0e-10)
        XCTAssertEqual(origin.y, 0.0, accuracy: 1.0e-10)
        XCTAssertEqual(origin.z, 0.0, accuracy: 1.0e-10)
        
        let front = Vector(azimuth: 0.0, elevation: 0.0, distance: 1.0)
        XCTAssertEqual(front.x, 0.0, accuracy: 1.0e-10)
        XCTAssertEqual(front.y, 1.0, accuracy: 1.0e-10)
        XCTAssertEqual(front.z, 0.0, accuracy: 1.0e-10)
        
        let back = Vector(azimuth: -180.0, elevation: 0.0, distance: 1.0)
        XCTAssertEqual(back.x, 0.0, accuracy: 1.0e-10)
        XCTAssertEqual(back.y, -1.0, accuracy: 1.0e-10)
        XCTAssertEqual(back.z, 0.0, accuracy: 1.0e-10)
        
        let top = Vector(azimuth: 0.0, elevation: 90.0, distance: 1.0)
        XCTAssertEqual(top.x, 0.0, accuracy: 1.0e-10)
        XCTAssertEqual(top.y, 0.0, accuracy: 1.0e-10)
        XCTAssertEqual(top.z, 1.0, accuracy: 1.0e-10)
        
        let bottom = Vector(azimuth: 0.0, elevation: -90.0, distance: 1.0)
        XCTAssertEqual(bottom.x, 0.0, accuracy: 1.0e-10)
        XCTAssertEqual(bottom.y, 0.0, accuracy: 1.0e-10)
        XCTAssertEqual(bottom.z, -1.0, accuracy: 1.0e-10)
        
        let topRearLeft = Vector(azimuth: 132.0, elevation: 45.0, distance: 1.0)
        XCTAssertEqual(topRearLeft.x, -0.5254827454987588)
        XCTAssertEqual(topRearLeft.y, -0.473146789255815)
        XCTAssertEqual(topRearLeft.z, 0.7071067811865476)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
