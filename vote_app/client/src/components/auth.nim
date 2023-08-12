import happyx


component Authorization:
  callback: (proc(authorized: bool): void) = (proc(authorized: bool) = discard)

  `template`:
    tDiv(class = "flex flex-col px-6 py-4 items-center rounded-md drop-shadow-2xl bg-purple-100 gap-8"):
      tP(class = "font-mono font-bold"):
        "authorization 🔐"
      tDiv(class = "flex flex-col gap-2"):
        tInput(id = "login", placeholder = "Username ...", class = "text-center rounded-md px-4 font-mono")
        tInput(id = "password", `type` = "password", placeholder = "Password ...", class = "font-mono text-center rounded-md px-4")
      tDiv(class = "flex justify-center items-center w-full justify-around"):
        tButton(class = "bg-none rounded-md px-2 text-sm font-mono border-2 border-purple-600 hover:border-purple-700 active:border-purple-800 transition-all"):
          "sign in"
          @click:
            # Try to authorize
            let
              inpLogin = document.getElementById("login")
              inpPassword = document.getElementById("password")
            auth(self.Authorization, inpLogin.value, inpPassword.value)
  
  [methods]:
    proc auth(username, password: cstring) =
      buildJs:
        function handleResponse(response):
          # Handle authorization response
          console.log(response)
          console.log(response.response)
          if typeof response.response == "number":
            nim:
              self.callback.val()(true)
          else:
            nim:
              self.callback.val()(false)
        fetch("http://localhost:5123/auth/sign-in?username=" + ~username + "&password=" + ~password).then(
          (e) => e.json().then(
            (response) => handleResponse(response)
          )
        )
