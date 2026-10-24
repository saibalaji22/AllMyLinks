//
//  MyLinksRepositoryProtocol.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation

protocol MyLinksRepositoryProtocol{
    func getAllLinks()throws -> [LinkEntity]
}
