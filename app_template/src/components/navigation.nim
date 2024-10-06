import happyx
import ./icons


type IconFunc = proc(class: string): TagRef


proc NavigationItem*(icon: IconFunc, name, path: string): TagRef =
  buildHtml:
    tDiv(class = "flex flex-col items-center justify-center"):
      icon("w-16 h-16 duration-300 transition-all " & (
        if currentRoute == path:
          "stroke-red-500 opacity-100"
        else:
          "stroke-gray-300 opacity-70"
      ))
      tDiv(class = "text-4xl font-semibold duration-300 transition-all " & (
        if currentRoute == path:
          "text-red-500 opacity-100 max-h-12"
        else:
          "opacity-0 max-h-0"
      )):
        { name }
      @click:
        route(path)


proc Navigation*(): TagRef =
  buildHtml:
    tDiv(class = "fixed bottom-0 left-0 right-0 px-8 flex h-32 items-center justify-evenly bg-gray-800 text-white font-semibold text-7xl backdrop-blur-md"):
      NavigationItem(HomeIcon, "Home", "/")
      NavigationItem(SettingsIcon, "Test", "/test")
