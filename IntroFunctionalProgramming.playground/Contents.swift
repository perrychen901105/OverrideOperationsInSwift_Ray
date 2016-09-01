//: Playground - noun: a place where people can play

import UIKit
import Foundation

enum RideType {
    case Family
    case Kids
    case Thrill
    case Scary
    case Relaxing
    case Water
}

struct Ride {
    let name: String
    let types: Set<RideType>
    let waitTime: Double
}

var x = 3
// other stuff
x = 4

let parkRides = [
    Ride(name: "Raging Rapids", types: [.Family, .Thrill, .Water], waitTime: 45.0),
    Ride(name: "Crazy Funhouse", types: [.Family], waitTime: 10.0),
    Ride(name: "Spinning Tea Cups", types: [.Kids], waitTime: 15.0),
    Ride(name: "Spooky Hollow", types: [.Scary], waitTime: 30.0),
    Ride(name: "Thunder Coaster", types: [.Family, .Thrill], waitTime: 60.0),
    Ride(name: "Grand Carousel", types: [.Family, .Kids], waitTime: 15.0),
    Ride(name: "Bumper Boats", types: [.Family, .Water], waitTime: 25.0),
    Ride(name: "Mountain Railroad", types: [.Family, .Relaxing], waitTime: 0.0)
]

func sortedNames(rides: [Ride]) -> [String] {
    var sortedRides = rides
    var i, j : Int
    var key: Ride
    
    // 1
    for (i = 0; i < sortedRides.count; i++) {
        key = sortedRides[i]
        
        // 2
        for (j = i; j > -1; j--) {
            if key.name.localizedCompare(sortedRides[j].name) == .OrderedAscending {
                sortedRides.removeAtIndex(j + 1)
                sortedRides.insert(key, atIndex: j)
            }
        }
    }
    
    // 3
    var sortedNames = [String]()
    for ride in sortedRides {
        sortedNames.append(ride.name)
    }
    
    print(sortedRides)
    
    return sortedNames
}

print(sortedNames(parkRides))

var originalNames = [String]()
for ride in parkRides {
    originalNames.append(ride.name)
}

print(originalNames)

func waitTimeIsShort(ride: Ride) -> Bool {
    return ride.waitTime < 15.0
}

var shortWaitTimeRides = parkRides.filter(waitTimeIsShort)
print(shortWaitTimeRides)

let rideNames = parkRides.map{ $0.name }
print(rideNames.sort(<))

let averageWaitTime = parkRides.reduce(0.0) { (average, ride) in
    average + ride.waitTime/Double(parkRides.count)
}
print(averageWaitTime)

func rideTypeFilter(type: RideType)(fromRides rides: [Ride]) -> [Ride] {
    return rides.filter{ $0.types.contains(type) }
}

func createRideTypeFilter(type: RideType) -> [Ride] -> [Ride] {
    return rideTypeFilter(type)
}

let kidRideFilter = createRideTypeFilter(.Kids)
print(kidRideFilter(parkRides))







