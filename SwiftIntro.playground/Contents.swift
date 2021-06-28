import Foundation

//MARK: - OPTIONALS

/*
 Task:
 1. Implement unwrapValues() method;
 2. Pass unwrapped values to printString(_:) method;
 3. Nil cases should call printError() method.
 */

struct OptionalExample {
    var optionalWithValue: String? = "Hello"
    var optionalWithoutValue: String?
}

class ClassWithOptional {
    let optionalExample: OptionalExample? = OptionalExample()

    private func printString(_ string: String) {
        print(string)
    }

    private func printError() {
        print("Error")
    }

    private func moveForward() {
        print("Tasks done - moving forward")
    }

    func unwrapValues() {

        //Use force unwrap

        //Use default value

        //Use if let

        //Use guard let

        //Use switch statement

        // Use combined optional unwrapping and call moveForward method if both variables are not nil

    }
}

let classWithOptional = ClassWithOptional()
classWithOptional.unwrapValues()

//MARK: - PROPERTIES

// Computed and observed properties

/*
 Task:
 1. Add computed properties where it's possible;
 2. Add new observed property "movie" which will print previous movie title when new movie is set.
 */

struct Movie {
    let title: String
    let mainActor: String
}

struct Cinema {
    let startTime: Date
    private let name: String = "Forum Cinemas"
    
    func elapsedTime() -> TimeInterval {
        return Date().timeIntervalSince(startTime)
    }

    func getCinemaName() -> String {
        return name
    }
}

var cinema = Cinema(startTime: Date())
//print(cinema.elapsedTime())
//print(cinema.getCinemaName())

// Computed properties with enum

/*
 Task:
 1. Uncomment print statement and understand how it works :)
 */

enum Category {
    case shoes
    case dress
    case jeans
}

struct Item {
    var name: String
    var category : Category
}

let item = Item(name: "New shoes", category: .shoes)

extension Category {
    var sizes: String {
        switch self {
        case .dress:
            return "S, M, L, XL"
        case .shoes:
            return "39, 40, 41, 42, 43"
        case .jeans:
            return "32/33, 33/34, 123"
        }
    }
}

//print(item.category.sizes)

// Lazy properties

/*
 Task:
 1. Uncomment print statements and run the code below;
 2. Change oldest() method to lazy var and run the code again;
 3. Below print statements, append one more family member to family array, he/she should be oldest of all members;
 4. Add one more print statement and run the code - do you see the difference?
 */

struct Member {
    let name: String
    let age: Int
}

struct Family {
    var members: [Member]

    func oldest() -> Member? {
        print("oldest member being calculated...")

        return members.max(by: { $0.age < $1.age })
    }
}

var family = Family(members: [
    Member(name: "Antoine", age: 30),
    Member(name: "Jaap", age: 3),
    Member(name: "Lady", age: 3),
    Member(name: "Mike", age: 27)
])

//print(family.oldest())
//print(family.oldest())

//MARK: - HIGHER ORDER FUNCTIONS

var arrayOfItems: [Item] = [
    Item(name: "Nike shoes", category: .shoes),
    Item(name: "Levi's jeans", category: .jeans),
    Item(name: "Zara dress", category: .dress)
]

/*
 Task 1: create array of item names from arrayOfItems
 */

//let arrayOfItemNames: [String] =
//
//arrayOfItemNames.forEach { print($0) }

/*
 Task 2: create array mappedMovies: [String] from dictionary movies: [String: Float] based on movie rating (Good > 5, bad <= 5)

 Example: ["Home Alone 1 (Good)", "Star Wars (Bad)", "Harry Potter (Good)", "Home Alone 4 (Bad)"]
 */

let movies: [String: Float] = ["Home Alone 1": 10, "Star wars": 5, "Harry Potter": 8, "Home Alone 4": 2]

//let mappedMovies: [String] =

//mappedMovies.forEach { print($0) }

/*
 Task 3: use filter instead of forEach
 */

let arrayOfIntegers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var newArray: [Int] = []

arrayOfIntegers.forEach {
    if $0 % 2 == 0 {
        newArray.append($0)
    }
}

//newArray.forEach { print($0) }

/*
 Task 4: create a new array of Items that contains only shoes, use filter if possible
 */

var arrayOfItems2: [Item?] = [
    Item(name: "Nike shoes", category: .shoes),
    Item(name: "Levi's jeans", category: .jeans),
    nil,
    Item(name: "Zara dress", category: .dress),
    Item(name: "Vans shoes", category: .shoes),
    nil,
    Item(name: "Pull and Bear dress", category: .dress),
    Item(name: "Gucci jeans", category: .jeans)
]

//var arrayOfShoes: [Item] =

//arrayOfShoes.forEach {
//    print($0.name)
//}

//MARK: - PROTOCOLS

/*
 Task 1: inside class Wallet:
 1. add new variable that can store array of different coins;
 2. create function that can append new type of coin to created array.
 Task 2: add function named printValue to created protocol that prints general info(name, symbol and holdings) about coin.
 */

struct Bitcoin {
    let name = "Bitcoin"
    let symbol = "BTC"
    var holdings: Double
    var price: NSDecimalNumber?
}

struct Ethereum {
    let name = "Ethereum"
    let symbol = "ETH"
    var holdings: Double
    var price: NSDecimalNumber?
}

class Wallet {
    func printAllCoins() {
        //coins.forEach { $0.printValue() }
    }
}

//let wallet = Wallet()
//wallet.addCoin(...)
//wallet.printAllCoins()

//MARK: - CLOSURES

/*
 Task 1: define optional closure onComplete in ColorPickerViewController. Closure should take String as input parameter and return Void.
 Task 2: call defined closure in selectRedColor() method with String "3".
 Task 3: inside AddItemViewController, give value for onComplete closure. String received from closure should be added to ItemUploadForm as colorId.
 */

class ItemUploadForm {
    var colorId: String? {
        didSet {
            guard let colorId = colorId else {
                return
            }

            print("Selected colorId - \(colorId)")
        }
    }
    
    deinit {
        print("ItemUploadForm was deinitialized")
    }
}

class ColorPickerViewController {
    //var onComplete:
    
    func selectRedColor() {

    }
    
    deinit {
        print("ColorPickerViewController was deinitialized")
    }
}

class AddItemViewController {
    var itemUploadForm: ItemUploadForm = ItemUploadForm()
    var colorPicker = ColorPickerViewController()

    func openColorPicker() {
        print("present color picker")

        //colorPicker.onComplete =
        
        //Simulating color selection in ColorPickerViewController
        colorPicker.selectRedColor()
        print("Color was selected")
    }

    deinit {
        print("AddItemViewController was deinitialized")
    }
}

var addItemVC: AddItemViewController? = AddItemViewController()
//addItemVC?.openColorPicker()

// MARK: - Memory leaks

/*
 Task 1: check if closure task has some memory leaks. Fix them.
 Task 2: assign AddItemViewController to nil, it should deinit ItemUploadForm, ColorPickerViewController, AddItemViewController.
 */

/*
 Task 3: run the code below, do you see any memory leaks?
 Task 4: if yes, fix them, assign downloader and manager to nil - it should run deinit methods in both classes.
 */

class DownloaderManager {
    var imagesDownloader: ImagesDownloader?

    func doManagerThings() {
        print("Do manager things")
    }

    deinit {
        print("DownloaderManager deinitialized")
    }
}

class ImagesDownloader {
    var onPublish: ((_ value: String) -> Void)?
    var images: [String] = [String]()

    var downloadManager: DownloaderManager?

    init() {
        onPublish = { imgName in
            self.images.append(imgName)
            print("New \(imgName) appended, image count: \(self.images.count)")
        }
    }

    deinit {
        print("ImagesDownloader deinitialized")
    }

    func addNewImage(name: String) {
        onPublish?(name)
    }
}

var downloader: ImagesDownloader? = ImagesDownloader()
var manager: DownloaderManager? = DownloaderManager()
downloader?.downloadManager = manager
manager?.imagesDownloader = downloader

//downloader?.addNewImage(name: "New Image")
