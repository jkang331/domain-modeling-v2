//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
    return "I have been tested"
}

public class TestMe {
    public func Please() -> String {
        return "I have been tested"
    }
}


protocol CustomStringConvertible {
    func description() -> String  //QUESTION: SHOULD THIS BE A FUNC OR VAR?
}


////////////////////////////////////
// Money
//
public struct Money : CustomStringConvertible {
    public var amount : Int
    public var currency : String
    
    public func convert(to: String) -> Money {
        var newAmount: Int;
        switch currency {
        case "USD":
            if to == "GBP" {
                newAmount = amount / 2;
                return Money(amount: newAmount, currency: "GBP")
            } else if to == "EUR" {
                newAmount = (amount * 3) / 2;
                return Money(amount: newAmount, currency: "EUR")
            } else if to == "CAN" {
                newAmount = (amount * 5) / 4;
                return Money(amount: newAmount, currency: "CAN")
            } else {
                return self;
            }
        case "GBP" :
            if to == "USD" {
                newAmount = amount * 2;
                return Money(amount: newAmount, currency: "USD")
            } else if to == "EUR" {
                newAmount = amount * 3;
                return Money(amount: newAmount, currency: "EUR")
            } else if to == "CAN" {
                newAmount = (amount * 5) / 2;
                return Money(amount: newAmount, currency: "CAN")
            } else {
                return self;
            }
        case "EUR" :
            if to == "USD" {
                newAmount = (amount * 2) / 3;
                return Money(amount: newAmount, currency: "USD")
            } else if to == "GBP" {
                newAmount = amount / 3;
                return Money(amount: newAmount, currency: "GBP")
            } else if to == "CAN" {
                newAmount = (amount * 5) / 6;
                return Money(amount: newAmount, currency: "CAN")
            } else {
                return self;
            }
        case "CAN" :
            if to == "USD" {
                newAmount = (amount * 4) / 5;
                return Money(amount: newAmount, currency: "USD")
            } else if to == "GBP" {
                newAmount = (amount * 2) / 5;
                return Money(amount: newAmount, currency: "GBP")
            } else if to == "EUR" {
                newAmount = (amount * 6) / 5;
                return Money(amount: newAmount, currency: "EUR")
            } else {
                return self;
            }
        default:
            print("Looks like the given currency doesn't match known currencies.  Please try again.")
            return self;
        }
    }
    
    public func add(to: Money) -> Money {
        if to.currency == currency {
            return Money(amount: amount + to.amount, currency: to.currency);
        }
        let convertedAmount = convert(to.currency);
        return Money(amount: convertedAmount.amount + to.amount, currency: to.currency);
    }
    
    public func subtract(from: Money) -> Money {
        if from.currency == currency {
            return Money(amount: from.amount - amount, currency: from.currency);
        }
        let convertedAmount = convert(from.currency);
        return Money(amount: from.amount - convertedAmount.amount, currency: from.currency);
    }
    
    public func description() -> String {
        return "\(currency) + \(amount)"
    }
    
}

////////////////////////////////////
// Job
//
//public class Job {
//  public enum JobType {
//    case Hourly(Double)
//    case Salary(Int)
//  }
//
//  public init(title : String, type : JobType) {
//  }
//
//  public func calculateIncome(hours: Int) -> Int {
//  }
//
//  public func raise(amt : Double) {
//  }
//}

////////////////////////////////////
// Person
//
//public class Person {
//  public var firstName : String = ""
//  public var lastName : String = ""
//  public var age : Int = 0
//
//  public var job : Job? {
//    get { }
//    set(value) {
//    }
//  }
//
//  public var spouse : Person? {
//    get { }
//    set(value) {
//    }
//  }
//
//  public init(firstName : String, lastName: String, age : Int) {
//    self.firstName = firstName
//    self.lastName = lastName
//    self.age = age
//  }
//
//  public func toString() -> String {
//  }
//}

////////////////////////////////////
// Family
//
//public class Family {
//  private var members : [Person] = []
//
//  public init(spouse1: Person, spouse2: Person) {
//  }
//
//  public func haveChild(child: Person) -> Bool {
//  }
//
//  public func householdIncome() -> Int {
//  }
//}





