//
//  KatamerosAPI.swift
//  Natega
//
//  Created by Nikola Veljanovski on 17.12.22.
//

import Foundation
import Combine

protocol KatamerosAPIType {
    func getFeastInfo() -> AnyPublisher<FeastModel, Error>
}

struct KatamerosAPI: KatamerosAPIType {
    private var cancellables = Set<AnyCancellable>()
        
    func getFeastInfo() -> AnyPublisher<FeastModel, Error> {
        let url = constructURL()
        let publisher = URLSession.shared.dataTaskPublisher(for: url!)
        return publisher
            .map(\.data)
            .replaceError(with: Data())
            .decode(type: FeastModel.self, decoder: JSONDecoder())
            .print()
            .eraseToAnyPublisher()
    }
    
    // MARK: - Helpers
    private func constructURL() -> URL? {
        let date = Date()
        var components = URLComponents()
        components.scheme = "https"
        components.host = "katameros.azurewebsites.net"
        components.path = "/readings/gregorian/\(date.formattedDateForAPI)"
        components.queryItems = [URLQueryItem(name: "languageId", value: "2")]
        return components.url
    }
}
