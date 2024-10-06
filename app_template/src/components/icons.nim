import happyx


proc SvgHolder(class: string, stmt: TagRef): TagRef =
  buildHtml:
    tSvg("viewBox" = "0 0 24 24", "fill" = "none", "xmlns" = "http://www.w3.org/2000/svg", class = class):
      stmt


proc HomeIcon*(class: string): TagRef =
  buildHtml:
    SvgHolder(class):
      tPath("stroke-width" = "2", "stroke-linejoin" = "round", "d" = "M17.7218 7.8131C18.3516 8.39795 18.6666 8.69037 18.8333 9.0727C19 9.45504 19 9.88478 19 10.7443L19 17C19 18.8856 19 19.8284 18.4142 20.4142C17.8284 21 16.8856 21 15 21L14 21L10 21L9 21C7.11438 21 6.17157 21 5.58579 20.4142C5 19.8284 5 18.8856 5 17L5 10.7443C5 9.88478 5 9.45503 5.16672 9.0727C5.33345 8.69037 5.64836 8.39795 6.2782 7.8131L8.5 5.75L9.2782 5.02739C10.5691 3.82865 11.2146 3.22928 12 3.22928C12.7854 3.22928 13.4309 3.82865 14.7218 5.02739L15.5 5.75L17.7218 7.8131Z")
      tPath("stroke-width" = "2", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M10 21V17C10 15.8954 10.8954 15 12 15V15C13.1046 15 14 15.8954 14 17V21")


proc SettingsIcon*(class: string): TagRef =
  buildHtml:
    SvgHolder(class):
      tPath("stroke-width" = "2", "stroke-linecap" = "round", "stroke-linejoin" = "round", "d" = "M10.255 4.18806C9.84269 5.17755 8.68655 5.62456 7.71327 5.17535C6.10289 4.4321 4.4321 6.10289 5.17535 7.71327C5.62456 8.68655 5.17755 9.84269 4.18806 10.255C2.63693 10.9013 2.63693 13.0987 4.18806 13.745C5.17755 14.1573 5.62456 15.3135 5.17535 16.2867C4.4321 17.8971 6.10289 19.5679 7.71327 18.8246C8.68655 18.3754 9.84269 18.8224 10.255 19.8119C10.9013 21.3631 13.0987 21.3631 13.745 19.8119C14.1573 18.8224 15.3135 18.3754 16.2867 18.8246C17.8971 19.5679 19.5679 17.8971 18.8246 16.2867C18.3754 15.3135 18.8224 14.1573 19.8119 13.745C21.3631 13.0987 21.3631 10.9013 19.8119 10.255C18.8224 9.84269 18.3754 8.68655 18.8246 7.71327C19.5679 6.10289 17.8971 4.4321 16.2867 5.17535C15.3135 5.62456 14.1573 5.17755 13.745 4.18806C13.0987 2.63693 10.9013 2.63693 10.255 4.18806Z")
      tPath("stroke-width" = "2", "d" = "M15 12C15 13.6569 13.6569 15 12 15C10.3431 15 9 13.6569 9 12C9 10.3431 10.3431 9 12 9C13.6569 9 15 10.3431 15 12Z")
