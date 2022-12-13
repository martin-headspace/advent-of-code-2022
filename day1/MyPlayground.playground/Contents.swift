import UIKit

func load(file named: String) -> String? {
    guard let fileURL = Bundle.main.url(forResource: named, withExtension: "txt") else {
        return nil
    }
    
    guard let content = try? String(contentsOf: fileURL, encoding: .utf8) else {
        return nil
    }
    
    return content
}

func day1ex1() -> Int {
    guard let input = load(file: "input") else {
        fatalError("File was not included / not available")
    }
    
    // Convert to use per-elf
    let caloryComponents = input.components(separatedBy: .newlines)
    // Store max
    var maxCalories = 0
    var currentElfCalories = 0
    
    // Start summing
    caloryComponents.map { calory in
        if calory.isEmpty {
            maxCalories = max(maxCalories, currentElfCalories)
            currentElfCalories = 0
        } else {
            if let numericalCalory = Int(calory) {
                currentElfCalories += numericalCalory
            }
        }
    }
    
    return maxCalories
}

func day2ex2() -> Int {
    guard let input = load(file: "input") else {
        fatalError("File was not included / not available")
    }
    
    // Convert to use per-elf
    let caloryComponents = input.components(separatedBy: .newlines)
    
    // Get Max elfs
    var caloriesPerElf = [Int]()
    var currentElfCalories = 0
    
    // Start summing
    caloryComponents.map { calory in
        if calory.isEmpty {
            caloriesPerElf.append(currentElfCalories)
            currentElfCalories = 0
        } else {
            if let numericalCalory = Int(calory) {
                currentElfCalories += numericalCalory
            }
        }
    }
    
    return caloriesPerElf.sorted(by: >)[0...2].reduce(0, +)
}
