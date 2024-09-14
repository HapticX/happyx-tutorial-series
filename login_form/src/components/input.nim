import
  happyx,
  ../ui


proc Input*(val: State[string], inputType: string, iconSrc: string = "", stmt: TagRef): TagRef =
  buildHtml:
    tDiv(class = "w-full flex items-center group relative"):
      tInput(
        class = fmt"w-full text-4xl peer rounded-full px-24 py-8 outline-none border border-[{Background}] transition-all duration-300",
        value = $val,
        autocomplete = "off",
        type = inputType,
      ):
        @input(e):
          val.set($e.target.InputElement.value)
      if iconSrc.len > 0:
        tDiv(class = "absolute px-12 py-8"):
          tImg(src = iconSrc, class = "w-10")
        tLabel(
          class = fmt"text-4xl pl-32 pr-16 py-8 absolute peer-focus:scale-75 peer-focus:-translate-y-2/3 origin-top-left duration-300 transition-all " & (
            if val.len == 0:
              "scale-100"
            else:
              "scale-75 -translate-y-2/3"
          )
        ):
          stmt
      else:
        tLabel(
          class = fmt"text-4xl px-16 py-8 absolute peer-focus:scale-75 peer-focus:-translate-y-2/3 origin-top-left duration-300 transition-all " & (
            if val.len == 0:
              "scale-100"
            else:
              "scale-75 -translate-y-2/3"
          )
        ):
          stmt
