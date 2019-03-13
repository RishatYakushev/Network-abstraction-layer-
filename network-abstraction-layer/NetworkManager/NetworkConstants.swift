//
//  NetworkConstants.swift
//  network-abstraction-layer
//
//  Created by Rishat Yakushev on 13/03/2019.
//  Copyright © 2019 Ришат Якушев. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case unauthorized
    case invalidJSON
    case invalidError
    case custom(Error)
}

public struct NetworkConstants {
    public static let successCodes: Range<Int> = 200..<300
    
    public static let unauthorizeCode: Int = 401
}
