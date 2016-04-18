//
//  JobTests.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel

class JobTests: XCTestCase {
    
    // ADDED TEST FOR PROTOCOL
    func testCustomStringConvertible() {
        let job1 = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        XCTAssert(job1.description() == "Guest Lecturer (1000 salary)")
        
        let job2 = Job(title: "Janitor", type: Job.JobType.Hourly(15.0))
        print(job2.description())
        XCTAssert(job2.description() == "Janitory (15.0 per hour)")
    }
    
    func testCreateSalaryJob() {
        let job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        XCTAssert(job.calculateIncome(50) == 1000)
    }
    
    func testCreateHourlyJob() {
        let job = Job(title: "Janitor", type: Job.JobType.Hourly(15.0))
        XCTAssert(job.calculateIncome(10) == 150)
    }
    
    func testSalariedRaise() {
        let job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        XCTAssert(job.calculateIncome(50) == 1000)
        
        job.raise(1000)
        XCTAssert(job.calculateIncome(50) == 2000)
    }
    
    func testHourlyRaise() {
        let job = Job(title: "Janitor", type: Job.JobType.Hourly(15.0))
        XCTAssert(job.calculateIncome(10) == 150)
        
        job.raise(1.0)
        XCTAssert(job.calculateIncome(10) == 160)
    }
    
}
