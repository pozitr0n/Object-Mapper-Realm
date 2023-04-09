//
//  Employee.swift
//  ObjectMapperRealm-start
//
//  Created by Raman Kozar on 08.04.2023.
//

import Foundation
import RealmSwift
import ObjectMapper

class Employee: Object, Mappable, DBModel {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var occupation: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var mobile_phone: String = ""
    var addresses = List<Address>()
        
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
    static func urlAPI() -> String {
        return "https://private-3d4a9-realmbatch.apiary-mock.com/customers"
    }
    
    func mapping(map: ObjectMapper.Map) {
        
        id <- map["id"]
        name <- map["name"]
        occupation <- map["occupation"]
        email <- map["email"]
        mobile_phone <- map["mobile_phone"]
        
        let mapper_addresses = Mapper<Address>().mapArray(JSONObject: map["adresses"].currentValue)
        
        if let mapper_addresses = mapper_addresses {
            addresses.append(objectsIn: mapper_addresses)
        }
    
    }

}
