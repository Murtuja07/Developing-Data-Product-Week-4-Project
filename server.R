#This is the server file for Regression analysis of different dimensions of mtcars dataset by Shiny application
#Author: Md Golam Murtuja
#Date: 10 Nov 2018

library(shiny)

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({

    mtcars.cyl.formula <- mtcars[,input$variable1] ~ mtcars[,input$variable2]
    mtcars.cyl.lm <- lm(formula=mtcars.cyl.formula, data=mtcars)
  
    
    # Scatter diagram with the specified value of mpg
    plot(mtcars.cyl.formula, data=mtcars, xlab = input$variable1, ylab = input$variable2)
    if (input$Abline){abline(mtcars.cyl.lm,col="Green")}
    
  })
  
})