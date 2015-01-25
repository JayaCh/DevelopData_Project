##  FileName: server.R

##  Description: The server side code the computes MPG prediction.
##
##      'mtcars' data set is used to create a 'LM' model based on the
##      predictors - cyl, hp, weight and transmission type.  

library(shiny)
library(caret)
library(RcppEigen)

data(mtcars)
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))  # Converting Trasmission to Factor

bestFit <- lm(mpg ~ cyl + hp + wt + am, data = mtcars)
predictMPG <- function (cyl, horse, weight, trans)
{
    newdata <- data.frame(cyl=cyl, hp=horse, wt=weight, am=trans)
    res <-round(predict(bestFit, newdata)[[1]], 2)
    res
}
shinyServer(
    function(input, output) { 
            output$ocyl <- renderPrint({input$cyl})
            output$ohorse <- renderPrint(input$horse)
            output$oweight <- renderPrint(input$weight)
            output$otrans <- renderPrint(input$trans)
            output$oPrediction <- renderPrint(predictMPG(input$cyl, input$horse, input$weight/1000, input$trans))
            }
        
)