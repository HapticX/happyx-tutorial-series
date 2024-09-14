# Import HappyX
import
  happyx,
  std/asyncjs,
  ../ui


type ButtonStyle* = enum
  Primary,
  Secondary,
  Black


type ButtonCallback* = proc(): void


proc Button*(style: ButtonStyle, cb: ButtonCallback, stmt: TagRef): TagRef =
  buildHtml:
    tButton(
      class = fmt"w-full rounded-full px-18 py-8 text-[{Background}] text-4xl font-semibold transition-all duration-300 " & (case style:
          of ButtonStyle.Primary:
            "bg-[#FFCA42] active:bg-[#DEAA22]"
          of ButtonStyle.Secondary:
            "bg-[#D5E7D4] active:bg-[#B5C7B4]"
          of ButtonStyle.Black:
            "bg-[#000000] active:bg-[#212121]"
    )):
      stmt
      @click:
        cb()
