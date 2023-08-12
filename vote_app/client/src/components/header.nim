# Import HappyX
import happyx


# Declare component
component Header:
  # Declare HTML template
  `template`:
    tDiv(class = "flex items-center justify-center w-fill sticky top-0 font-mono text-sm font-bold px-8 py-2 bg-purple-200"):
      tP(class = "scale-75 select-none cursor-pointer"):
        "✅ real-time voting app ❎"
