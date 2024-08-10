//
//  ImageService.swift
//  peluios
//
//  Created by Alejandro Aliaga on 10/8/24.
//

import Foundation

class ImageService {
    func loadImageFromURL(_ urlString: String) async -> Data? {
        guard let url = URL(string: urlString) else {
            debugPrint("Invalid URL string.")
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
            return nil
        }

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)  else {
            return nil
        }

        return data
    }
}
