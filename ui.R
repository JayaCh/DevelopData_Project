##      FineName: ui.R
##     Description:  This page shows the MPG prediction of car based on some
##      feature inputs that the user enters.
##      INPUT: Required entires of the car are
##          1) Cylinders of the car, 
##          2) Horse Power of the car,
##          3) Weight of the car,
##          4) Transmission Type.

library(shiny)
library(caret)
library(RcppEigen)

shinyUI (
    pageWithSidebar (
        # Application title
        headerPanel ("Predict Your Vehicle's MPG"),
        
        sidebarPanel (
            numericInput('cyl', 'Cylinders', 4, min = 3, max= 8, step = 1),
            numericInput('horse', 'Horsepower', 100, min = 50, max= 230, step = 5),
            numericInput('weight', 'Weight', 3000, min = 1650, max= 5000, step = 50),
            selectInput("trans", "Transmission type", c ("Automatic", "Manual") ),
            submitButton('Submit')
        ),
        mainPanel (
            p("This Shiny app predicts the Miles Per Gallon (MPG) of a car based on the user inputs on the side panel.
            Update any input value on the side panel and check the **Miles Per Gallon for this car** value in the main pannel."),
            p("Predicted Miles Per Gallon for this car is based on the linear model, that is calculated with the inputs from the UI."),
            h3 ('Car features Selected'),
            h4 ('Cylinder'),
            verbatimTextOutput("ocyl"),
            h4('HorsePower'),
            verbatimTextOutput("ohorse"),
            h4('Weight in lbs'),
            verbatimTextOutput("oweight"),
            h4('Tranmission Type'),
            verbatimTextOutput("otrans"),
            h3 ("MPG Prediction"),
            h4("Miles per Gallon for this car"),
            verbatimTextOutput("oPrediction")
        )
    )
    
)