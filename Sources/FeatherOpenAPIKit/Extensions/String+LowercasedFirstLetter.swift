//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

extension String {

    func lowercasedFirstLetter() -> String {
        guard !isEmpty else {
            return self
        }
        return prefix(1).lowercased() + dropFirst()
    }
}
