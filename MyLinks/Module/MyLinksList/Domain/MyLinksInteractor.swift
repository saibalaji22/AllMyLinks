//
//  MyLinksInteractor.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation

protocol MyLinksInteractorProtocol{
    func execute()throws -> [LinkEntity]
}
class MyLinksInteractor: MyLinksInteractorProtocol{
    private let repo: MyLinksRepositoryProtocol
    init(repo: MyLinksRepositoryProtocol) {
        self.repo = repo
    }
    func execute()throws -> [LinkEntity] {
        return try self.repo.getAllLinks()
    }
}
