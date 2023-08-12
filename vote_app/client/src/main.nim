# Import HappyX
import
  happyx,
  components/[header, auth, polls]


var authState = remember false


proc handleAuth(authorized: bool) =
  authState.set(authorized)


# Declare application with ID "app"
appRoutes("app"):
  "/":
    # Component usage
    component Header
    tDiv(class = "absolute top-0 bottom-0 left-0 right-0 flex flex-col justify-center items-center"):
      if not authState:
        component Authorization(callback = handleAuth)
      else:
        component Polls
