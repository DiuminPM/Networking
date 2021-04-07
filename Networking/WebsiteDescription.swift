//
//  WebsiteDescription.swift
//  Networking
//
//  Created by DiuminPM on 07.04.2021.
//

import Foundation
struct WebsiteDescription: Decodable {
    let websiteDescription: String
    let websiteName: String
    let courses: [Course]
}
