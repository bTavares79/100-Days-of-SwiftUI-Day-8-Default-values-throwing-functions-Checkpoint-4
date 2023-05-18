import UIKit

enum SquareRootError: Error {
    case outofboundsError,
        noRootError
}


func findSquareRoot(_ number: Int) throws -> String {
    if number < 1 || number > 10_000{
        throw SquareRootError.outofboundsError
    }
    
    if number == 1 {
        return "The square root of 1 is 1"
    }
    
    if number > 1 && number <= 10_000 {
        for i in 1 ... number {
            if i * i == number {
                return "The square root of the number is \(i)"
            }
            
            if i == number {
                throw SquareRootError.noRootError
            }
        }
    }
    
    throw SquareRootError.noRootError
}



do{
    let value = try findSquareRoot(110)
    print("\(value)")
} catch SquareRootError.outofboundsError {
    print("The value is out of bounds")
} catch SquareRootError.noRootError {
    print("The number has no square root")
} catch {
    
}
