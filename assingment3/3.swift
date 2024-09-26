import Foundation
//Temperature Converter

func CelsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

func CelsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15
}

func FahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

func FahrenheitToKelvin(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9 + 273.15
}

func KelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}

func KelvinToFahrenheit(_ kelvin: Double) -> Double {
    return (kelvin - 273.15) * 9/5 + 32
}

func convertTemperature(){
    print("Enter the temperature value:")
    guard let input = readLine(), let temperature = Double(input) else{
        print("Please enter a valid number.")
        return
    }
    
    print("Enter the unit of temperature:")
    guard let unit = readLine() else {
        print("Enter a valid unit: K, F, C")
        return
    }
    
    switch unit {
        case "C":
            let fahrenheit = CelsiusToFahrenheit(temperature)
            let kelvin = CelsiusToKelvin(temperature)
            print("\(temperature)°C is \(fahrenheit)°F and \(kelvin)K")
            
        case "F":
            let celsius = FahrenheitToCelsius(temperature)
            let kelvin = FahrenheitToKelvin(temperature)
            print("\(temperature)°F is \(celsius)°C and \(kelvin)K")
            
        case "K":
            let celsius = KelvinToCelsius(temperature)
            let fahrenheit = KelvinToFahrenheit(temperature)
            print("\(temperature)K is \(celsius)°C and \(fahrenheit)°F")
            
        default:
            print("Invalid unit. Please enter C, F, or K.")
        }
}
convertTemperature();
