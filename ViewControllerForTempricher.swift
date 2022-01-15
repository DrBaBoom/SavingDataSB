//
//  ViewControllerForTempricher.swift
//  HomeWork14
//
//  Created by Yura on 13.01.2022.
//

import UIKit
import CoreData

class ViewControllerForTempricher: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableViewTempricher: UITableView!
    @IBOutlet weak var lblChosenCity: UILabel!
    @IBOutlet weak var lblCityTempricher: UILabel!
    
    let cityList = ["New York City", "Batumi", "Saint Petersburg"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TempricherCell") as! TempricherCell
        cell.lblCityName.text = cityList[indexPath.row]
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let x = UserDefaults.standard.string(forKey: "chosenCity") {
            lblChosenCity.text = x
        }
        
        if let y = UserDefaults.standard.string(forKey: "cityTemperature") {
            lblCityTempricher.text = y
        }
    
        
        tableViewTempricher.delegate = self
        tableViewTempricher.dataSource = self

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenCity = cityList[indexPath.row]
        loadCityInfo(city: chosenCity)
        lblChosenCity.text = chosenCity
        lblCityTempricher.text = "loading..."
        UserDefaults.standard.set(lblChosenCity.text, forKey: "chosenCity")
        UserDefaults.standard.set(lblCityTempricher.text, forKey: "cityTemperature")

    }

    
    func loadCityInfo(city: String) {
        let cityNameEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityNameEncoded)&units=metric&appid=996d791554973b962c1b114a21c9f9a2")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: afterDataReceived(d:url:er:))
        task.resume()
    }
    
    func afterDataReceived(d: Foundation.Data?, url: URLResponse?, er: Error?) {
        if let ddata = d, let json = try? JSONSerialization.jsonObject(with: ddata, options: .allowFragments), let dict = json as? NSDictionary {
            
            if let cityMainInfo = dict["main"] as? NSDictionary,
               let cityTemperature = cityMainInfo["temp"] as? Double {
                DispatchQueue.main.async {
                    let cityTemperatureC = Int(cityTemperature + 0.5)
                    let temperatureShow = "\(cityTemperatureC)°C"
                    UserDefaults.standard.set(temperatureShow, forKey: "cityTemperature")
                    self.lblCityTempricher.text = temperatureShow
                }
            }
        }
    }

}
