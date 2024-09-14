# Import HappyX
import
  happyx,
  ./ui,
  ./components/button,
  ./components/input


var
  isLogIn = remember false
  isSignIn = remember false
  username = remember ""
  password = remember ""


# Declare application with ID "app"
appRoutes("app"):
  "/":
    tDiv():
      tDiv(
        class = fmt"flex flex-col p-24 origin-top text-white relative bg-[{Background}] w-screen overflow-x-hidden overflow-y-hidden min-h-screen h-full transition-all duration-500 " & (
          if not isLogIn and not isSignIn:
            "pointer-events-all"
          else:
            "-translate-y-1/3 pointer-events-none"
        )
      ):
        tDiv(class = "flex justify-content items-center absolute w-[64rem] h-[64rem] top-24 -right-48"):
          tDiv(class = "absolute left-36 w-[90%] min-h-[90%] bg-[#A8C0A7] rounded-full")
          tImg(
            class = "absolute w-full h-fit scale-125",
            src = "/public/bek 1.png"
          )
        tH2(class = "text-5xl font-medium"):
          "Spedah"
        tDiv(class = "h-96")
        tDiv(class = "h-96")
        tDiv(class = "h-72")
        tDiv(class = "flex flex-col gap-24 justify-end min-h-full h-full"):
          tH1(class = "text-9xl font-medium"):
            "Let's get started"
          tP(class = "text-3xl"):
            "Everything start from here"
          tDiv(class = "flex flex-col items-center gap-12 mt-10"):
            Button(ButtonStyle.Primary, proc() =
              isLogIn.set(true)
            ):
              "Log in"
            Button(ButtonStyle.Secondary, proc() =
              isSignIn.set(true)
            ):
              "Sign In"
      tDiv(
        class = "top-0 left-0 absolute w-screen min-h-screen h-full bg-black/25 duration-500 transition-all " & (
          if isLogIn or isSignIn:
            "opacity-100 pointer-events-all"
          else:
            "opacity-0 pointer-events-none"
        )
      ):
        @click:
          if isLogIn:
            isLogIn.set(false)
          elif isSignIn:
            isSignIn.set(false)
      tDiv(
        class = fmt"flex flex-col drop-shadow-xl absolute w-screen h-fit rounded-2xl px-24 pt-48 pb-24 bg-white text-[{Background}] duration-500 transition-all origin-bottom " & (
          if isLogIn:
            "scale-y-100 -translate-y-full"
          else:
            "scale-y-0 translate-y-0"
        )
      ):
        tImg(class = "absolute top-20 left-24 w-16 h-16", src = "/public/back.png"):
          @click:
            isLogIn.set(false)
        tH1(class = "text-7xl font-semibold"):
          "Welcome back"
        tP(class = "text-4xl mt-12 mb-24"):
          "Enter your credential to continue"
        tDiv(class = "w-full h-full flex flex-col gap-12"):
          Input(username, "text", "/public/user.png"):
            "Username"
          Input(password, "password", "/public/lock.png"):
            "Password"
          tDiv(class = "flex w-full cursor-pointer font-semibold justify-end items-center text-3xl"):
            "Forgot password?"
          Button(ButtonStyle.Primary, proc() =
            isLogIn.set(false)
          ):
            "Log in"
          Button(ButtonStyle.Black, proc() =
            isLogIn.set(false)
          ):
            tDiv(class = "w-full items-center justify-center flex gap-4 text-white"):
              tImg(class = "w-12", src = "/public/apple-icon.png")
              "Log in using Apple"
          Button(ButtonStyle.Secondary, proc() =
            isLogIn.set(false)
          ):
            tDiv(class = "w-full items-center justify-center flex gap-4"):
              tImg(class = "w-12", src = "/public/google-icon.png")
              "Log in using Google"
          tDiv(class = "text-4xl pb-24 flex gap-2 w-full h-full items-center justify-end"):
            "Don't have account?"
            tSpan(class = "border-b-2 border-[#FFCA42]"):
              "Sign In"
              @click:
                isLogIn.set(false)
                isSignIn.set(true)
      tDiv(
        class = fmt"flex flex-col drop-shadow-xl absolute w-screen h-fit rounded-2xl px-24 pt-48 pb-24 bg-white text-[{Background}] duration-500 transition-all origin-bottom " & (
          if isSignIn:
            "scale-y-100 -translate-y-full"
          else:
            "scale-y-0 translate-y-0"
        )
      ):
        tImg(class = "absolute top-20 left-24 w-16 h-16", src = "/public/back.png"):
          @click:
            isSignIn.set(false)
        tH1(class = "text-7xl font-semibold"):
          "Create account"
        tP(class = "text-4xl mt-12 mb-24"):
          "Sign up to get started!"
        tDiv(class = "w-full h-full flex flex-col gap-12"):
          Input(username, "text", "/public/user.png"):
            "Username"
          Input(password, "email", "/public/mail.png"):
            "E-mail"
          Input(password, "password", "/public/lock.png"):
            "Password"
          Input(password, "password", "/public/lock.png"):
            "Confirm password"
          Button(ButtonStyle.Primary, proc() =
            isSignIn.set(false)
          ):
            "Log in"
          Button(ButtonStyle.Black, proc() =
            isLogIn.set(false)
          ):
            tDiv(class = "w-full items-center justify-center flex gap-4 text-white"):
              tImg(class = "w-12", src = "/public/apple-icon.png")
              "Sign in using Apple"
          Button(ButtonStyle.Secondary, proc() =
            isLogIn.set(false)
          ):
            tDiv(class = "w-full items-center justify-center flex gap-4"):
              tImg(class = "w-12", src = "/public/google-icon.png")
              "Sign in using Google"
          tDiv(class = "text-4xl pb-24 flex gap-2 w-full h-full items-center justify-end"):
            "Already member?"
            tSpan(class = "border-b-2 border-[#FFCA42]"):
              "Log In"
              @click:
                isSignIn.set(false)
                isLogIn.set(true)
