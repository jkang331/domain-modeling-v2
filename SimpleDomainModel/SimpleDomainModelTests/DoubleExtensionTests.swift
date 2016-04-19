//
//  DoubleExtensionTests.swift
//  SimpleDomainModel
//
//  Created by Jennifer Kang on 4/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel

//////////////////
// Testing extension to extend Double
//
class DoubleExtensionTests: XCTestCase {
    
    func testingUSD() {
        let twentyfiveUSD = 25.0
        let moneyConversion = twentyfiveUSD.USD
        XCTAssert(moneyConversion.amount == 25)
        XCTAssert(moneyConversion.currency == "USD")
    }
    
    func testingGBP() {
        let fifteenGBP = 15.0
        let moneyConversion = fifteenGBP.GBP
        XCTAssert(moneyConversion.amount == 15)
        XCTAssert(moneyConversion.currency == "GBP")
    }
    
    func testingEUR() {
        let fiveEUR = 5.0
        let moneyConversion = fiveEUR.EUR
        XCTAssert(moneyConversion.amount == 5)
        XCTAssert(moneyConversion.currency == "EUR")
    }
    
    func testingCAN() {
        let negfiveCAN = -5.0
        let moneyConversion = negfiveCAN.CAN
        XCTAssert(moneyConversion.amount == -5)
        XCTAssert(moneyConversion.currency == "CAN")
    }
}
