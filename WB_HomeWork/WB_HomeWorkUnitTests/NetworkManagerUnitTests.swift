//
//  NetworkManagerUnitTests.swift
//  WB_HomeWorkTests
//
//  Created by Мария Изюменко on 11.08.2024.
//

import XCTest
@testable import WB_HomeWork

class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManager!
    var url: URL!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager()
        url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")
    }
    
    override func tearDown() {
        networkManager = nil
        url = nil
        super.tearDown()
    }
    
    func testGetRequest() {
        let expectation = self.expectation(description: "GET request succeed")
        
        networkManager.getRequest(url: url) { data, response, error in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPostRequest() {
        let expectation = self.expectation(description: "POST request succeed")
        let postData = "{\"title\":\"foo\",\"body\":\"bar\",\"userId\":1}".data(using: .utf8)
        
        networkManager.postRequest(url: url, body: postData) { data, response, error in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPutRequest() {
        let expectation = self.expectation(description: "PUT request succeed")
        let putData = "{\"id\":1,\"title\":\"foo\",\"body\":\"bar\",\"userId\":1}".data(using: .utf8)
        
        networkManager.putRequest(url: url, body: putData) { data, response, error in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testDeleteRequest() {
        let expectation = self.expectation(description: "DELETE request succeed")
        
        networkManager.deleteRequest(url: url) { data, response, error in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}


