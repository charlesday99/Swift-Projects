import KituraContracts

func initializeCodableRoutes(app: App) {
    app.router.post("/list", handler: app.postHandler)

    app.router.get("/user", handler: app.getAllHandler)
    app.router.get("/list", handler: app.getOneHandler)
}

extension App {
    static var codableStore = [List]()

    func postHandler(newlist: List, completion: (List?, RequestError?) -> Void) {
        for list in App.codableStore {
            if newlist.id == list.id {
                return completion(nil, .notFound)
            }
        }
        App.codableStore.append(newlist)
        completion(newlist, nil)
    }

    func getAllHandler(user: String, completion: ([List]?, RequestError?) -> Void) {
        var results: [List] = []
        for list in App.codableStore {
            if user == list.user {
                results.append(list)
            }
        }
        completion(results, nil)
    }

    func getOneHandler(id: Int, completion: (List?, RequestError?) -> Void) {
        guard id < App.codableStore.count, id >= 0 else {
            return completion(nil, .notFound)
        }
        completion(App.codableStore[id], nil)
    }
}
