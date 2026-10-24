//
//  AddLinkRepositoryProtocol.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation

protocol AddLinkRepositoryProtocol{
    func addNewLink(linkData: LinkEntity)throws
}
