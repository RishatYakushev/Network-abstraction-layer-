//
//  SwappiNetworking.swift
//  NetworkForRishat
//
//  Created by Rishat Yakushev on 12/03/2019.
//  Copyright © 2019 Rishat Yakushev. All rights reserved.
//

import PromiseKit

public protocol SwappiNetworking {
    func getPeople() -> Promise<EmptyCodable>
}

public class SwappiNetworkingImp {
    private let networking: NetworkingGateway
    
    public init(networking: NetworkingGateway) {
        self.networking = networking
    }
}

extension SwappiNetworkingImp: SwappiNetworking {
    public func getPeople() -> Promise<EmptyCodable> {
        return networking.json(SwappiRequest())
    }
}
