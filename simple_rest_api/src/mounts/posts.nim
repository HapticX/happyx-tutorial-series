import happyx


# Request model AddPost
# with two string fields
model AddPost:
  title: string
  text: string


mount Posts:
  # on GET HTTP method at 127.0.0.1:5000/posts/
  "/":
    # will responds all posts
    return posts
  
  # on GET HTTP method at 127.0.0.1:5000/posts/
  "/$index:int":  # index is post index
    if posts.len > index:
      # try open 127.0.0.1:5000/post0
      return posts[index]
    else:
      # try open 127.0.0.1:5000/post10
      return {
        "error": "post index is wrong"
      }
  
  # on POST HTTP method at 127.0.0.1:5000/posts/
  post "/[postData:AddPost]":
    echo "aca"
    posts.add(%*{
      "title": postData.title,
      "text": postData.text
    })
    return {"response": {
      "index": posts.len - 1
    }}
