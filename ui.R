library(shiny)

shinyUI(fluidPage(

    
    titlePanel("Data set summary"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            selectInput("data","Pick a data set:", choices = c("mtcars", "ToothGrowth", "pressure", "trees")),
            numericInput("number", "Number of rows to show:", value = 6),
            checkboxInput("showplot","Showing a simple plot of data", value = F)
            
        ),

        mainPanel(
            ## showing the summary of data and plotting it
            h3("Summary of Dataset:"),
            verbatimTextOutput("summary"),
            h3("Observations of Dataset"),
            tableOutput("view"),
            h3("Plot"),
            plotOutput("plot1")
        )
    )
))
