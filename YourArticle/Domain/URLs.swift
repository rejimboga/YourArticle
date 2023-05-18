//
//  URLs.swift
//  YourArticle
//
//  Created by Macbook Air on 15.05.2023.
//

import Foundation

final class URLs {
    enum NetworkError: LocalizedError {
        case invalidUrl
        case invalidData
        
        var errorDescription: String? {
            switch self {
            case .invalidUrl:
                return "Invalid url"
            case .invalidData:
                return "Invalid data"
            }
        }
    }

    struct Articles {
        private static let apiKey = "oCAGuozurMccTsm6psAK0J4ijKHynFxd"
        
        static func getUrl(period: Period, path: ArticlePath) throws -> URL {
            guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/\(path.path)/\(period.period).json?api-key=\(apiKey)")
            else { throw NetworkError.invalidUrl }
            
            return url
        }
        
        static func getImageErrorUrl() throws -> URL {
            guard let url = URL(string: "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png")
            else { throw NetworkError.invalidUrl }
            
            return url
        }
        
        enum ArticlePath {
            case viewed
            case shared
            case emailed
            
            var path: String {
                switch self {
                case .viewed:
                    return "viewed"
                case .shared:
                    return "shared"
                case .emailed:
                    return "emailed"
                }
            }
        }
        
        enum Period {
            case oneDay
            case sevenDays
            case thirtyDays
            
            var period: Int {
                switch self {
                case .oneDay:
                    return 1
                case .sevenDays:
                    return 7
                case .thirtyDays:
                    return 30
                }
            }
        }
        
        enum ErrorURL {
            case errorImage
            case errorLink
            
            var path: String {
                switch self {
                case .errorImage:
                    return "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png"
                case .errorLink:
                    return "https://vrgsoft.net"
                }
            }
        }
        
    }
}

