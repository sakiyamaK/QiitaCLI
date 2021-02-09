import XCTest

import QiitaCLITests

var tests = [XCTestCaseEntry]()
tests += QiitaCLITests.allTests()
XCTMain(tests)
