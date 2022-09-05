//
//  Extensions.swift
//  NetflixClone
//
//  Created by engin gülek on 5.09.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
