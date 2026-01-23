//
//  File.swift
//  feather-openapi
//
//  Created by Tibor Bödecs on 2026. 01. 22..
//

public protocol Identifiable: Sendable {
    var openAPIIdentifier: String { get }
}

public extension Identifiable {

    var openAPIIdentifier: String {
        String(describing: type(of: self))
    }
}


//static var id: String {
//    var components = String(reflecting: self).split(separator: ".")
//    components.remove(at: 0)  // remove namespace
//    components.remove(at: 2)  // remove enum name
//    return
//        components
//        .joined(separator: "")
//        .replacing("GenericComponent", with: "Generic")
//}
