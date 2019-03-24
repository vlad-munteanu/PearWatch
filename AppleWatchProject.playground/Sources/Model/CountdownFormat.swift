import Foundation


public class CountdownFormat{
    
    public static func daysUntilWWDC() -> Int {
        var wwdcDate: NSDate?
        let wwdcDateString = "2019-06-03 06:30:00"
        let wwdcDateFormatter = DateFormatter()
        wwdcDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        wwdcDate = wwdcDateFormatter.date(from: wwdcDateString)! as NSDate
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        let dateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: wwdcDate! as Date)
        
        return dateComponents.day ?? 0
    }
    
    public static func hoursUntilWWDC() -> Int {
        var wwdcDate: NSDate?
        let wwdcDateString = "2019-06-03 06:30:00"
        let wwdcDateFormatter = DateFormatter()
        wwdcDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        wwdcDate = wwdcDateFormatter.date(from: wwdcDateString)! as NSDate
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        let dateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: wwdcDate! as Date)
        
        return dateComponents.hour ?? 0
    }
    
    public static func minutesUntilWWDC() -> Int {
        var wwdcDate: NSDate?
        let wwdcDateString = "2019-06-03 06:30:00"
        let wwdcDateFormatter = DateFormatter()
        wwdcDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        wwdcDate = wwdcDateFormatter.date(from: wwdcDateString)! as NSDate
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        let dateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: wwdcDate! as Date)
        
        return dateComponents.minute ?? 0
    }
    
    public static func secondsUntilWWDC() -> Int {
        var wwdcDate: NSDate?
        let wwdcDateString = "2019-06-03 06:30:00"
        let wwdcDateFormatter = DateFormatter()
        wwdcDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        wwdcDate = wwdcDateFormatter.date(from: wwdcDateString)! as NSDate
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        let dateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: wwdcDate! as Date)

        return dateComponents.second ?? 0
    }
    
    
    
}
