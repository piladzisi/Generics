import Foundation

struct Weather
{
    let temperature: Double, humidity: Double, chanceOfRain: Double,
    
    icon: String,
    
    highTemperature: Double, lowTemperature: Double,
    
    sunrise: Date, sunset: Date
}

let current = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04,
                      
                      icon: "Cloudy",
                      
                      highTemperature: 67, lowTemperature: 50,
                      
                      sunrise: Date(), sunset: Date())

print(current)

protocol PrettyPrintable { var prettyDescription: String { get } }

extension Weather: PrettyPrintable
{
    var prettyDescription: String
    {                                                                                                                   return
        "Temperature: \(temperature)\nHumidity: \(humidity)\nChance of Rain: \(chanceOfRain)\nIcon: \(icon)\nHigh Temperature: \(highTemperature)\nLow Temperature: \(lowTemperature)\nSunrise time: \(sunrise)\nSunset time: \(sunset)"
    }
}

print(current.prettyDescription)

let tuesday = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04,
                      
                      icon: "Cloudy",
                      
                      highTemperature: 67, lowTemperature: 50,
                      
                      sunrise: Date(), sunset: Date())
let wednesday = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04,
                        
                        icon: "Cloudy",
                        
                        highTemperature: 67, lowTemperature: 50,
                        
                        sunrise: Date(), sunset: Date())
let thursday = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04,
                       
                       icon: "Cloudy",
                       
                       highTemperature: 67, lowTemperature: 50,
                       
                       sunrise: Date(), sunset: Date())

let week =
    [
        current,
        
        tuesday,
        wednesday,
        thursday
]

for day in week {print(day.prettyDescription)}

//extension Array where Element: PrettyPrintable
//{
//    var prettyDescription: String
//    {var
//                                                    output = ""
//        for (index, element) in self.enumerated(){  output += "\n\n*********\n\nIndex:\(index)\n\n\(element.prettyDescription)"}
//                                            return  output
//    }
//}
//print(week.prettyDescription)

let array = [1,2]

extension Sequence where Iterator.Element == Weather
{
    var prettyDescription: String
    {       var
        output = ""
        for (index, element) in self.enumerated(){  output += "\n\n*********\n\nIndex:\(index)\n\n\(element.prettyDescription)"}
        return  output
    }
}

print(week.prettyDescription)

dump(current)

