//
//  WeatherManager.swift
//  Clima
//
//  Created by Duy Le on 4/5/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    //must add s to http, otherwise will encounter error code= -1022 App Transport Security
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=090f1f4ff03710765dbfe2dbc13f6b68&units=imperial"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        // to add San%20Jose modify the code
        performRequest(urlString: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        print(urlString)
    }
    
    func performRequest(urlString: String){
        //Perform 4 steps of networking
        //1. Create a URL (optional) -> use if let
        if let url = URL(string: urlString){
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default) // like a browser
            
            //3.Give the session a task
            //we leave it to the task to trigger the handle method, but once it does, then we'll have access to
            //the data response and error object that it sends us
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    //Bug: Call to method 'parseJSON' in closure requires explicit 'self.'
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            //4. Start the task
            task.resume()
        }

    }
    
    func parseJSON(weatherData: Data){
        //first, inform our compiler how our data is structured
        let decoder = JSONDecoder()
        do{
        //to specify the WeatherData type, rather than the WeatherData object, we have to add .self to reference the type
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
        //Call can throw, but it is not marked with 'try' and the error is not handled
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print( weather.temperatureString)
            
        } catch {
            print(error)
        }
    }

}
