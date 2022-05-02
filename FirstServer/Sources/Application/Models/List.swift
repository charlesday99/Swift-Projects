struct List: Codable {
    let id: Int
    let user: String
    let title: String
    let items: [String]

    init(id: Int, user: String, title: String, items: [String]) {
        self.id = id
        self.user = user
        self.title = title
        self.items = items
    }
}
