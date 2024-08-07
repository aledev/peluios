//
//  SwapiNetworkService.swift
//  peluios
//
//  Created by Alejandro Aliaga on 7/27/24.
//

import Foundation

class SwapiNetworkService {
    func loadData(id: String) async -> CharacterModel? {
        // Crear URL completa incluyendo el id del parámetro
        guard let url = URL(string: "https://swapi.dev/api/people/\(id)") else {
            return nil
        }

        // Hacer llamado get al endpoint
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
            return nil
        }

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            return nil
        }

        guard let jsonData = try? JSONDecoder().decode(CharacterModel.self, from: data) else {
            return nil
        }

        return jsonData
    }
    
    
    func loadVehiculeData(vehicleUrl: String) async -> VehiculeModel? {
        guard let url = URL(string: vehicleUrl) else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
            return nil
        }

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            return nil
        }
        
        guard let jsonData = try? JSONDecoder().decode(VehiculeModel.self, from: data) else {
            return nil
        }

        return jsonData
    }
    
}
