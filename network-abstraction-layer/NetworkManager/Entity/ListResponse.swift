//
//  ListResponse.swift
//  network-abstraction-layer
//
//  Created by Rishat Yakushev on 13/03/2019.
//  Copyright © 2019 Ришат Якушев. All rights reserved.
//

import Foundation

public struct ListResponse<T: Codable>: Codable {
    public var count: Int
    public var results: [T]
}
