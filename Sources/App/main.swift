import Vapor

let drop = Droplet()

drop.get("bughunt") { request in
    let testflows = try [
        ["name": "MT-1737", "title": "Saved searches AND Log in/out"].makeNode(),
        ["name": "MT-2972", "title": "Selling AND Price change"].makeNode(),
        ["name": "MT-2678", "title": "Register AND Password change"].makeNode(),
        ["name": "MT-1739", "title": "Favorites"].makeNode(),
        ["name": "MT-1761", "title": "Update Beta to latest version"].makeNode(),
        ["name": "MT-1764", "title": "Resultlisting"].makeNode(),
        ["name": "MT-2216", "title": "Notes on parkdeck"].makeNode(),
        ["name": "MT-2525", "title": "Werkstattsuche"].makeNode()
       ].makeNode()
    let testers = try [
        ["name": "Roland", "device": "iPhone 5x iOS 10.2.1"].makeNode(),
        ["name": "Zsolt", "device": "iPhone 6s iOS 10.2.1"].makeNode(),
        ["name": "André", "device": "iPhone 7 Plus iOS 10.3.1"].makeNode(),
        ["name": "Ivan", "device": "iPhone 7 iOS 10.3.1"].makeNode(),
        ["name": "Andi", "device": "iPad iOS 10.2.x"].makeNode()
        ].makeNode()
    return try drop.view.make("bughunt", Node(node: ["testflows": testflows, "testers": testers]))
}

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())

drop.run()
