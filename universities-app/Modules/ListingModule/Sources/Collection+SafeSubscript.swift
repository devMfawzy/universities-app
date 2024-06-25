//
//  File.swift
//  
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
