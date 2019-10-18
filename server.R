# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).

# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    Worldp = 
    # Render a barplot
    barplot(WorldPhones[,input$region]*1000, 
            main=input$region,
            ylab="Number of Telephones")
  })
  
  output$hplot <- renderHighchart ({
    
        highchart() %>% 
      hc_add_series(data = wp,
                       type = "bar",
                    hcaes(y = value*1000,
                          group = variable)) %>% 
      hc_xAxis(categories = wp$Year) %>%
      hc_title(text = "Number of Telephones")  #%>% 
      #hc_plotOptions(series = list(stacking = "normal"))
      #hc_plotOptions(series = list(stacking = "percent"))
      #hc_add_theme(hc_theme_sandsignika())
  })
                       
                       
                       
    
}