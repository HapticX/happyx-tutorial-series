# Import HappyX
import
  happyx,
  db_sqlite


proc initDataBase(): DbConn =
  ## Creates Database connection.
  let res = open("votes.db", "", "", "")
  # Create users table
  res.exec(sql"""CREATE TABLE IF NOT EXISTS user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    login TEXT NOT NULL,
    pswd TEXT NOT NULL
  );""")
  # Create votes table
  res.exec(sql"""CREATE TABLE IF NOT EXISTS vote (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    userId INTEGER NOT NULL,
    pollId INTEGER NOT NULL,
    answerId INTEGER NOT NULL
  );""")
  # Create poll table
  res.exec(sql"""CREATE TABLE IF NOT EXISTS poll (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL
  );""")
  # Create poll answer table
  res.exec(sql"""CREATE TABLE IF NOT EXISTS answer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pollId INTEGER NOT NULL,
    title TEXT NOT NULL
  );""")
  # test polls
  # res.exec(sql"INSERT INTO poll (title, description) VALUES (?, ?)", "Best Web Framework?", "")
  # res.exec(sql"INSERT INTO answer (pollId, title) VALUES (?, ?)", 1, "HappyX 🔥")
  # res.exec(sql"INSERT INTO answer (pollId, title) VALUES (?, ?)", 1, "FastAPI ⚡")
  # res.exec(sql"INSERT INTO answer (pollId, title) VALUES (?, ?)", 1, "Vue.js 🍍")
  # res.exec(sql"INSERT INTO poll (title, description) VALUES (?, ?)", "Best language?", "choose the best programming language")
  # res.exec(sql"INSERT INTO answer (pollId, title) VALUES (?, ?)", 2, "Nim 👑")
  # res.exec(sql"INSERT INTO answer (pollId, title) VALUES (?, ?)", 2, "Python 🐍")
  # res.exec(sql"INSERT INTO answer (pollId, title) VALUES (?, ?)", 2, "Rust ⚙")
  res


proc users(db: DbConn): seq[Row] =
  ## Retrieves all created users
  db.getAllRows(sql"SELECT * FROM user")

proc votes(db: DbConn): seq[Row] =
  ## Retrieves all created votes
  db.getAllRows(sql"SELECT * FROM vote")

proc answers(db: DbConn): seq[Row] =
  ## Retrieves all created answers
  db.getAllRows(sql"SELECT * FROM answer")

proc polls(db: DbConn): seq[Row] =
  ## Retrieves all created polls
  db.getAllRows(sql"SELECT * FROM poll")

proc userExists(db: DbConn, username: string): bool =
  ## Returns true if user is exists
  for user in db.users():
    if user[1] == username:
      return true
  false

proc getUser(db: DbConn, login, password: string): Row =
  ## get user by password and login
  for user in db.users():
    # Compare user login and user password hash
    if user[1] == login and check_password(password, user[2]):
      return user
  Row(@[])


# Declare Auth request model to user registration
model Auth:
  username: string
  password: string


mount Authorization:
  get "/sign-in[auth:Auth]":
    ## Authorizes user if available.
    ## 
    ## On incorrect data responds 404.
    ## On success returns user's ID
    var user = db.getUser(query~username, query~password)
    if user.len == 0:
      statusCode = 404
      return {"response": "failure"}
    else:
      return {"response": parseInt(user[0])}
  post "/sign-up[auth:Auth]":
    ## Registers user if available.
    ## 
    ## When username is exists responds 404
    if db.userExists(auth.username):
      statusCode = 404
      return {"response": fmt"failure. user {auth.username} is exists."}
    else:
      db.exec(
        sql"INSERT INTO user (login, pswd) VALUES (?, ?)",
        auth.username, generate_password(auth.password)
      )
      return {"response": "success"}


regCORS:
  origins: ["*"]
  headers: ["*"]
  methods: ["*"]
  credentials: true


# Serve at http://127.0.0.1:5123
serve "127.0.0.1", 5123:
  # Connect to Database
  let db = initDataBase()

  # on GET HTTP method at http://127.0.0.1:5123/auth/...
  mount "/auth" -> Authorization

  get "/polls":
    var
      polls = newJArray()
      answers = db.answers()
    for poll in db.polls():
      # Get all poll answers
      var answerList = newJArray()
      for answer in answers:
        if answer[1] == poll[0]:
          answerList.add(%*{
            "id": answer[0],
            "pollId": answer[1],
            "title": answer[2]
          })
      polls.add(%*{
        "id": poll[0],
        "title": poll[1],
        "description": poll[2],
        "answers": answerList
      })
    return {
      "response": polls
    }
