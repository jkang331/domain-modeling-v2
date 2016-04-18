//
//  CustomStringConvertibleTests.swift
//  SimpleDomainModel
//
//  Created by Jennifer Kang on 4/17/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel

//////////////////
// MoneyTests
//
class CustomStringConvertibleTests: XCTestCase {
    
    let tenUSD = Money(amount: 10, currency: "USD")
    let twelveUSD = Money(amount: 12, currency: "USD")
    let fiveGBP = Money(amount: 5, currency: "GBP")
    let fifteenEUR = Money(amount: 15, currency: "EUR")
    let fifteenCAN = Money(amount: 15, currency: "CAN")
    
    func testMoneyDescription() {
        XCTAssert(tenUSD.description() == "USD10")
        XCTAssert(twelveUSD.description() == "USD12")
        XCTAssert(fiveGBP.description() == "GBP5")
        XCTAssert(fifteenEUR.description() == "EUR15")
        XCTAssert(fifteenCAN.description() == "CAN15")
    }
    
    func testJobDescription() {
        let job1 = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        XCTAssert(job1.description() == "Guest Lecturer (1000 salary)")
        
        let job2 = Job(title: "Janitor", type: Job.JobType.Hourly(15.0))
        XCTAssert(job2.description() == "Janitor (15.0 per hour)")
        
        let job3 = Job(title: "POTUS", type: Job.JobType.Salary(123456))
        XCTAssert(job3.description() == "POTUS (123456 salary)")
    }
    
    func testPersonDescription() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        XCTAssert(ted.description() == "[Person: firstName:Ted lastName:Neward age:45 job:nil spouse:nil]")
        
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
        XCTAssert(charlotte.description() == "[Person: firstName:Charlotte lastName:Neward age:45 job:nil spouse:nil]")
        
        //adding a job
        ted.job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        XCTAssert(ted.description() == "[Person: firstName:Ted lastName:Neward age:45 job:Guest Lecturer (1000 salary) spouse:nil]")
        
        //adding a spouse
        ted.spouse = charlotte;
        XCTAssert(ted.description() == "[Person: firstName:Ted lastName:Neward age:45 job:Guest Lecturer (1000 salary) spouse:Charlotte Neward]")
        
    }
    
    func testFamilyDescription() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        ted.job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
        
        let family = Family(spouse1: ted, spouse2: charlotte)
        
        XCTAssert(family.description() == "[Members:  Ted Neward, Charlotte Neward | Household Income: 1000]")
        
        //add a child
        let matt = Person(firstName: "Matt", lastName: "Neward", age: 16)
        family.haveChild(matt)
        XCTAssert(family.description() == "[Members:  Ted Neward, Charlotte Neward, Matt Neward | Household Income: 1000]")
        
        
        //add a child with a job (affecting income)
        let mike = Person(firstName: "Mike", lastName: "Neward", age: 22)
        mike.job = Job(title: "Burger-Flipper", type: Job.JobType.Hourly(5.5))
        family.haveChild(mike)
        XCTAssert(family.description() == "[Members:  Ted Neward, Charlotte Neward, Matt Neward, Mike Neward | Household Income: 12000]")
    }
}

