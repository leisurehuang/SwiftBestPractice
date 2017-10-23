//
//  ServiceClient.swift
//  BestPractice
//
//  Created by Lei Huang on 19/10/2017.
//  Copyright © 2017 leihuang. All rights reserved.
//

import Alamofire
import PromiseKit
typealias Promise = PromiseKit.Promise

protocol DataRequestPromise {
    func response() -> Promise<(URLRequest, HTTPURLResponse, Data)>
    func responseData() -> Promise<Data>
    func responseString() -> Promise<String>
    func responseVoid() -> Promise<Void>
    func responseJSON(options: JSONSerialization.ReadingOptions) -> Promise<Any>
    func responseJsonDictionary(options: JSONSerialization.ReadingOptions) -> Promise<[String: Any]>
}

extension DataRequestPromise {
    func responseJSON() -> Promise<Any> {
        return responseJSON(options: .allowFragments)
    }
    
    func responseVoid() -> Promise<Void> {
        return response().then {_ -> Void in }
    }
    
    func responseJsonDictionary() -> Promise<[String: Any]> {
        return responseJsonDictionary(options: .allowFragments)
    }
    
    func responseModel<T: Decodable>(type: T.Type) -> Promise<T> {
        return responseData()
            .then { (data) -> T in
                return try! JSONDecoder().decode(type, from: data)
        }
    }
}


extension Alamofire.DataRequest : DataRequestPromise {
    
}


let appServiceClient = ServiceClient(baseUrl: "http://10.205.22.250:3000/")


class ServiceClient {
    
    
    let baseURL: String
    
    init(baseUrl: String) {
        self.baseURL = baseUrl
    }
    
    func get(endpoint: String, parameters: Parameters? = nil) -> DataRequestPromise {
        return request(endpoint,
                       method: .get,
                       parameters: parameters)
    }
    
    func post(endpoint: String, parameters: Parameters? = nil) -> DataRequestPromise {
        return request(endpoint,
                       method: .post,
                       parameters: parameters,
                       encoding: JSONEncoding.default)
    }
    
    private func request(_ endpoint: String,
                         method: HTTPMethod,
                         parameters: Parameters? = nil,
                         encoding: ParameterEncoding = URLEncoding.default) -> DataRequestPromise {
        
        let acceptableStatusCodes = 200..<300
        let finalUrl = "\(baseURL)\(endpoint)"
        
        
        let defaultHeaders = [
            "Content-Type": "application/json",
           /* "Authorization": "YOUR TOKEN"*/
        ]
 
        
        print("request url: \(finalUrl)")
        
        return Alamofire
            .request(finalUrl, method: method, parameters: parameters, encoding: encoding, headers: defaultHeaders)
            .validate({ _, response, data in
                if acceptableStatusCodes.contains(response.statusCode) {
                    return .success
                } else {
                    if case 400..<500 = response.statusCode {
                        if let data = data, let dict = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                            let errorMessage = dict["message"] as! String
                            return .failure(self.errorWithMessage(errorMessage))
                        }
                    }
                    
                    let failureReason = "\n Http status code error : \(response.statusCode)"
                    return .failure(self.errorWithMessage(failureReason))
                }
            })
    }

    func errorWithMessage(_ message:String) -> NSError {
        let userInfo = [NSLocalizedFailureReasonErrorKey: message]
        return NSError(domain: "com.BestPractice.demo", code: -9999, userInfo: userInfo)
    }
}
