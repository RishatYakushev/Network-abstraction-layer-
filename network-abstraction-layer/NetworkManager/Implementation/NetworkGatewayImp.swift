//
//  NetworkGatewayImp.swift
//  network-abstraction-layer
//
//  Created by Rishat Yakushev on 13/03/2019.
//  Copyright © 2019 Ришат Якушев. All rights reserved.
//

import Alamofire
import PromiseKit

public class NetworkingGatewayImp {
    private let sessionManager: SessionManager
    private let baseUrl: URL
    private let prefix: String
    private let decoder: JSONDecoder = .init()
    private let adapters: [NetworkingAdapter]
    
    private let queue: DispatchQueue = .init(
        label: String(describing: NetworkingGateway.self),
        qos: .background
    )
    
    public init(
        sessionManager: SessionManager,
        baseUrl: URL,
        prefix: String,
        adapters: [NetworkingAdapter]
        ) {
        self.sessionManager = sessionManager
        self.baseUrl = baseUrl
        self.prefix = prefix
        self.adapters = adapters
    }
    
    private func createUrlRequest<T: NetworkingRequest>(_ request: T) throws -> URLRequest {
        let requestDescriptor = request.getRequestDescriptor()
        let url = baseUrl
            .appendingPathComponent(prefix)
            .appendingPathComponent(requestDescriptor.path)
        var urlRequest = try URLRequest(url: url, method: requestDescriptor.method)
        urlRequest = try applyAdapter(urlRequest, requestDescriptor: requestDescriptor)
        return try requestDescriptor.encoding.encode(urlRequest, with: requestDescriptor.params)
    }
    
    private func applyAdapter(
        _ urlRequest: URLRequest,
        requestDescriptor: RequestDescriptor
        ) throws -> URLRequest {
        var urlRequest = urlRequest
        
        adapters.forEach { adapter in
            let headers = adapter.header(descriptor: requestDescriptor)
            headers.forEach { key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return urlRequest
    }
}

extension NetworkingGatewayImp: NetworkingGateway {
    public func json<T: NetworkingRequest>(_ request: T) -> Promise<T.ResponseType> {
        return data(request)
            .map { [decoder] data in
                try decoder.decode(T.ResponseType.self, from: data)
            }
    }
    
    public func data<T: NetworkingRequest>(_ request: T) -> Promise<Data> {
        return Promise { seal in
            do {
                let urlRequest = try self.createUrlRequest(request)
                Alamofire
                    .request(urlRequest)
                    .baseResponseJSON(completionHandler: { (response) in
                        switch response.result {
                        case .success(let responseData):
                            seal.fulfill(responseData)
                        case .failure(let error):
                            seal.reject(error)
                        }
                    })
            } catch {
                seal.reject(error)
            }
        }
    }
}
