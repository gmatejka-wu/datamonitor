## app.R ##
library(shinydashboard)
library(shinythemes)
library(gt)
library(lubridate)
library(dplyr)
library(gt)
library(ggplot2)
library(tidyr)
library(stringr)
library(httr)
library(xts)
library(highcharter)
library(scales)
library(zip)







# ChatGPT Request Function ------------------------------------------------


hey_chatGPT_single <- function(question, mode) {
  api_key <- "API-KEY"
  model <-  "gpt-4o-mini"
  chat_GPT_answer <- POST(
    url = "https://api.openai.com/v1/chat/completions",
    add_headers(Authorization = paste("Bearer", api_key)),
    content_type_json(),
    encode = "json",
    body = list(
      model = model,
      messages = list(
        list(role = "user", content = question)
      ),
      temperature = 0.15
    )
  )
  str_trim(content(chat_GPT_answer)$choices[[1]]$message$content)
}



# UI ----------------------------------------------------------------------


ui <- dashboardPage(
  skin = "black",
  dashboardHeader(title = "Datamonitor [DRAFT] - v 0.01"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Disclaimer", tabName = "tab_disclaimer"),
      menuItem("Overview", tabName = "tab_overview"),
      menuItem("Commodities", tabName = "tab_commodities"),
      menuItem("Strategic Outlook", tabName = "tab_strategic_outlook"),
      menuItem("Data", tabName = "tab_data"),
      menuItem("- - - - - - - - - - - - - - - - - - - - - - -", tabName = "tab_placehoder"),
      menuItem("Components", tabName = "tab_components")
      
    )
    ),


  
  dashboardBody(

    #source("utils/CustomShinyDashboardColors.R"),
    includeCSS("www/custom_design_white.css"),

    tabItems(
      
    tabItem(tabName = "tab_disclaimer",
            fluidPage(
              fluidRow(
              h3("Disclaimer"),
              "This app is currently in development. For questions refer to gabriel.matejka@wu.ac.at"
              )
            )),

    tabItem(tabName = "tab_overview",
            fluidPage(
              h3("Overview Page")
            )),
      
      tabItem(tabName = "tab_commodities",
              fluidPage(
                h3("Commodities")
              )),
    
    tabItem(tabName = "tab_strategic_outlook",
            fluidPage(
              h3("Strategic Outlook")
            )),
      
      tabItem(tabName = "tab_data",
              fluidPage(
                h3("Summary of the Data")
              )),
    
    tabItem(tabName = "tab_placehoder",
            fluidPage(
              h3("- - - - - - - - - - - - - - -")
            )),
    
    tabItem(tabName = "tab_components",
            fluidPage(
              h2("List of Components"),
              h3("Graph"),
              h3("ChatGPT Request"),
              h3("Table"),
            ))
    )))
  



  server <- function(input, output) {}

shinyApp(ui, server)



  
  
  
  
  
  
  