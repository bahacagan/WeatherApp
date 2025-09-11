//
//  WeatherCodeEnum.swift
//  WeatherApp
//
//  Created by Çağan  on 11.09.2025.
//

import Foundation



import Foundation

enum WeatherCode: Int, Codable {
    case clearSky = 0
    case mainlyClear = 1
    case partlyCloudy = 2
    case overcast = 3
    
    case fog = 45
    case depositingRimeFog = 48
    
    case lightDrizzle = 51
    case moderateDrizzle = 53
    case denseDrizzle = 55
    
    case lightFreezingDrizzle = 56
    case denseFreezingDrizzle = 57
    
    case slightRain = 61
    case moderateRain = 63
    case heavyRain = 65
    
    case lightFreezingRain = 66
    case heavyFreezingRain = 67
    
    case slightSnowFall = 71
    case moderateSnowFall = 73
    case heavySnowFall = 75
    
    case snowGrains = 77
    
    case slightRainShowers = 80
    case moderateRainShowers = 81
    case violentRainShowers = 82
    
    case slightSnowShowers = 85
    case heavySnowShowers = 86
    
    case thunderstorm = 95
    case thunderstormWithSlightHail = 96
    case thunderstormWithHeavyHail = 99
    
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Int.self)
        self = WeatherCode(rawValue: value) ?? .unknown
    }
    
    var description: String {
        switch self {
        case .clearSky: return "Clear sky"
        case .mainlyClear: return "Mainly clear"
        case .partlyCloudy: return "Partly cloudy"
        case .overcast: return "Overcast"
        case .fog, .depositingRimeFog: return "Fog"
        case .lightDrizzle, .moderateDrizzle, .denseDrizzle: return "Drizzle"
        case .lightFreezingDrizzle, .denseFreezingDrizzle: return "Freezing drizzle"
        case .slightRain, .moderateRain, .heavyRain: return "Rain"
        case .lightFreezingRain, .heavyFreezingRain: return "Freezing rain"
        case .slightSnowFall, .moderateSnowFall, .heavySnowFall, .snowGrains: return "Snow"
        case .slightRainShowers, .moderateRainShowers, .violentRainShowers: return "Rain showers"
        case .slightSnowShowers, .heavySnowShowers: return "Snow showers"
        case .thunderstorm, .thunderstormWithSlightHail, .thunderstormWithHeavyHail: return "Thunderstorm"
        case .unknown: return "Unknown"
        }
    }
    
    func sfSymbolName(isDay: Bool) -> String {
        switch self {
        case .clearSky:
            return isDay ? "sun.max" : "moon.stars"
        case .mainlyClear, .partlyCloudy:
            return isDay ? "cloud.sun" : "cloud.moon"
        case .overcast:
            return "cloud"
        case .fog, .depositingRimeFog:
            return "cloud.fog"
        case .lightDrizzle, .moderateDrizzle, .denseDrizzle:
            return "cloud.drizzle"
        case .lightFreezingDrizzle, .denseFreezingDrizzle:
            return "cloud.sleet"
        case .slightRain, .moderateRain:
            return "cloud.rain"
        case .heavyRain:
            return "cloud.heavyrain"
        case .lightFreezingRain, .heavyFreezingRain:
            return "cloud.sleet"
        case .slightSnowFall, .moderateSnowFall, .heavySnowFall, .snowGrains:
            return "cloud.snow"
        case .slightRainShowers, .moderateRainShowers, .violentRainShowers:
            return "cloud.heavyrain"
        case .slightSnowShowers, .heavySnowShowers:
            return "cloud.snow"
        case .thunderstorm:
            return "cloud.bolt.rain"
        case .thunderstormWithSlightHail, .thunderstormWithHeavyHail:
            return "cloud.hail"
        case .unknown:
            return "questionmark"
        }
    }
}



