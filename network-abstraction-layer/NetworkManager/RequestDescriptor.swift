//
//  RequestDescriptor.swift
//  network-abstraction-layer
//
//  Created by Rishat Yakushev on 13/03/2019.
//  Copyright © 2019 Ришат Якушев. All rights reserved.
//

import Alamofire

public struct RequestDescriptor {
    public let path: String
    public let method: HTTPMethod
    public let params: Parameters
    public let encoding: ParameterEncoding
    
    public init(
        path: String,
        method: HTTPMethod,
        params: Parameters,
        encoding: ParameterEncoding
        ) {
        self.path = path
        self.method = method
        self.params = params
        self.encoding = encoding
    }
}
