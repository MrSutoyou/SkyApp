//
//  ROT13CipherTest.swift
//  SpyAppTests
//
//  Created by Gordon on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class ROT13CipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = ROT13Cipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual("T", result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil("U")
    }
    
    
}
