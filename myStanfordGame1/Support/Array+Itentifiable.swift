//
//  Array+Itentifiable.swift
//  Memorize_stanford_4
//
//  Created by ha tuong do on 5/15/21.
//
// change outpuf ot firstIndex() from Int to Int? (optional)

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? { // was -> Int
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
    return nil // TODO: bogus !
    }
}
