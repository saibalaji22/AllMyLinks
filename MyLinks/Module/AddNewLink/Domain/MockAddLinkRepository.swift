//
//  MockAddLinkRepository.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation
import CoreData


class MockAddLinkRepository: AddLinkRepositoryProtocol{
    private let persistenceController: PersistenceController
    var errorToThrow: NSError?
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    func addNewLink(linkData: LinkEntity) throws {
        if let errorToThrow{
            throw errorToThrow
        }
        let link = Link(context: self.persistenceController.persistenceContainer.viewContext)
        link.name = linkData.name
        link.createdDate = linkData.createdDate
        link.url = linkData.url
        link.createdDate = linkData.createdDate
        link.shareCount = Int64(linkData.shareCount)
        link.thumbnailImage = linkData.thumbnailData
        try self.persistenceController.save()
    }
}
