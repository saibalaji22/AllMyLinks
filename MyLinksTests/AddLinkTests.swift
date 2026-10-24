//
//  MyLinksTests.swift
//  MyLinksTests
//
//  Created by Sai Balaji on 24/10/26.
//

import XCTest
@testable import MyLinks


@MainActor
class AddLinkTests: XCTestCase {
    
    private var sut: AddLinkViewModel?
    private var mockPersistenceController: PersistenceController?
    private var mockRepo: MockAddLinkRepository?
    
    override  func setUp() {
        super.setUp()
        self.mockPersistenceController = PersistenceController(inMemory: true)
        self.mockRepo = MockAddLinkRepository(persistenceController: self.mockPersistenceController!)
        self.sut = AddLinkViewModel(addLinkInteractor: AddLinkInteractor(addLinkRepo: self.mockRepo!))
    }

    func testAddLinkSuccess(){
        let linkEntity = LinkEntity(name: "Hacking with swift", url: "https://www.hackingwithswift.com", thumbnailData: Data(), createdDate: Date(), shareCount: 0)
        self.sut?.saveLink(linkData: linkEntity)
        XCTAssertEqual(self.sut!.viewModelState, .success)
        XCTAssertFalse(self.sut!.viewModelState.isFailed)
        XCTAssertEqual(self.sut?.message, "Link Saved Successfully")
        
    }
    
    func testAddLinkNameEmptyLinkValidationErrorFailure(){
        let linkEntity = LinkEntity(name: "", url: "https://www.hackingwithswift.com", thumbnailData: Data(), createdDate: Date(), shareCount: 0)
        self.sut?.saveLink(linkData: linkEntity)
        XCTAssertEqual(self.sut!.viewModelState, .validationError)
        XCTAssertTrue(self.sut!.viewModelState.isFailed)
        XCTAssertEqual(self.sut?.message, "Link name cannot be empty")
    }
    
    
    func testAddLinkUrlEmptyLinkValidationErrorFailure(){
        let linkEntity = LinkEntity(name: "Hacking with swift", url: "", thumbnailData: Data(), createdDate: Date(), shareCount: 0)
        self.sut?.saveLink(linkData: linkEntity)
        XCTAssertEqual(self.sut!.viewModelState, .validationError)
        XCTAssertTrue(self.sut!.viewModelState.isFailed)
        XCTAssertEqual(self.sut?.message, "Enter a valid link URL")
    }
    
    func testAddLinkFailure(){
        let linkEntity = LinkEntity(name: "Hacking with swift", url: "https://www.hackingwithswift.com", thumbnailData: Data(), createdDate: Date(), shareCount: 0)
        let errorToThrow = NSError(domain: "Unable to save core data error", code: -999)
        self.mockRepo?.errorToThrow = errorToThrow
        self.sut?.saveLink(linkData: linkEntity)
        XCTAssertEqual(self.sut!.viewModelState, .failure)
        XCTAssertTrue(self.sut!.viewModelState.isFailed)
        XCTAssertEqual(self.sut?.message, errorToThrow.localizedDescription)
    }

}
