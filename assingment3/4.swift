import Foundation
// Problem 4
func showMenu() {
    print("""
    Menu:
    1. Add an item to the shopping list
    2. Remove an item from the shopping list
    3. View current shopping list
    4. Exit
    """)
}


func addItem(to list: inout [String]) {
    print("Please enter the item to add:")
    if let item = readLine(), !item.isEmpty {
        list.append(item)
        print("'\(item)' has been added to your shopping list.")
    } else {
        print("Error: Item name cannot be empty.")
    }
}


func removeItem(from list: inout [String]) {
    print("Please enter the name of the item to remove:")
    if let item = readLine(), let index = list.firstIndex(of: item) {
        list.remove(at: index)
        print("'\(item)' has been removed from your shopping list.")
    } else {
        print("Item not found in the list.")
    }
}


func showList(_ list: [String]) {
    if list.isEmpty {
        print("Your shopping list is currently empty.")
    } else {
        print("Current shopping list:")
        for (index, item) in list.enumerated() {
            print("\(index + 1). \(item)")
        }
    }
}


func shoppingListApp() {
    var shoppingList: [String] = []
    var isRunning = true
    
    while isRunning {
        showMenu()
        
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1:
                addItem(to: &shoppingList)
            case 2:
                removeItem(from: &shoppingList)
            case 3:
                showList(shoppingList)
            case 4:
                isRunning = false
                print("Exiting the application.")
            default:
                print("Invalid choice. Please try again.")
            }
        } else {
            print("Invalid input. Please enter a number between 1 and 4.")
        }
    }
}

shoppingListApp()
