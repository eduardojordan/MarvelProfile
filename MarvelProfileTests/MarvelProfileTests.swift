//
//  MarvelProfileTests.swift
//  MarvelProfileTests
//
//  Created by Eduardo Jordan on 3/3/21.
//

import XCTest
@testable import MarvelProfile

class MarvelProfileTests: XCTestCase {

    func testParseJsonFile() throws {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "marvel", ofType: "json") else {
            fatalError("json not found")
        }
        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert jsont to String")
        }
        let jsonData = json.data(using: .utf8)!
        let character = try! JSONDecoder().decode(Characters.self, from: jsonData)

        XCTAssertEqual("3-D Man", character.data?.results[0].name)
        XCTAssertEqual("", character.data?.results[0].description)
    }

    


}
