library(shiny)

shinyServer(function(input, output, session) {
  # Store in a convenience variable
  cdata <- session$clientData

  # Values from cdata returned as text
  output$clientdataText <- renderText({
    cnames <- names(cdata)

    allvalues <- lapply(cnames, function(name) {
      paste(name, cdata[[name]], sep = " = ")
    })
    allvalues <- c(
      allvalues,
      paste0("SHINYPROXY_USERNAME = ", Sys.getenv("SHINYPROXY_USERNAME")),
      # only works for shinyproxy version 1.0.0 onwards
      paste0("SHINYPROXY_USERGROUPS = ", Sys.getenv("SHINYPROXY_USERGROUPS")))
    paste(allvalues, collapse = "\n")
  })
})
