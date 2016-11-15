import Foundation

class SaveAsFileUtil {
    
    func save(_ object:Any, directory:String? = nil, archiveName:String){
        let archiveDirectory = get(directory)
        NSKeyedArchiver.archiveRootObject(object, toFile: "\(archiveDirectory)/\(archiveName)")
    }
    
    func read(directory:String? = nil, archiveName:String) -> Any? {
        let archiveDirectory = get(directory)
        return NSKeyedUnarchiver.unarchiveObject(withFile: "\(archiveDirectory)/\(archiveName)")
    }
    
    func get(_ directory:String? = nil) -> String {
        if let dir = directory {
            return dir
        }
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    }
    
}
