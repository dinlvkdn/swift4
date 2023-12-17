import Foundation
// створили GCD чергу custom
let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
// поточний залишок на рахунку
var accountBalance = 1000
//  згрупували завдання
let dispatchGroup = DispatchGroup()

// вилучення 
func withdraw(amount: Int) {
    concurrentQueue.async(group: dispatchGroup) {
        if accountBalance >= amount {
            // Thread.sleep(forTimeInterval: 1)
            accountBalance -= amount
            print("Withdrawal successful. Remaining balance: \(accountBalance)")
        } else {
            print("Insufficient funds")
        }
    }
}
// поповнення
func refillBalance(amount: Int) {
    concurrentQueue.async(group: dispatchGroup) {
        // Thread.sleep(forTimeInterval: 1)
        accountBalance += amount
        print("Refill successful. Remaining balance: \(accountBalance)")
    }
}

for _ in 1...5 {
    withdraw(amount: 100) 
    refillBalance(amount: 100) 
}
// затримка головного потоку 
Thread.sleep(forTimeInterval: 3)
