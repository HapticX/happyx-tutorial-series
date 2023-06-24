import
  # This will import HappyX framework
  happyx,
  ./mounts/[posts]


# Setting up our server at `127.0.0.1:5000`
serve("127.0.0.1", 5000):
  var posts = %*[
    {
      "title": "Hello",
      "text": "world"
    }, {
      "title": "Bye",
      "text": ":("
    }, {
      "title": "Perfect nim web framework?",
      "text": "it's HappyX 🍍"
    },
  ]

  mount "/posts" -> Posts

  # on GET HTTP method at 127.0.0.1:5000/hello-world
  get "/hello-world":
    # We'll see "Hello, world!"
    "Hello, world!"
