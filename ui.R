# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Telephones by region"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectizeInput("region", "Region:", 
                  choices=colnames(WorldPhones),
                  multiple = F,
                  selected = "N.Amer"),
      hr(),
      helpText("Data from AT&T (1961) The World's Telephones.")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("phonePlot")),
                  tabPanel("D3",  highchartOutput("hplot", height = "500px")),
                  tabPanel("About", includeHTML("My About File.htm")))
    )
    
  )
)