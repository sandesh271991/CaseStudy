//
//  TestCaseTests.swift
//  TestCaseTests
//
//  Created by 1923800 on 25/07/22.
//

import XCTest
import CoreData

@testable import TestCase

class TestCaseTests: XCTestCase {

    var controller: PersistenceController =  PersistenceController()
    @Published var results = [ResultItem]()

    var home = ContentView()


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testFetchCoreDataItems(){
        controller.saveResult(title: "testData")
        let getData = controller.getResult()
        XCTAssertTrue(getData.count > 0)
    }

    func testDeleteCoreDataItems(){
        controller.deleteOldResult()
        let getData = controller.getResult()
        XCTAssertTrue(getData.count == 0)
    }

    func testDetailViewData() throws {
        let subject = DetailView(data: "testData")
        XCTAssertTrue(subject.data == "testData")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
