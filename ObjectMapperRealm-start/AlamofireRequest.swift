//
//  Request.swift
//  ObjectMapperRealm-start
//
//  Created by Raman Kozar on 08.04.2023.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

class Request {
    
    static func getData<T: Object>(type: T.Type, success: @escaping() -> Void, fail: @escaping(_ error: NSError) -> Void)
    where T: Mappable, T:DBModel {
        
        AF.request(type.urlAPI()).responseArray {
            (response: AFDataResponse<[T]>) in
            
            switch response.result {
            case .success(let items):
                do {
                    let realm = try Realm()
                    try realm.write {
                        for item in items {
                            realm.add(item, update: .all)
                        }
                    }
                    success()
                    
                } catch let error as NSError {
                    fail(error)
                }
                
            case .failure(let error):
                fail(error as NSError)
            }
            
        }
        
    }
    
}
