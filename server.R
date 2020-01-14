library(datasets)
library(shiny)


shinyServer(function(input, output) {
    
    ## Getting data set
    datasetInput <- reactive({
        switch(input$data,
               "mtcars" = mtcars,
               "ToothGrowth" = ToothGrowth,
               "pressure" = pressure, 
               "trees" = trees)
    })
    
    #$ Generate a summary of the data set
    output$summary <- renderPrint({
        dataset <- datasetInput()
        summary(dataset)
    })
    
    #$ Show the first "n" observations
    output$view <- renderTable({
        head(datasetInput(), n = input$number)
    
    
    })
    
    ## plots the data set if it is checked
    output$plot1 <- renderPlot({
        dataset <- datasetInput()
        n <- input$number
        if(input$showplot){
        plot(head(dataset,n))
        }
    })

})
