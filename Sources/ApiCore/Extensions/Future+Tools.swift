//
//  Future+Tools.swift
//  ApiCore
//
//  Created by Ondrej Rafaj on 14/02/2018.
//

import Foundation
import Vapor


extension Future {
    
    /// Flatten any Future into Future<Void>
    public func flatten() -> Future<Void> {
        return map(to: Void.self) { (_) -> Void in
            return Void()
        }
    }
    
}
