//
//  AlphaCesarCipherTest.swift
//  SpyAppTests
//
//  Created by Gordon on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphaCesarCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphaCesarCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual("A", result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    
}
