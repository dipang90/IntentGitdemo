//
//  RepositoryViewModel.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/14/21.
//

import Foundation

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
