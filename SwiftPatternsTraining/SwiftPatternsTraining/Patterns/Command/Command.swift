import Foundation

protocol BaseCommand {
    func undo() -> String
    func forward(_ str: String)
}

class StringUndoCommand: BaseCommand {
    private var originalString: String
    private var currentString: String
    
    init(argument: String) {
        originalString = argument
        currentString = argument
    }
    
    func forward(_ str: String) {
        currentString.append(str)
    }
    
    func undo() -> String {
        currentString.removeLast()
        printString()
        return currentString
    }
    
    func printString() {
        debugPrint(currentString)
    }
}

class CommandsExecutor {
    private var arrayOfCommands = [BaseCommand]()
    
    func addCommand(command: BaseCommand) {
        arrayOfCommands.append(command)
    }
    
    func forward(_ str: String) {
        for command in arrayOfCommands {
            command.forward(str)
        }
    }
    
    func undoLast() -> String {
        var title = String()
        for command in arrayOfCommands {
            title = command.undo()
        }
        return title
    }
}

func testCommandPattern() {
    let commandsExecutor = CommandsExecutor()
    var cmdUndo = StringUndoCommand(argument: "start")
    commandsExecutor.addCommand(command: cmdUndo)
    commandsExecutor.forward("12345")
    commandsExecutor.undoLast()
}
