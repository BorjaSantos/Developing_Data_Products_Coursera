# BORRADOR DE ANALISIS PARA LA APLICACION SHINY.

# Base de datos mtcars

library(shiny)
library(datasets)

# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application
database <- mtcars
database$cyl <- as.factor(database$cyl)
database$vs <- as.factor(database$vs)
database$am <- as.factor(database$am)
database$gear <- as.factor(database$gear)
database$carb <- as.factor(database$carb)
attach(database)
# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("mpg ~", input$id1)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate  plots of the requested variable against mpg
  
  output$mpg_model <- renderPrint(summary(lm(as.formula(formulaText()))))
  output$mpgPlot <- renderPlot({
    plot(as.formula(formulaText()), 
            data = database,ylab="Miles per Gallon",main=formulaText(),col="red",pch=16)
  })
  output$diagnostic1 <- renderPlot(plot(lm(as.formula(formulaText())),which=1,col="blue",pch=16))
  output$diagnostic2 <- renderPlot(plot(lm(as.formula(formulaText())),which=2,col="blue",pch=16))
})
