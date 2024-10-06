import
  happyx,
  ./[
    header, navigation
  ]


proc PageHolder*(title: string = "Main", stmt: TagRef = nil): TagRef =
  buildHtml:
    tDiv(class = "relative w-full min-h-screen h-full py-32 bg-gray-700"):
      Header(title)
      tDiv(class = "text-4xl text-white"):
        stmt
      Navigation
