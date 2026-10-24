//
//  AddLinkRepositroy.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation
import CoreData

class AddLinkRepositroy: AddLinkRepositoryProtocol{
    private let persistenceController: PersistenceController
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    func addNewLink(linkData: LinkEntity)throws {
        var link = Link(context: persistenceController.persistenceContainer.viewContext)
        link.name = linkData.name
        link.createdDate = linkData.createdDate
        link.thumbnailImage = linkData.thumbnailData
        link.url = linkData.url
        link.shareCount = Int64(linkData.shareCount)
        try persistenceController.save()
    }
}
