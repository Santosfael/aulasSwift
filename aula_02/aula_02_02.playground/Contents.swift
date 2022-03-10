import UIKit

func icon() -> UIImage {
    guard let image = UIImage(named: "Photo") else {
        return UIImage(named: "Default")!
    }
    return image
}

func someFunc(parameter: String?) {
    guard let parameter = parameter else {
        return
    }
    
    print(parameter)
}

//someFunc(parameter: "Rafael")

func getUser(name: String?) -> String {
    if let name = name {
        return name
    }
    return "Rafael"
}

getUser(name: nil)

