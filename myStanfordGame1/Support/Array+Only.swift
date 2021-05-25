//
//  Array+Only.swift
//  Memorize_stanford_4
//
//  Created by ha tuong do on 5/16/21.
//

import Foundation

extension Array {
    // var only needs to be public
    var only: Element? {
        self.count == 1 ? first : nil
    }
}
