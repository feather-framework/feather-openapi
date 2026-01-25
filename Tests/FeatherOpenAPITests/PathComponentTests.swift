//
//  PathComponentTests.swift
//  feather-openapi
//
//  Created by Tibor Bodecs on 2026. 01. 22..

import Foundation
import Testing

@testable import FeatherOpenAPI

extension Path {

    fileprivate static func star(_ param: String) -> Path {
        Path("*" + param + "*")
    }

    fileprivate static func superstar() -> Path {
        Path("********")
    }
}

//parameter test class with name
private struct ParameterDummy {
    let name: String
}

extension Path {

    fileprivate static func parameter(_ param: ParameterDummy) -> Path {
        parameter(param.name)
    }
}

@Suite
struct PathComponentTests {

    @Test
    func doesNotCompile() {
        //        let test = "foo" / "part_second" / "part_third"
    }

    @Test
    func stringLiteralInit() {
        let test: Path = .init("foo")
        #expect(test.value == "foo")
    }

    @Test
    func explicitPathComponent() {
        let test =
            Path("foo") / Path("part_second")
            / Path("part_third")
        #expect(test.value == "foo/part_second/part_third")
    }

    @Test
    func explicitPathComponentOp() {
        let test =
            Path("foo") / Path("part_second")
            / Path("part_third")
        #expect(test.value == "foo/part_second/part_third")
    }

    @Test
    func pureStringLiteralOp() {
        let test: Path = .init("foo") / "part_second"
        #expect(test.value == "foo/part_second")
    }

    @Test
    func decorInit() {
        let test: Path = .parameter("param")
        #expect(test.value == "{param}")
    }

    @Test
    func decorOp() {
        let test: Path =
            .init("foo") / "part_second" / .parameter("param") / .star("star")
        #expect(test.value == "foo/part_second/{param}/*star*")
    }

    @Test
    func stringInit() {
        let strTest = "string"
        let test: Path = .init(strTest)
        #expect(test.value == "string")
    }

    @Test
    func stringOp_1() {
        let strTest = "string"
        let test: Path = Path("foo") / strTest
        #expect(test.value == "foo/string")
    }

    @Test
    func stringOp_2() {
        let strTest = "string"
        let test: Path = strTest / Path("foo")
        #expect(test.value == "string/foo")
    }

    @Test
    func parameterOp() {
        let paramDummy = ParameterDummy(name: "param")
        let test: Path =
            .init("foo") / "part_second" / .parameter(paramDummy)
        // also works with explicit name:
        //let test: PathComponent = .init("foo") / "part_second" / .parameter(paramDummy.name)
        #expect(test.value == "foo/part_second/{param}")
    }

    @Test
    func ultimate() {
        // utimate op test
        //TODO: may replace by freestanding macros like that:
        //  #let_path_comp("example")
        //  #var_path_comp("model")
        let paramVariable = ParameterDummy(name: "variable-id")
        let example = Path("example")
        let model = Path("model")

        let test = example / model / .superstar() / .parameter(paramVariable)

        #expect(test.value == "example/model/********/{variable-id}")
    }
}
