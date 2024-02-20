class Singer {
    func playSong() {
        print("Shake it off!")
    }
}

func sing() -> () -> Void {            
    let taylor = Singer()

    let singing = {
        taylor.playSong()
        return
    }

    return singing
}


func sing() -> () -> Void { 
    let taylor = Singer()

    let singing = { [weak taylor] in
        taylor?.playSong()
        return
    }

    return singing
}


func sing() -> () -> Void { 
    let taylor = Singer()

    let singing = { [weak taylor] in
        taylor!.playSong()
        return
    }

    return singing
}

func sing() -> () -> Void { 
    let taylor = Singer()

    let singing = { [unowned taylor] in
        taylor.playSong()
        return
    }

    return singing
}

let singFunction = sing()
singFunction()

class House {
    var ownerDetails: (() -> Void)?

    func printDetails() {
        print("This is a great house.")
    }

    deinit {
        print("I'm being demolished!")
    }
}

class Owner {
    var houseDetails: (() -> Void)?

    func printDetails() {
        print("I own a house.")
    }

    deinit {
        print("I'm dying!")
    }
}

print("Creating a house and an owner")

do {
    _ = House()  
    _ = Owner()  
}

print("Done")


print("Creating a house and an owner")
do {
    let house = House()
    let owner = Owner()
    house.ownerDetails = owner.printDetails
    owner.houseDetails = house.printDetails
}

print("Done")


print("Creating a house and an owner")

do {
    let house = House()
    let owner = Owner()
    house.ownerDetails = { [weak owner] in owner?.printDetails() }
    owner.houseDetails = { [weak house] in house?.printDetails() }
}
print("Done")

class Singer {
    init() {
        playSong()
    }

    func playSong() {
        print("Shake it off!")
    }
}

func sing() -> () -> Void {
    let taylor = Singer()
    let adele = Singer()

    let singing = { [unowned taylor, adele] in
        taylor.playSong()
        adele.playSong()
        return
    }

    return singing
}

let singFunction = sing()
singFunction()

var numberOfLinesLogged = 0

let logger1 = {
    numberOfLinesLogged += 1
    print("Lines logged: \(numberOfLinesLogged)")
}

logger1()

let logger2 = logger1
logger2()
logger1()
logger2()