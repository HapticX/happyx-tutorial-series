import happyx


component Polls:
  data: seq[tuple[
    i: int,
    t, d: cstring,
    answers: seq[tuple[i, pId: int, t: cstring]]
  ]] = @[]
  `template`:
    tDiv(class = "flex flex-col gap-4 w-full h-full justify-center items-center px-8"):
      for poll in self.data:
        tDiv(class = "w-full rounded-md bg-purple-100 drop-shadow-xl px-8 py-2"):
          tP(class = "font-mono font-bold lowercase"):
            {poll.t}
          if poll.d.len > 0:
            tP(class = "font-mono text-sm opacity-75 lowercase"):
              {poll.d}
          tDiv(class = "flex flex-col gap-2"):
            for answer in poll.answers:
              tDiv(class = "flex font-mono lowercase font-sm justify-center items-center rounded-md bg-purple-50 select-none cursor-pointer"):
                {answer.t}
  
  @created:
    self.loadPolls()
  
  [methods]:
    proc loadPolls() =
      # Disable renderer at few time
      enableRouting = false
      buildJs:
        function foreach(data):
          # Declare nim variables
          nim:
            var
              id: int
              title: cstring
              description: cstring
              answers: seq[tuple[i, pId: int, t: cstring]] = @[]
          # Load data from JS
          ~id = data.id
          ~title = data.title
          ~description = data.description
          # Load answers from JS And add in Nim
          for answer in data.answers:
            nim:
              var
                answerId: int
                pollId: int
                answerTitle: cstring
            ~answerId = answer.id
            ~pollId = answer.pollId
            ~answerTitle = answer.title
            nim:
              # Load JS data to Nim
              answers.add((answerId, pollId, answerTitle))
          nim:
            self.data->add((id, title, description, answers))
        function handlePolls(response):
          # Handle response
          response.forEach(e => foreach(e))
          nim:
            enableRouting = true
            # Rerender our app
            application.router()
        # Fetch data from our API
        fetch("http://localhost:5123/polls").then(e => e.json().then(
          x => handlePolls(x.response)
        ))
