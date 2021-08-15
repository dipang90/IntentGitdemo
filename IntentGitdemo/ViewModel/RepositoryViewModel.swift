//
//  RepositoryViewModel.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/14/21.
//

import Foundation

/*
 RepositoryViewModel is a ViewModel class where only business logic where implemented.
 RepositoryViewModel is called RepositoryResource class.
 Using a RepositoryViewModelDelegate Response will be sent to view class either response or error message
 The completion handler has returned the response and error message
 */

protocol RepositoryViewModelDelegate {
    func didReceiveRepositoryResponse(repositoryResponse: RepositoryResponse?, errorMessage : String?)
}

struct RepositoryViewModel {
    
    var delegate : RepositoryViewModelDelegate?

    func creatorProfile(requestString : String)
    {
        let repositoryResource = RepositoryResource()
        repositoryResource.getRepository(requestString: requestString) { (response, errorMessage) in
            self.delegate?.didReceiveRepositoryResponse(repositoryResponse: response, errorMessage: errorMessage)
        }
    }
}
