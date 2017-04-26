import Vapor

let drop = Droplet()

drop.get("bughunt") { request in
    let testflows = try [
        ["name": "MT-1234", "link": "http://jira.scout24.com"].makeNode(),
        ["name": "MT-1235"].makeNode(),
        ["name": "MT-1236"].makeNode()
       ].makeNode()
    let testers = try ["Roland", "Zsolt", "André", "Andi"].makeNode()
    return try drop.view.make("bughunt", Node(node: ["testflows": testflows, "testers": testers]))
}

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())

drop.run()
