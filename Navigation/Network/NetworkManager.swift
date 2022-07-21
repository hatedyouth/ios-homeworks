//
//  File.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 14.07.2022.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    static var title = "TEST"
    static var orbitalPeriod = "TEST"
    static var namesArray: [String] = []
    
    func getData(url: String) {
        
        guard let URL = URL(string: url) else { return }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL) { data, responce, error in
            
            guard let data = data, let responce = responce as? HTTPURLResponse else {
                guard let error = error else { return }
                print("WI-FI error - \(error.localizedDescription)")
                return }
            
            print(String(decoding: data, as: UTF8.self))
            print("allHeaderFields - \(responce.allHeaderFields)")
            print("statusCode - \(responce.statusCode)")
            
        }.resume()
    }
    func getJson() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
            print("не удалось получить URL")
            return }

        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, responce, error in
            guard let data = data else { return }
            do {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                    
                    guard let title = json["title"] as? String else { return }
                    NetworkManager.title = title
                    
                } else {
                    print("Не удалось сериализовать")
                }
            }
        }.resume()
    }
    func getJsonTatuin() {
        
        guard let url = URL(string: "https://swapi.dev/api/planets/1") else {
            print("не удалось получить URL")
            return }

        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, responce, error in
            guard let data = data else { return }
            do {
                if let json = try? JSONDecoder().decode(PlanetModel.self, from: data) {
                    NetworkManager.orbitalPeriod = json.orbitalPeriod
                } else {
                    print("Не удалось сериализовать")
                }
            }
        }.resume()
    }
    func getNamesArray() {
        
        guard let url = URL(string: "https://swapi.dev/api/planets/1") else {
            print("не удалось получить URL")
            return }

        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, responce, error in
            guard let data = data else { return }
            do {
                if let json = try? JSONDecoder().decode(PlanetModel.self, from: data) {
                    let peopleArray = json.residents
                    
                    for people in peopleArray {
                        getNames(url: people)
                    }
                    
                } else {
                    print("Не удалось сериализовать")
                }
            }
        }.resume()
        
    }
    func getNames(url: String) {
        guard let url = URL(string: url) else {
            print("не удалось получить URL")
            return }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, responce, error in
            guard let data = data else { return }
            do {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                    
                    guard let name = json["name"] as? String else { return }
                    NetworkManager.namesArray.append(name)
                } else {
                    print("Не удалось сериализовать")
                }
            }
        }.resume()
        
    }



}
