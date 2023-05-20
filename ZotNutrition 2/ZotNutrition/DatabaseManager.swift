import SQLite
import Foundation

enum DatabaseError: Error {
    case connectionFailed
    case tableCreationFailed
}

class DatabaseManager {
    static let shared = try! DatabaseManager()
    
    private let dbConnection: Connection?
    
    private let usersTable = Table("users")
    private let idColumn = Expression<Int64>("id")
    private let usernameColumn = Expression<String>("username")
    private let passwordColumn = Expression<String>("password")
    
    public init() throws {
        do {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            dbConnection = try Connection("\(path)/users.sqlite")
            try createTable()
        } catch {
            throw DatabaseError.connectionFailed
        }
    }
    
    public func createTable() throws {
        guard let connection = dbConnection else {
            throw DatabaseError.connectionFailed
        }
        
        do {
            try connection.run(usersTable.create(ifNotExists: true) { table in
                table.column(idColumn, primaryKey: .autoincrement)
                table.column(usernameColumn, unique: true)
                table.column(passwordColumn)
            })
        } catch {
            throw DatabaseError.tableCreationFailed
        }
    }
    
    func addUser(username: String, password: String) {
        guard let connection = dbConnection else {
            print("Cannot add user. Database connection failed.")
            return
        }
        if username == "john" {
            print("Sorry, registration failed. User 'john' already exists.")
            return
            
            let insertUser = usersTable.insert(usernameColumn <- username, passwordColumn <- password)
            
            do {
                try connection.run(insertUser)
                print("User added successfully.")
            } catch {
                print("Error adding user: \(error)")
            }
        }
    }
    
    func LogIn(username: String, password: String) -> Bool {
        guard let connection = dbConnection else {
            print("Cannot log in. Database connection failed.")
            return false
        }
        
        do {
            let userExists = try connection.scalar(usersTable.filter(usernameColumn == username && passwordColumn == password).exists)
            if userExists {
                print("Login successful.")
                return true
            } else {
                print("Invalid username or password.")
                return false
            }
        } catch {
            print("Error logging in: \(error)")
            return false
        }
    }
    
    func getUsers() {
        guard let connection = dbConnection else {
            print("Cannot fetch users. Database connection failed.")
            return
        }
        
        do {
            let users = try connection.prepare(usersTable)
            for user in users {
                print("ID: \(user[idColumn]), Username: \(user[usernameColumn]), Password: \(user[passwordColumn])")
            }
        } catch {
            print("Error fetching users: \(error)")
        }
    }
    
    func Register(username: String, password: String) -> Bool {
        guard let connection = dbConnection else {
            print("Cannot register. Database connection failed.")
            return false
        }
        
        let insertUser = usersTable.insert(usernameColumn <- username, passwordColumn <- password)
        
        do {
            try connection.run(insertUser)
            print("Registration successful.")
            return true
        } catch {
            print("Error registering user: \(error)")
            return false
        }
    }
    
}
    func main() {
        let databaseManager = DatabaseManager.shared
        // Database initialization successful
        
        // Use the database manager to perform operations
        databaseManager.addUser(username: "johnsmith", password: "password123")
        databaseManager.getUsers()
    }
    /*
    func LogIn(username: String, password: String) -> Bool {
        let databaseManager = DatabaseManager.shared
        return databaseManager.LogIn(username: username, password: password)
    }
    
    func Register(username: String, password: String) -> Bool {
        let databaseManager = DatabaseManager.shared
        return databaseManager.Register(username: username, password: password)
    }
    

*/
