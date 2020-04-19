//
//  Data.swift
//  MobileTests
//
//  Created by jack on 19/4/20.
//  Copyright © 2020 fl. All rights reserved.
//


import Foundation
import XCTest

extension Data {
  
  public static func fromJSON(fileName: String,
                              file: StaticString = #file,
                              line: UInt = #line) throws -> Data {
    
    let bundle = Bundle(for: TestBundleClass.self)
    let url = try XCTUnwrap(bundle.url(forResource: fileName, withExtension: "json"),
                            "load json file failed",
      file: file, line: line)
    return try Data(contentsOf: url)
  }
}

private class TestBundleClass { }
