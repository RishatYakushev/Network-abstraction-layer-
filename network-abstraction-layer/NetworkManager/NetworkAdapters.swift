//
//  NetworkAdapters.swift
//  network-abstraction-layer
//
//  Created by Rishat Yakushev on 13/03/2019.
//  Copyright © 2019 Ришат Якушев. All rights reserved.
//

import Foundation

public protocol NetworkingAdapter {
    func header(descriptor: RequestDescriptor) -> [String: String]
}
