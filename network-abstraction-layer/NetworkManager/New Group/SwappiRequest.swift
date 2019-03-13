//
//  SwappiNetworkRequest.swift
//  NetworkForRishat
//
//  Created by Позднышев Максим on 12/03/2019.
//  Copyright © 2019 Позднышев Максим. All rights reserved.
//

import Alamofire
import Foundation

public class SwappiRequest: NetworkingRequest {
    public typealias ResponseType = EmptyCodable
    
    init(){}
    
    public func getRequestDescriptor() -> RequestDescriptor {
        return RequestDescriptor(
            path: "people/1/",
            method: .get,
            params: [:],
            encoding: URLEncoding.default
        )
    }
}

public struct EmptyCodable: Codable {
    let birthYear: String?
    let created: String?
    let edited : String?
    let eyeColor : String?
    let films : [String]?
    let gender : String?
    let hairColor : String?
    let height : String?
    let homeworld : String?
    let mass : String?
    let name : String?
    let skinColor : String?
    let species : [String]?
    let starships : [String]?
    let url : String?
    let vehicles : [String]?
    
    enum CodingKeys: String, CodingKey {
        case birthYear = "birth_year"
        case created = "created"
        case edited = "edited"
        case eyeColor = "eye_color"
        case films = "films"
        case gender = "gender"
        case hairColor = "hair_color"
        case height = "height"
        case homeworld = "homeworld"
        case mass = "mass"
        case name = "name"
        case skinColor = "skin_color"
        case species = "species"
        case starships = "starships"
        case url = "url"
        case vehicles = "vehicles"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        birthYear = try values.decodeIfPresent(String.self, forKey: .birthYear)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        edited = try values.decodeIfPresent(String.self, forKey: .edited)
        eyeColor = try values.decodeIfPresent(String.self, forKey: .eyeColor)
        films = try values.decodeIfPresent([String].self, forKey: .films)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        hairColor = try values.decodeIfPresent(String.self, forKey: .hairColor)
        height = try values.decodeIfPresent(String.self, forKey: .height)
        homeworld = try values.decodeIfPresent(String.self, forKey: .homeworld)
        mass = try values.decodeIfPresent(String.self, forKey: .mass)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        skinColor = try values.decodeIfPresent(String.self, forKey: .skinColor)
        species = try values.decodeIfPresent([String].self, forKey: .species)
        starships = try values.decodeIfPresent([String].self, forKey: .starships)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        vehicles = try values.decodeIfPresent([String].self, forKey: .vehicles)
    }
}

