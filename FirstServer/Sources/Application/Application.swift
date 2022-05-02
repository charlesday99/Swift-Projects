import Kitura

public class App {

    let router = Router()

    public init() throws {

    }

    func postInit() throws {
        initializeCodableRoutes(app: self)
    }

    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: 3000, with: router)
        Kitura.run()
    }
}
