//
//  MockMyLinkRepository.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation
import CoreData
class MockMyLinkRepository: MyLinksRepositoryProtocol{
    private let persistenceService: PersistenceController
    var errorToThrow: NSError?
    init(persistenceService: PersistenceController) {
        self.persistenceService = persistenceService
    }
    func getAllLinks() throws -> [LinkEntity] {
        if let errorToThrow{
            throw errorToThrow
        }
        let allLinks: [Link] = try self.persistenceService.fetchAllData(entityName: "Link")
        let mappedAllLinks: [LinkEntity] = allLinks.map({LinkEntity(name: $0.name ?? "N/A", url: $0.url ?? "", thumbnailData: $0.thumbnailImage ?? Data(), createdDate: $0.createdDate ?? Date(), shareCount: Int($0.shareCount))})
        return mappedAllLinks
    }
}
