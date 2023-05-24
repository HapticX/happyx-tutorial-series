import
  # This will import HappyX framework
  happyx


# Setting up our server at `127.0.0.1:5000`
serve("127.0.0.1", 5000):

  # on GET HTTP method at 127.0.0.1:5000/hello-world
  get "/hello-world":
    # We'll see "Hello, world!"
    "Hello, world!"
