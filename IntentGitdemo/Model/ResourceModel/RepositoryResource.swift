//
//  RepositoryResource.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/14/21.
//

import Foundation

struct RepositoryResource
{
    func getRepository(requestString : String, completion : @escaping (_ result: RepositoryResponse?, _ errorMessage : String?) -> Void)
    {
        let httpUtility = HttpUtility()
        httpUtility.removeRequestSession()
        httpUtility.getApiData(requestName: requestString, resultType: RepositoryResponse.self) { (response, errorMessage) in
            completion(response,errorMessage)
        }
    }
}
