/// Copyright 2017 Sergei Egorov
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.

import XCTest
import Foundation
import Filesystem

@testable import Log

class LogTests: XCTestCase {
    
    let fileSystem = FileSystem()
    let fileHandler = FileHandler()
    
    static var allTests : [(String, (LogTests) -> () throws -> Void)] {
        return [
            ("testCreateFileInNonExistFolder", testCreateFileInNonExistFolder),
            ("testLogVerboseMessage", testLogVerboseMessage),
            ("testLogDebugMessage", testLogDebugMessage),
            ("testLogInfoMessage", testLogInfoMessage),
            ("testLogWarningMessage", testLogWarningMessage),
            ("testLogErrorMessage", testLogErrorMessage)
        ]
    }
    
    // MARK: - Helpers

    func deleteTestFile(atPath path: String) throws {
        try fileSystem.deleteObject(atPath: path)
    }
    
    // MARK: - Tests
    
    func testCreateFileInNonExistFolder() throws {
        let testfilePath = "/Foo/bar"
        
        do {
            let _ = try Logger(testfilePath)
        } catch let error as Logger.Error {
            XCTAssertTrue(error == Logger.Error.couldNotOpenFile)
        }
    }
    
    func testLogVerboseMessage() throws {
        let testfilePath = "\(fileSystem.workPath)/\(UUID().uuidString)"
        
        let logger = try Logger(testfilePath)
        let log = Log(logger: logger)

        log.verbose("Message!")
        let data = try fileHandler.readWholeFile(atPath: testfilePath)
        let content = String(data: data, encoding: .utf8)!

        XCTAssertTrue(content.contains(#file.lastPathComponent))
        XCTAssertTrue(content.contains(#function))
        XCTAssertTrue(content.contains("Verbose"))
        XCTAssertTrue(content.contains("Message!"))
        try deleteTestFile(atPath: testfilePath)
    }
    
    func testLogDebugMessage() throws {
        let testfilePath = "\(fileSystem.workPath)/\(UUID().uuidString)"
        
        let logger = try Logger(testfilePath)
        let log = Log(logger: logger)
        
        log.debug("Message1!")
        let data = try fileHandler.readWholeFile(atPath: testfilePath)
        let content = String(data: data, encoding: .utf8)!
        
        XCTAssertTrue(content.contains(#file.lastPathComponent))
        XCTAssertTrue(content.contains(#function))
        XCTAssertTrue(content.contains("Debug"))
        XCTAssertTrue(content.contains("Message1!"))
        try deleteTestFile(atPath: testfilePath)
    }
    
    func testLogInfoMessage() throws {
        let testfilePath = "\(fileSystem.workPath)/\(UUID().uuidString)"

        let logger = try Logger(testfilePath)
        let log = Log(logger: logger)
        
        log.info("Message2!")
        let data = try fileHandler.readWholeFile(atPath: testfilePath)
        let content = String(data: data, encoding: .utf8)!
        
        XCTAssertTrue(content.contains(#file.lastPathComponent))
        XCTAssertTrue(content.contains(#function))
        XCTAssertTrue(content.contains("Info"))
        XCTAssertTrue(content.contains("Message2!"))
        try deleteTestFile(atPath: testfilePath)
    }
    
    func testLogWarningMessage() throws {
        let testfilePath = "\(fileSystem.workPath)/\(UUID().uuidString)"
        
        let logger = try Logger(testfilePath)
        let log = Log(logger: logger)
        
        log.warning("Message3!")
        let data = try fileHandler.readWholeFile(atPath: testfilePath)
        let content = String(data: data, encoding: .utf8)!
        
        XCTAssertTrue(content.contains(#file.lastPathComponent))
        XCTAssertTrue(content.contains(#function))
        XCTAssertTrue(content.contains("Warning"))
        XCTAssertTrue(content.contains("Message3!"))
        try deleteTestFile(atPath: testfilePath)
    }
    
    func testLogErrorMessage() throws {
        let testfilePath = "\(fileSystem.workPath)/\(UUID().uuidString)"
        
        let logger = try Logger(testfilePath)
        let log = Log(logger: logger)
        
        log.error("Message4!")
        let data = try fileHandler.readWholeFile(atPath: testfilePath)
        let content = String(data: data, encoding: .utf8)!
        
        XCTAssertTrue(content.contains(#file.lastPathComponent))
        XCTAssertTrue(content.contains(#function))
        XCTAssertTrue(content.contains("Error"))
        XCTAssertTrue(content.contains("Message4!"))
        try deleteTestFile(atPath: testfilePath)
    }
    
}
