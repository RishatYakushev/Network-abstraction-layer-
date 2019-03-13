//
//  DataRequest.swift
//  network-abstraction-layer
//
//  Created by Rishat Yakushev on 13/03/2019.
//  Copyright © 2019 Ришат Якушев. All rights reserved.
//

import Foundation
import Alamofire

public extension DataRequest {
    
    public static func responseSerializer(
        options: JSONSerialization.ReadingOptions = .allowFragments)
        -> DataResponseSerializer<Data>
    {
        return DataResponseSerializer { _, response, data, error in
            
            guard let validData = data, validData.count > 0 else {
                return .failure(NetworkError.invalidJSON)
            }
            
            
            let statusCode = response?.statusCode ?? 0
            if statusCode == NetworkConstants.unauthorizeCode {
                return .failure(NetworkError.unauthorized)
            }
            
            guard NetworkConstants.successCodes.contains(statusCode) else {
                return .failure(NetworkError.invalidError)
            }
            
            return .success(validData)
        }
    }
    
    @discardableResult
    func baseResponseJSON(
        queue: DispatchQueue? = nil,
        options: JSONSerialization.ReadingOptions = .allowFragments,
        completionHandler: @escaping (DataResponse<Data>) -> Void)
        -> Self
    {
        return response(
            queue: queue,
            responseSerializer: DataRequest.responseSerializer(options: options),
            completionHandler: completionHandler
        )
    }
}
