//
//  NetworkGateway.swift
//  network-abstraction-layer
//
//  Created by Rishat Yakushev on 13/03/2019.
//  Copyright © 2019 Ришат Якушев. All rights reserved.
//

import Alamofire
import PromiseKit

enum UploadType: String {
    case file
}

enum UploadMimeType: String {
    case jpeg = "image/jpeg"
}

public protocol NetworkingGateway {
    func json<T: NetworkingRequest>(_ request: T) -> Promise<T.ResponseType>
    func data<T: NetworkingRequest>(_ request: T) -> Promise<Data>
}
