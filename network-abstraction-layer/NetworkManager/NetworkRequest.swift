//
//  NetworkRequest.swift
//  network-abstraction-layer
//
//  Created by Rishat Yakushev on 13/03/2019.
//  Copyright © 2019 Ришат Якушев. All rights reserved.
//

import Foundation

public protocol NetworkingRequest {
    associatedtype ResponseType: Decodable
    func getRequestDescriptor() -> RequestDescriptor
}

public protocol UploadNetworkingRequest: NetworkingRequest {
    var uploadData: Data { get }
    var path: String { get }
}
