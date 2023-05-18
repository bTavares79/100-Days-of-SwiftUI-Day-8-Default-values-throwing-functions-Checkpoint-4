import UIKit

// ============================================ Provide default values to parameters ===========================

// In this functions instance the end value is defualted to 12 this way you don't have to pass in a value from the function call
func printTimesTables(number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}
               
printTimesTables(number: 5)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

// This method allows you to remove all of the items from an array but it keeps the capacity the same. This keeps the allocated memory
// to save time. This is useful for very large arrays
characters.removeAll(keepingCapacity: true)
print(characters.count)


// ================================================== How to handle errors =========================================
enum PasswordError: Error {
    case short,
        obvious
}


// Using the throws keyword on the output says that this function can throw some kind of error. This could be a string or an Int
// in this case it is an enum
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"


// Proper way to call functions and then provide error messages
do{
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Password is too short")
} catch PasswordError.obvious {
    print("Password is too obvious")
} catch {
    // This will print out the Apple error
    print("There was an error: \(error.localizedDescription)")
}
