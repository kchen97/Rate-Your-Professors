//
//  practiceAppTests.swift
//  practiceAppTests
//
//  Created by Korman Chen on 9/14/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import XCTest
@testable import practiceApp

class practiceAppTests: XCTestCase {
    
    //Mark: Class Type Tests
    func testProfessorInitializationSucceeds()
    {
        let zeroCheck = Professor.init(name: "Korman", photo: nil, rating: 0)
        XCTAssertNotNil(zeroCheck)
        
        let maxRatingCheck = Professor.init(name: "Korman", photo: nil, rating: 5)
        XCTAssertNotNil(maxRatingCheck)
    }
    
    func testProfessorInitializationFails()
    {
        let negativeRatingCheck = Professor.init(name: "Korman", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingCheck)
        
        let exceedMaxRatingCheck = Professor.init(name: "Korman", photo: nil, rating: 6)
        XCTAssertNil(exceedMaxRatingCheck)
        
        let namelessCheck = Professor.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(namelessCheck)
    }
    
    
}
