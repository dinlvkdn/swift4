import Foundation

let myOperationQueue = OperationQueue()
var accountBalance = 1000

func withdraw(amount: Int) {
    myOperationQueue.addOperation{
        if accountBalance >= amount {
            // Thread.sleep(forTimeInterval: 1)
            accountBalance -= amount
            print("Withdrawal successful. Remaining balance: \(accountBalance)")
        } else {
            print("Insufficient funds")
        }
    }
}

func refillBalance(amount: Int) {
    myOperationQueue.addOperation{
        // Thread.sleep(forTimeInterval: 1)
        accountBalance += amount
        print("Refill successful. Remaining balance: \(accountBalance)")
    }
}

for _ in 1...5 {
    withdraw(amount: 100)
    refillBalance(amount: 100)
}

Thread.sleep(forTimeInterval: 3)
