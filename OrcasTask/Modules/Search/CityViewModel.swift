//
//  CityViewModel.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import Foundation

// MARK: - CityViewModel
class CityViewModel {
    var id: String
    var main: String
    var description: String
    var date: String

    init(_ item: ListResponse) {
        self.id = "#\(item.dt ?? 0)"
        self.main = item.weather?.first?.main ?? ""
        self.description = item.weather?.first?.weatherDescription ?? ""
        self.date = item.dtTxt ?? ""
    }
}

// MARK: - ResponseObject
struct ResponseModel: Codable {
    let cod: String?
    let cnt: Int?
    let list: [ListResponse]?
    let city: City?
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
    let population, timezone, sunrise, sunset: Double?
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double?
}

// MARK: - List
struct ListResponse: Codable {
    public let dt: Int?
    public let main: MainClass?
    public let weather: [Weather]?
    public let clouds: Clouds?
    public let wind: Wind?
    public let visibility, pop: Double?
    public let sys: Sys?
    public let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    public let all: Double?
}

// MARK: - MainClass
struct MainClass: Codable {
    public let temp, feelsLike, tempMin, tempMax: Double?
    public let pressure, seaLevel, grndLevel, humidity: Double?
    public let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Sys
struct Sys: Codable {
    public let pod: String?
}

// MARK: - Weather
struct Weather: Codable {
    public let id: Int?
    public let main: String?
    public let weatherDescription: String?
    public let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    public let speed: Double?
    public let deg: Double?
    public let gust: Double?
}
