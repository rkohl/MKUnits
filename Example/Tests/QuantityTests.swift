//
//  QuantityTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 29/07/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

@testable import MKUnits

class QuantityTests: XCTestCase {
    var sut = Quantity(amount: 100, unit: TestUnit.unitA)

    func test_init() {
        XCTAssertEqual(self.sut.amount, 100)
        XCTAssertTrue(self.sut.unit == TestUnit.unitA)
    }
    
    func test_converted() {
        let converted = self.sut.converted(TestUnit.unitB)
        XCTAssertEqual(converted.amount, 10)
        XCTAssertTrue(converted.unit == TestUnit.unitB)
    }
    
    // MARK: - Equatable
    func test_equatable_returnsTrue() {
        let other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut == other)
    }
    
    func test_equatable_returnsFalse() {
        var other = Quantity(amount: 100, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut == other)
        
        other = Quantity(amount: 10, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut == other)
    }
    
    // MARK: - Comparable
    func test_comparable_lessThan_returnsTrue() {
        var other = Quantity(amount: 200, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut < other)

        other = Quantity(amount: 11, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut < other)
    }
    
    func test_comparable_lessThan_returnsFalse() {
        var other = Quantity(amount: 10, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut < other)
        
        other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut < other)
        
        other = Quantity(amount: 1, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut < other)
    }
    
    func test_comparable_lessThanOrEqual_returnsTrue() {
        var other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut <= other)
        
        other = Quantity(amount: 200, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut <= other)
        
        other = Quantity(amount: 10, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut <= other)
        
        other = Quantity(amount: 11, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut <= other)
    }
    
    func test_comparable_lessThanOrEqual_returnsFalse() {
        var other = Quantity(amount: 20, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut <= other)
        
        other = Quantity(amount: 1, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut <= other)
    }
    
    func test_comparable_greaterThan_returnsTrue() {
        var other = Quantity(amount: 10, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut > other)
        
        other = Quantity(amount: 1, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut > other)
    }
    
    func test_comparable_greaterThan_returnsFalse() {
        var other = Quantity(amount: 200, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut > other)
        
        other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut > other)
        
        other = Quantity(amount: 11, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut > other)
    }
    
    func test_comparable_greaterThanOrEqual_returnsTrue() {
        var other = Quantity(amount: 10, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut >= other)
        
        other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut >= other)
        
        other = Quantity(amount: 10, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut >= other)
        
        other = Quantity(amount: 9, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut >= other)
    }
    
    func test_comparable_greaterThanOrEqual_returnsFalse() {
        var other = Quantity(amount: 200, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut >= other)
        
        other = Quantity(amount: 11, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut >= other)
    }
}
