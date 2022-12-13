import Foundation

func load(file named: String) -> String? {
    guard let fileURL = Bundle.main.url(forResource: named, withExtension: "txt") else {
        return nil
    }
    
    guard let content = try? String(contentsOf: fileURL, encoding: .utf8) else {
        return nil
    }
    
    return content
}

func day2ex1() -> Int {
    guard let gameStrategy = load(file: "input") else {
        fatalError("Strategy file was not included")
    }
    
    let plays = gameStrategy.components(separatedBy: .newlines)
    return plays.reduce(0) { $0 + score(play: $1)}
}

func score(play: String) -> Int {
    // Separate into opponent vs. your play
    let plays = play.components(separatedBy: .whitespaces)
    // Take empty strings as non-plays
    guard plays.count == 2 else {
        return 0
    }
    
    switch (String(plays[0]), String(plays[1])) {
    case ("A","X"): // Rock v Rock
        return 3 + 1
    case ("A", "Y"): // Rock v Paper
        return 6 + 2
    case ("A", "Z"): // Rock v Scissors
        return 0 + 3
    case ("B", "X"): // Paper v Rock
        return 0 + 1
    case ("B", "Y"): // Paper v Paper
        return 3 + 2
    case ("B", "Z"): // Paper v Scissors
        return 6 + 3
    case ("C", "X"): // Scissors v Rock
        return 6 + 1
    case ("C", "Y"): // Scissors v Paper
        return 0 + 2
    case ("C", "Z"): // Scissors v Scissors
        return 3 + 3
    case (_, _):
        return 0
    }
}

func day2ex2() -> Int {
    guard let gameStrategy = load(file: "input") else {
        fatalError("Strategy file was not included")
    }
    
    let plays = gameStrategy.components(separatedBy: .newlines)
    return plays.reduce(0) { $0 + score(for: $1)}
}

func score(for play: String) -> Int {
    // Separate into opponent vs. your play
    let plays = play.components(separatedBy: .whitespaces)
    // Take empty strings as non-plays
    guard plays.count == 2 else {
        return 0
    }
    
    switch (String(plays[0]), String(plays[1])) {
    case ("A","X"): // Rock and Lose.
        return 0 + 3
    case ("A", "Y"): // Rock and Draw.
        return 3 + 1
    case ("A", "Z"): // Rock and Win.
        return 6 + 2
    case ("B", "X"): // Paper and Lose.
        return 0 + 1
    case ("B", "Y"): // Paper and Draw.
        return 3 + 2
    case ("B", "Z"): // Paper and Win.
        return 6 + 3
    case ("C", "X"): // Scissors and Lose
        return 0 + 2
    case ("C", "Y"): // Scissors and Draw
        return 3 + 3
    case ("C", "Z"): // Scissors and Win.
        return 6 + 1
    case (_, _):
        return 0
    }
}

day2ex2()
