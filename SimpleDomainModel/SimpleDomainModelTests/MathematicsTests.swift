//
//  MathematicsTests.swift
//  SimpleDomainModel
//
//  Created by Jennifer Kang on 4/17/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel

//////////////////
// Testing protocol Mathematics to Money Class
//
class MathematicsTests: XCTestCase {
    
    let tenUSD = Money(amount: 10, currency: "USD")
    let twelveUSD = Money(amount: 12, currency: "USD")
    let fiveGBP = Money(amount: 5, currency: "GBP")
    
    func testAddUSDtoUSD() {
        let total = tenUSD + tenUSD
        XCTAssert(total.amount == 20)
        XCTAssert(total.currency == "USD")
    }
    
    func testAddUSDtoGBP() {
        let total = tenUSD + fiveGBP
        XCTAssert(total.amount == 10)
        XCTAssert(total.currency == "GBP")
    }

    func testSubtractUSDtoUSD() {
        let total = tenUSD - twelveUSD
        XCTAssert(total.amount == -2)
        XCTAssert(total.currency == "USD")
    }
    
    func testSubtractUSDtoGBP() {
        let total = twelveUSD - fiveGBP
        XCTAssert(total.amount == 1)
        XCTAssert(total.currency == "GBP")
    }
    
}
