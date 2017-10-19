//
//  BestPracticeTests.swift
//  BestPracticeTests
//
//  Created by Lei Huang on 17/10/2017.
//  Copyright © 2017 leihuang. All rights reserved.
//

import XCTest
import Nimble
import Quick

@testable import BestPractice

class BestPracticeSpec: QuickSpec {
    override func spec() {
        describe("Quick Framework testing") {
            it("should be pass") {
                expect(1+1).to(equal(2))
            }
        }
    }
}

