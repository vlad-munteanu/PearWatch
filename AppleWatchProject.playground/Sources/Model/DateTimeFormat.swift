import Foundation
import CoreLocation

public class DateTimeFormat{
   static let dates = ["SUN","MON","TUE", "WED", "THU", "FRI", "SAT"]
    
    public static func getNumDate() -> String{
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let day = components.day
        
        
        let currentDate = String(day!)
        return currentDate
    }
    
    public static func getTime() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        var hour = 0
        if (components.hour!) >= 13  {
            hour = (components.hour!)-12
        } else {
            hour = components.hour!
            
            if components.hour! == 0 {
                hour = 12
            }
        }
        
        let minute = components.minute!
        
        if minute < 10 {
            return  String(hour)  + ":" + "0" + String(minute)
        }
        return String(hour)  + ":" + String(minute)
    }
    
    public static func getHour() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh"
    
        return dateFormatter.string(from: Date())
    
    }
    
    public static func getMinute() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        
        let minute = components.minute!
        
        if minute < 10 {
            return  "0" + String(minute)
        }
        return String(minute)
    }
    
    
    public static func getDayOfWeek() -> String {
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        var today = String(components.year!) + "-" + String(components.month!) + "-" + String(components.day!)
        
        if(components.month! <= 10) {
             today = String(components.year!) + "-" + "0" + String(components.month!) + "-" + String(components.day!)
        }
    
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return "SUN" }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate) - 1
        return dates[weekDay]
    }
    
    public static func getTimeInNYC() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        
        let timeZone = TimeZone(identifier: "America/New_York")
        dateFormatter.timeZone = timeZone
        
        return dateFormatter.string(from: Date())
    }
    
    public static func getHourInNYC() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh"
        
        let timeZone = TimeZone(identifier: "America/New_York")
        dateFormatter.timeZone = timeZone
        
        return dateFormatter.string(from: Date())
    }
    
    public static func getMinuteInNYC() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        
        let timeZone = TimeZone(identifier: "America/New_York")
        dateFormatter.timeZone = timeZone
        
        return dateFormatter.string(from: Date())
    }
    
    public static func getHourInWorld(zone: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh"
        
        var timeZone = TimeZone(identifier: "America/New_York")
        if zone == "LosAngeles" {
            timeZone = TimeZone(identifier: "America/Los_Angeles")
        } else if zone == "Lima" {
            timeZone = TimeZone(identifier: "America/Lima")
        } else if zone == "ams" {
            timeZone = TimeZone(identifier: "Europe/Amsterdam")
        }
        dateFormatter.timeZone = timeZone
        
        return dateFormatter.string(from: Date())
    }
    
    public static func getMinuteInWorld(zone: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        
        var timeZone = TimeZone(identifier: "America/New_York")
        if zone == "LosAngeles" {
            timeZone = TimeZone(identifier: "America/Los_Angeles")
        } else if zone == "Lima" {
            timeZone = TimeZone(identifier: "America/Lima")
        } else if zone == "ams" {
            timeZone = TimeZone(identifier: "Europe/Amsterdam")
        }
        dateFormatter.timeZone = timeZone
        
        return dateFormatter.string(from: Date())
    }
    
    
    
    
    
    public static func getSunTime() -> String {
        
        return ""
    }
    
    public static func getGMTHour() -> String {
        let UTCDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        formatter.timeZone = TimeZone(identifier:"GMT")
        

        let defaultTimeZoneStr24 = formatter.string(from: UTCDate)
        
        return defaultTimeZoneStr24
        
    }
    
    public static func getTimeInternational(zone: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        var timeZone = TimeZone(identifier: "America/New_York")
        
        if zone == "LosAngeles" {
            timeZone = TimeZone(identifier: "America/Los_Angeles")
        } else if zone == "Lima" {
            timeZone = TimeZone(identifier: "America/Lima")
        } else if zone == "ams" {
            timeZone = TimeZone(identifier: "Europe/Amsterdam")
        }
        dateFormatter.timeZone = timeZone
        
        return dateFormatter.string(from: Date())
    }
    
    public static func getTimeDifference(zone: String) -> String {
        let cal = Calendar(identifier: .gregorian)
        let date = Date()
        var locale = TimeZone(identifier: "America/New_York")
        
        if zone == "LosAngeles" {
            locale = TimeZone(identifier: "America/Los_Angeles")
        } else if zone == "Lima" {
            locale = TimeZone(identifier: "America/Lima")
        } else if zone == "ams" {
            locale = TimeZone(identifier: "Europe/Amsterdam")
        } else if zone == "nyc" {
            locale = TimeZone(identifier: "America/New_York")
        }
        
        let comp = cal.dateComponents(in: locale!, from: date)
      
        
        if comp.hour! > 0 {
            return "+" + String(comp.hour!) + "HRS"
        } else if comp.hour! == 0{
            return "Today"
        } else {
            return "-" + String(comp.hour!) + "HRS"
        }
        
       
        
        return String(comp.hour!)
    }
    
    
    public static func sunrise() -> String {
        
        var localTimeZoneName: String { return TimeZone.current.identifier }
        let nycLat = 40.7522022
        let nycLong = -73.9325726
        
        let cupLat = 37.3229978
        let cupLong = -122.0321823
        let date = Date()
        
        
        var solar = Solar(for: date, coordinate: CLLocationCoordinate2D(latitude: cupLat, longitude: cupLong))
        
        if localTimeZoneName == "America/New_York" {
             solar = Solar(for: date, coordinate: CLLocationCoordinate2D(latitude: nycLat, longitude: nycLong))
        }
        
        let sunrise = solar!.sunrise
        let sunset = solar!.sunset
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        
     
        let isDaytime = solar!.isDaytime
       
        
        if isDaytime == true {
            return dateFormatter.string(from: sunset!)
        } else {
            return dateFormatter.string(from: sunrise!)
        }
    }
    
    
    public static func isSunRising() -> Bool {
        var localTimeZoneName: String { return TimeZone.current.identifier }
        let nycLat = 40.7522022
        let nycLong = -73.9325726
        
        let cupLat = 37.3229978
        let cupLong = -122.0321823
        let date = Date()
        
        
        var solar = Solar(for: date, coordinate: CLLocationCoordinate2D(latitude: cupLat, longitude: cupLong))
        
        if localTimeZoneName == "America/New_York" {
            solar = Solar(for: date, coordinate: CLLocationCoordinate2D(latitude: nycLat, longitude: nycLong))
        }
        
        let sunrise = solar!.sunrise
        let sunset = solar!.sunset
        
        let isDaytime = solar!.isDaytime
        
        if isDaytime == true {
            return false
        } else {
            return true
        }
    }
}
