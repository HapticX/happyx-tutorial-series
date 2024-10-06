# Import HappyX
import
  happyx,
  components/[
    header, navigation,
    page_holder, icons
  ]


# Declare application with ID "app"
appRoutes("app"):
  "/":
    # Component usage
    PageHolder("Home"):
      "It's just a home page"
  "/test":
    # Component usage
    PageHolder("Test"):
      "It's just a settings page"
