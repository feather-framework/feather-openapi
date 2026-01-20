//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import Foundation
import XCTest

@testable import FeatherOpenAPI

fileprivate extension Path {

    static func star(_ param: String) -> Path {
        Path("*" + param + "*")
    }

    static func superstar() -> Path {
        Path("********")
    }
}

//parameter test class with name
private struct ParameterDummy {
    let name: String
}

fileprivate extension Path {

    static func parameter(_ param: ParameterDummy) -> Path {
        parameter(param.name)
    }
}

final class PathComponentTests: XCTestCase {

    func testDoesNotCompile() {
        //        let test = "foo" / "part_second" / "part_third"
    }

    func testStringLiteralInit() {
        let test: Path = .init("foo")
        XCTAssertEqual(test.value, "foo")
    }

    func testExplicitPathComponent() {
        let test =
            Path("foo") / Path("part_second")
            / Path("part_third")
        XCTAssertEqual(test.value, "foo/part_second/part_third")
    }

    func testExplicitPathComponentOp() {
        let test =
            Path("foo") / Path("part_second")
            / Path("part_third")
        XCTAssertEqual(test.value, "foo/part_second/part_third")
    }

    func testPureStringLiteralOp() {
        let test: Path = .init("foo") / "part_second"
        XCTAssertEqual(test.value, "foo/part_second")
    }

    func testDecorInit() {
        let test: Path = .parameter("param")
        XCTAssertEqual(test.value, "{param}")
    }

    func testDecorOp() {
        let test: Path =
            .init("foo") / "part_second" / .parameter("param") / .star("star")
        XCTAssertEqual(test.value, "foo/part_second/{param}/*star*")
    }

    func testStringInit() {
        let strTest = "string"
        let test: Path = .init(strTest)
        XCTAssertEqual(test.value, "string")
    }

    func testStringOp_1() {
        let strTest = "string"
        let test: Path = Path("foo") / strTest
        XCTAssertEqual(test.value, "foo/string")
    }

    func testStringOp_2() {
        let strTest = "string"
        let test: Path = strTest / Path("foo")
        XCTAssertEqual(test.value, "string/foo")
    }

    func testParameterOp() {
        let paramDummy = ParameterDummy(name: "param")
        let test: Path =
            .init("foo") / "part_second" / .parameter(paramDummy)
        // also works with explicit name:
        //let test: PathComponent = .init("foo") / "part_second" / .parameter(paramDummy.name)
        XCTAssertEqual(test.value, "foo/part_second/{param}")
    }

    func testUltimate() {
        // utimate op test
        //TODO: may replace by freestanding macros like that:
        //  #let_path_comp("example")
        //  #var_path_comp("model")
        let paramVariable = ParameterDummy(name: "variable-id")
        let example = Path("example")
        let model = Path("model")

        let test = example / model / .superstar() / .parameter(paramVariable)

        XCTAssertEqual(test.value, "example/model/********/{variable-id}")
    }
}
