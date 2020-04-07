//
//  WeatherData.swift
//  Clima
//
//  Created by Duy Le on 4/6/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

//our struct must conform to the Decodable protocol, which means our data can decode itself from an external source (JSON)
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    //property names must match properties' names in JSON precisely
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}
