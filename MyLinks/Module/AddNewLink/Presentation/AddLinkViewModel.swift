//
//  AddLinkViewModel.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation
import Combine
@MainActor
class AddLinkViewModel: ObservableObject{
    enum AddLinkViewModelState{
        case idle
        case success
        case validationError
        case failure
        
        
        var isFailed: Bool{
            return self == .failure || self == .validationError
        }
        
    }
    var viewModelState: AddLinkViewModelState = .idle
    @Published var message: String = ""
    private let addLinkInteractor: AddLinkInteractorProtocol
    init(addLinkInteractor: AddLinkInteractorProtocol) {
        self.addLinkInteractor = addLinkInteractor
    }
    
    func saveLink(linkData: LinkEntity){
        if linkData.name.trimmingCharacters(in: .whitespaces).isEmpty{
            self.viewModelState = .validationError
            self.message = "Link name cannot be empty"
            return
        }
        if linkData.url.trimmingCharacters(in: .whitespaces).isEmpty{
            self.viewModelState = .validationError
            self.message = "Enter a valid link URL"
            return 
        }
        
        do{
            try self.addLinkInteractor.execute(linkData: linkData)
            viewModelState = .success
            self.message = "Link Saved Successfully"
        }
        catch{
            print(error)
            self.message = error.localizedDescription
            viewModelState = .failure
        }
    }
}
