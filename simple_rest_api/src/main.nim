import
  # This will import HappyX framework
  happyx


# Request model AddPost
# with two string fields
model AddPost:
  title: string
  text: string


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

  # on GET HTTP method at 127.0.0.1:5000/hello-world
  get "/hello-world":
    # We'll see "Hello, world!"
    "Hello, world!"
  
  # on GET HTTP method at 127.0.0.1:5000/posts
  get "/posts":
    # will responds all posts
    return posts
  
  # on GET HTTP method at 127.0.0.1:5000/post
  get "/post$index:int":  # index is post index
    if posts.len > index:
      # try open 127.0.0.1:5000/post0
      return posts[index]
    else:
      # try open 127.0.0.1:5000/post10
      return {
        "error": "post index is wrong"
      }
  
  # on POST HTTP method at 127.0.0.1:5000/post/
  post "/post/[postData:AddPost]":
    posts.add(%*{
      "title": postData.title,
      "text": postData.text
    })
    return {"response": {
      "index": posts.len - 1
    }}
