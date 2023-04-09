//
//  Address.swift
//  ObjectMapperRealm-start
//
//  Created by Raman Kozar on 08.04.2023.
//

import Foundation
import RealmSwift
import ObjectMapper

class Address: Object, Mappable {
   
    @objc dynamic var id: Int = 0
    @objc dynamic var address: String = ""
    @objc dynamic var supplement: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var state: String = ""
    @objc dynamic var phone: String = ""
        
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        
        id <- map["id"]
        address <- map["address"]
        supplement <- map["supplement"]
        city <- map["city"]
        state <- map["state"]
        phone <- map["phone"]
        
    }
    
}
