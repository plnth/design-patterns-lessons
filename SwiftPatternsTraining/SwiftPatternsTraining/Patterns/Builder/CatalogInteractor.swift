import Foundation

protocol Interactor {
    init(presenter: Presenter)
}

class CatalogInteractor: Interactor {
    var presenter: Presenter
    
    required init(presenter: Presenter) {
        self.presenter = presenter
    }
}
