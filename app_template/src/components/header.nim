import happyx


proc Header*(title: string = "Main"): TagRef =
  buildHtml:
    tDiv(class = "fixed top-0 left-0 right-0 px-8 flex h-32 items-center bg-gray-800 text-white font-semibold text-7xl backdrop-blur-md"):
      { title }
