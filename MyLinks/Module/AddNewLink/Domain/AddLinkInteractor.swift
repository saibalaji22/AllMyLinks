//
//  AddLinkInteractor.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation

protocol AddLinkInteractorProtocol{
    func execute(linkData: LinkEntity) throws
}

class AddLinkInteractor: AddLinkInteractorProtocol{
    private let addLinkRepo: AddLinkRepositoryProtocol
    init(addLinkRepo: AddLinkRepositoryProtocol) {
        self.addLinkRepo = addLinkRepo
    }
    func execute(linkData: LinkEntity) throws {
        try self.addLinkRepo.addNewLink(linkData: linkData)
    }
}
