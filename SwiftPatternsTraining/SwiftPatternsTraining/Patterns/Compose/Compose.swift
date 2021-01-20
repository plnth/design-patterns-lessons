import Foundation

func testComposePattern() {
    let currentFolder: Compose = Folder(name: "Main")
    currentFolder.addComponent(c: File(name: "First file"))
    currentFolder.addComponent(c: Folder(name: "First folder"))
    _ = currentFolder.showContent()
    let moreFiles = [File(name: "Second file"), File(name: "Third file"), File(name: "Fourth file"), File(name: "Fifth file")]
    if let folder = (currentFolder.showContent() as? [Compose])?[1], folder is Folder {
        folder.addComponent(c: moreFiles[0])
        folder.addComponent(c: moreFiles[1])
        folder.addComponent(c: moreFiles[2])
        folder.addComponent(c: moreFiles[3])
        
        _ = folder.showContent()
    } else {
        debugPrint("Not a folder")
    }
}

protocol Compose {
    var name: String { get set }
    func showContent() -> Any
    func addComponent(c: Compose)
    func contentCount() -> Int
}

class File: Compose {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any {
        return name
    }
    
    func addComponent(c: Compose) {
        debugPrint("Cannot add folder to file")
    }
    
    func contentCount() -> Int {
        return 1
    }
}

class Folder: Compose {
    var name: String
    
    private var contentArray = [Compose]()
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any {
        for item in contentArray {
            debugPrint(item.name)
        }
        return contentArray
    }
    
    func addComponent(c: Compose) {
        contentArray.append(c)
    }
    
    func contentCount() -> Int {
        return contentArray.count
    }
}
