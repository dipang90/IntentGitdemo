//
//  HttpUtility.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/14/21.
//

import Foundation

struct HttpUtility {
    

    func httpStatusCodeError(statusCode : Int) -> (String, String) {
        switch statusCode {
        case 400:
            return ("Bad Request", "The request was invalid")
        case 401:
            return ("Unauthorized", "You have entered wrong credentials")
        case 404:
            return ("Not Found", "The requested resource was not found")
        case 405:
            return ("Method Not Allowed", "The HTTP method in the request was not supported by the resource")
        case 409:
            return ("Conflict", "The request could not be completed due to a conflict")
        case 500:
            return ("Internal Server Error", "The request was not completed due to an internal error on the server side")
        case 509:
            return ("Service Unavailable", "The server was unavailable")
        default:
            return ("Error", "Something went wrong")
        }
    }
    
    func removeRequestSession() {
        URLSession.shared.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach {
                $0.cancel()
            }
        }
    }
    
    func getApiData<T:Decodable>(requestName: String, resultType: T.Type, completionHandler:@escaping(_ result: T?, _ errorMessage : String?)-> Void) {
        
        var request = URLRequest(url: HttpUtilityResource.urls(requestName))
        request.httpMethod = "get"
        
        URLSession.shared.dataTask(with: request) { (responseData, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                
                if error == nil {
                    
                    if (httpResponse.statusCode == 200 || httpResponse.statusCode == 201) {
                        if(responseData != nil && responseData?.count != 0) {
                            let decoder = JSONDecoder()
                            do {
                                let result = try decoder.decode(T.self, from: responseData!)
                                completionHandler(result, nil)
                            }
                            catch let error{
                                debugPrint("error occured while decoding = \(error.localizedDescription)")
                                completionHandler(nil,error.localizedDescription)
                            }
                        } else {
                            completionHandler(nil, error?.localizedDescription)
                        }
                    } else {
                        let message = self.httpStatusCodeError(statusCode: httpResponse.statusCode)
                        completionHandler(nil,message.1)
                    }
                    return
                }
            }
            completionHandler(nil,error?.localizedDescription)
        }.resume()
    }
}
