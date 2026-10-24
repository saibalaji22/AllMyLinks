//
//  MyLinksRepository.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation

class MyLinksRepository: MyLinksRepositoryProtocol{
    private let persistenceService: PersistenceController
    init(persistenceService: PersistenceController) {
        self.persistenceService = persistenceService
    }
    func getAllLinks()throws -> [LinkEntity] {
        let allLinks: [Link] = try persistenceService.fetchAllData(entityName: "Link")
        let mappedLinks: [LinkEntity] = allLinks.map({ LinkEntity(name: $0.name ?? "", url: $0.url ?? "", thumbnailData: $0.thumbnailImage ?? Data(), createdDate: $0.createdDate ?? Date(), shareCount: Int($0.shareCount))})
        return mappedLinks
    }
}
