//
//  MyLinksViewModel.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation
import Combine


@MainActor
class MyLinksViewModel: ObservableObject{
    enum ViewModelState{
        case idle
        case success
        case failed
        var isFailed: Bool{
            return self == .failed
        }
    }
    @Published var viewModelState: ViewModelState = .idle
    @Published var myLinks = [LinkEntity]()
    private let myLinksInteractor: MyLinksInteractorProtocol
    
    init(myLinksInteractor: MyLinksInteractorProtocol){
        self.myLinksInteractor = myLinksInteractor
    }
    
    func getAllMyLinks(){
        do{
            let result = try self.myLinksInteractor.execute()
            self.myLinks = result
            self.viewModelState = .success
        }
        catch{
            print(error)
            self.viewModelState = .failed
        }
    }
    
    
}
