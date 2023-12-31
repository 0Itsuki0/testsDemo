//
//  ResponseTest.swift
//  testsDemoTests
//
//  Created by Itsuki on 2023/10/17.
//

import XCTest
@testable import testsDemo

final class ResponseTest: XCTestCase {
    
    var sut: RepositoryResponse!

    override func setUpWithError() throws {
        
        try super.setUpWithError()

    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // 5
        // Object Cleanup
        sut = nil
    }

    func testResponseDecoding() throws {
        
        let path = Bundle(for: ResponseTest.self).path(forResource: "sampleResponse", ofType: "json")!
        let data = NSData(contentsOfFile: path)! as Data
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        sut = try! decoder.decode(RepositoryResponse.self, from: data)
        XCTAssertEqual(sut.totalCount, 265387)
        XCTAssertNotNil(sut.items)
        
    }
    



}
