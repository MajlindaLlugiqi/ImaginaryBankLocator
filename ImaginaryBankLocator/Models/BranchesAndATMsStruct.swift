//
//  BranchesAndATMsClass.swift
//  ImaginaryBankLocator
//
//  Created by Majlinda Llugiqi on 2/17/19.
//  Copyright © 2019 Majlinda Llugiqi. All rights reserved.
//

import UIKit



//func toDectionary() -> [String: Any]{
//    return ["ID": self.ID, "MeasuringUnitName": self.measuringUnitName, "Number": self.number, "Ch": self.ch, "Del": self.del]
//}

struct Location: Codable {
    var lat: Double?
    var long: Double?
   
}
struct Working_hours: Codable {
    var day: Int?
    var start_hours: Int?
    var start_minutes: Int?
    var end_hours: Int?
    var end_minutes: Int?
}
 struct DataD: Codable{
    var id: Int?
    var name: String?
    var address: String?
    var phone: String?
    var email: String?
    var website: String?
    var type: String?
    var location: Location?
    var working_hours: [Working_hours]?
}
  struct DataResponse: Codable{
    var data: [DataD]?
}


//
//struct BranchesATMsResponse: Decodable {
//    var id: Int
//    var name: String
//    var address: String
//    var phone: String?
//    var email: String
//    var website: String
//    var type: String
//    var lat: Double
//    var long: Double
//    var day: Int?
//    var start_hours: Int?
//    var start_minutes: Int?
//    var end_hours: Int?
//    var end_minutes: Int?
//    
//    init(from decoder: Decoder) throws {
//        let rawResponse = try BranchesATMs(from: decoder)
//        
//        // Now you can pick items that are important to your data model,
//        // conveniently decoded into a Swift structure
////        id = rawResponse.data.id
////        name = rawResponse.data.name
////        address = rawResponse.data.address
////        phone = rawResponse.data.phone!
////        email = rawResponse.data.email
////        website = rawResponse.data.website
////        type = rawResponse.data.type
////        lat = rawResponse.data.location.lat
////        long = rawResponse.data.location.long
////       // if(rawResponse.data[0].workingHours != nil){
////        day = rawResponse.data.working_hours!.first!.day
////        start_hours = rawResponse.data.working_hours!.first!.start_hours
////        start_minutes = rawResponse.data.working_hours!.first!.start_minutes
////        end_hours = rawResponse.data.working_hours!.first!.end_hours
////        end_minutes = rawResponse.data.working_hours!.first!.end_minutes
////        }
////        else{
////            day = -1
////            start_hours = -1
////            start_minutes = -1
////            end_hours = -1
////            end_minutes = -1
////        }
////
//        
//   // }
//}
//
//
////
////
////
////struct BranchesAndATMs: Codable {
////    var id: UUID
////    var name: String!
////    var address: String!
////    var phone: String!
////    var email: String!
////    var website: String!
////    var type: String!
////    var location: [String: Double]!
////    //var workingHours:[WorkingHours]!
////
////
////    func toDectionary() -> [String: Any]{
////        return ["id": self.id, "name": self.name, "address": self.address, "phone": self.phone, "email": self.email,"website": self.website, "type": self.type, "location": self.location]//, "workingHours": self.workingHours]
////    }
////}
////
////struct WorkingHours{
////    var id: UUID
////    var name: String!
////    var address: String!
////    var phone: String!
////    var email: String!
////    var website: String!
////
////}
//
//
