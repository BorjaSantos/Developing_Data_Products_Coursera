shinyUI(pageWithSidebar(
  headerPanel("Simple regression models using mtcars database."),
  sidebarPanel(
    h3("The mpg variable will be the dependent variable and the rest of them will be used as predictors."),
    h4("Please, select only one predictor variable."),
    selectInput("id1", "Predictor variables",
                       c("Displacement (cu. in.)"="disp",
                         "hp (Gross horsepower)"="hp",
                         "drat (Rear axle ratio)" = "drat",
                         "wt (Weight (lb/1000))" = "wt",
                         "qsec (1/4 mile time)" = "qsec",
                         "cyl (Number of cylinders)" = "cyl",
                         "vs V/S" = "vs",
                         "am (Transmission (0 = automatic, 1 = manual))" = "am",
                         "gear (Number of forward gears)" = "gear",
                         "carb (Number of carburetors)" = "carb"))
                         
    
),
  mainPanel(
    h3("Model"),
    verbatimTextOutput("mpg_model"),
    h3("Plot"),
    plotOutput("mpgPlot"),
    h3("Diagnostic plots"),
    h4("Residuals vs Fitted"),
    plotOutput("diagnostic1"),
    h4("Normal QQ-plot"),
    plotOutput("diagnostic2")
    
  )
))