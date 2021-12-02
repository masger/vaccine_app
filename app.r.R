library(shiny)
library(shinydashboard)
library(data.table)
library(lubridate)
library(dashboardthemes)
library(ggplot2)

ui <- dashboardPage(
  # header --------
  dashboardHeader(title = "Vaccinationsprogram"),
  # sidebar ------
  dashboardSidebar(collapsed = TRUE,
                   sidebarMenu(
                     menuItem(
                       "Udregn vaccine",
                       tabName = "vaccineboard",
                       icon = icon("dashboard")
                     ),
                     menuItem(
                       "Læs om vaccineprogrammet",
                       tabName = "vaccineread",
                       icon = icon("th")
                     )
                   )),
  # Body -----------------------------------------
  dashboardBody(
    shinyDashboardThemes(theme = "blue_gradient"),
    tabItems(
      ## First tab content ---------------------------------
      tabItem(
        tabName = "vaccineboard",
        fluidRow(
          box(
            height = 120,
            width = 2,
            title = "Fødselsdag",
            dateInput('bdate',
                      label = 'Fødselsdato:',
                      value = Sys.Date()),
          ),
          box(
            width = 10,
            "Vaccine plot",
            plotOutput("vaccine_plot"),
            height = 120
          )
        ),
        
        ### vacciner
        fluidRow(
          box(
            title = "Det danske vaccinationsprogram",
            width = 4,
            
            dateInput('dtkp1',
                      label = 'difteri-tetanus-kighoste-polio-Hib 1 og PCV-12:',
                      value = as.Date(NA)),
            dateInput('dtkp2',
                      label = 'difteri-tetanus-kighoste-polio-Hib 1 og PCV-12:',
                      value = as.Date(NA)),
            dateInput('dtkp3',
                      label = 'difteri-tetanus-kighoste-polio-Hib 1 og PCV-12:',
                      value = as.Date(NA)),
            dateInput('mfr1',
                      label = 'MFR:',
                      value = as.Date(NA)),
            dateInput('mfr2',
                      label = 'MFR:',
                      value = as.Date(NA)),
            dateInput('dtkp4',
                      label = 'difteri-tetanus-kighoste-polio revaccination:',
                      value = as.Date(NA)),
            dateInput('hpv1',
                      label = 'HPV 1:',
                      value = as.Date(NA)),
            dateInput('hpv2',
                      label = 'HPV 2:',
                      value = as.Date(NA))
          ),
          
          box(
            width = 8,
            title = "Di-Te-Ki-Po-Hib 1 (Pentavac)",
            #textOutput("dateTextbdate"),
            textOutput("dateTextdtkphib1"),
            textOutput("dateTextdtkphib2"),
            textOutput("dateTextdtkphib3"),
            textOutput("dateTextdtkphib4")
          ),
          box(
            width = 8,
            title = "Di-Te-Ki-Po (Tetravac)",
            textOutput("dateTextdtkp1"),
            textOutput("dateTextdtkp2"),
            textOutput("dateTextdtkp3"),
            textOutput("dateTextdtkp4")
          ),
          box(
            width = 8,
            title = "PCV",
            textOutput("dateTextpcv1"),
            textOutput("dateTextpcv2")
          ),
          box(
            width = 8,
            title = "MFR",
            textOutput("dateTextmfr1"),
            textOutput("dateTextmfr2")
          ),
          box(
            width = 8,
            title = "HPV",
            textOutput("dateTexthpv1"),
            textOutput("dateTexthpv2")
            #textOutput("dateTextbdate"
          )
          
          
        ),
        fluidRow(
          ## Andre vacciner -----------------------------------
          tabBox(
            width = 12,
            # Title can include an icon
            title = "Andre vacciner",
            ## DI-TE-KI -------------------------
            tabPanel(title = "Di-Te-Ki-Po-Hib",
                     fluidRow(
                       box(
                         width = 2,
                         title = "Difteri",
                         dateInput('difteri-other1',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('difteri-other2',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('difteri-other3',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                       ),
                       box(
                         width = 2,
                         title = "Tetanus",
                         dateInput('te-other1',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('te-other2',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('te-other3',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         
                       ),
                       box(
                         width = 2,
                         title = "Kighose",
                         dateInput('ki-other1',
                                   label = 'Kighoste',
                                   value = as.Date(NA)),
                         dateInput('ki-other2',
                                   label = 'Kighoste',
                                   value = as.Date(NA)),
                         dateInput('ki-other3',
                                   label = 'Kighoste',
                                   value = as.Date(NA)),
                         
                       ),
                       box(
                         width = 2,
                         title = "Polio",
                         dateInput('po-other1',
                                   label = 'Polio',
                                   value = as.Date(NA)),
                         dateInput('po-other2',
                                   label = 'Polio',
                                   value = as.Date(NA)),
                         dateInput('po-other3',
                                   label = 'Polio',
                                   value = as.Date(NA)),
                         
                       ),
                       box(
                         width = 2,
                         title = "HiB",
                         dateInput('hib-other1',
                                   label = 'HiB',
                                   value = as.Date(NA)),
                         dateInput('hib-other2',
                                   label = 'HiB',
                                   value = as.Date(NA)),
                         dateInput('hib-other3',
                                   label = 'HiB',
                                   value = as.Date(NA)),
                         
                       ),
                     )),
            ## PCV ---------------------
            tabPanel(title = "PCV",
                     fluidRow(box(
                       width = 4,
                       dateInput('pcv-other1',
                                 label = 'PCV1',
                                 value = as.Date(NA)),
                       dateInput('pcv-other1',
                                 label = 'PCV2',
                                 value = as.Date(NA))
                     ))),
            
            ## MFR --------------------------------------------
            tabPanel(title = "MFR",
                     fluidRow(
                       box(
                         width = 4,
                         title = "Mæslinger",
                         dateInput('m_other1',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('m_other2',
                                   label = 'Difteri',
                                   value = as.Date(NA))
                       ),
                       box(
                         width = 4,
                         title = "Fåresyge",
                         dateInput('f_other1',
                                   label = 'Fåresyge',
                                   value = as.Date(NA)),
                         dateInput('f_other2',
                                   label = 'Fåresyge',
                                   value = as.Date(NA))
                         
                       ),
                       box(
                         width = 4,
                         title = "Røde hunde",
                         dateInput('r_other1',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('r_other2',
                                   label = 'Difteri',
                                   value = as.Date(NA))
                       ),
                     )),
            ## HPV -------------------------------------------
            tabPanel(title = "HPV",
                     fluidRow(box(
                       width = 4,
                       dateInput('hpv-other1',
                                 label = 'HPV',
                                 value = as.Date(NA)),
                       dateInput('hpv-other2',
                                 label = 'HPV',
                                 value = as.Date(NA))
                     ))),
            tabPanel('Medias', tableOutput("show_inputs")),
            tabPanel('test', tableOutput("show_test"))
            
          )
        )
      ),
      # Second tab content
      tabItem(
        tabName = "vaccineread",
        box(
          title = "Det danske børnevaccinationsprogram",
          status = "primary",
          solidHeader = F,
          collapsible = F,
          width = 12,
          fluidRow(
            column(width = 5, textOutput("instructions")),
            column(
              width = 4,
              align = "right",
              img(src = "https://www.ssi.dk/-/media/arkiv/dk/vaccination/boernevaccinationsprogrammet/brnevaccinationsprogrammet-august-2019.png?h=684&w=440&la=da&r=norevisionid", width =
                    300)
            )
          )
        )
      )
    )
  )
)

server <- function(input, output, session) {
  output$instructions <-
    renderText("Text om det danske vaccineprogram")
  
  output$dateTextbdate  <- renderText({
    paste("Fødselsdato er ", as.character(input$bdate))
  })
  
  ### updating inputs based on other vaccines
  observe({
    if (isTruthy(input$m_other1) &
        isTruthy(input$f_other1) & isTruthy(input$r_other1)) {
      updateDateInput(
        session,
        "mfr1",
        label = "new",
        value = pmax(input$m_other1, input$f_other1, input$r_other1)
      )
    }
    if (isTruthy(input$m_other2) &
        isTruthy(input$f_other2) & isTruthy(input$r_other2)) {
      updateDateInput(
        session,
        "mfr2",
        label = "new",
        value = pmax(input$m_other2, input$f_other2, input$r_other2)
      )
    }
    
  })
  
  AllInputs <- reactive({
    myvalues <- NULL
    newvalues <- NULL
    for (i in 1:length(names(input))) {
      newvalues <- data.table(vaccines = as.character(names(input)[i]),
                              dates = as.character(input[[names(input)[i]]]))
      myvalues <- rbind(myvalues, newvalues)
    }
    myvalues[dates != "TRUE" & !is.na(dates)]
  })
  
  output$show_inputs <- renderTable({
    AllInputs()
  })
  
  mfr <- reactive({
    mfr1_date = NULL
    mfr2_date = NULL
    today = as_date(Sys.Date(), origin = "1970-01-01")
    
    if (!isTruthy(input$mfr1)) {
      #MFR ikke givet
      if (input$bdate + months(15) > today) {
        # Alder mindre 15 måneder dags dato
        mfr1_date = input$bdate + 30 * 15
        mfr2_date = input$bdate + 365 * 4
      }  else {
        # Alder mere end 15 måneder dags dato
        mfr1_date = today
        mfr2_date = today + 365 * 2.5
      }
    } else {
      # MFR givet
      if (input$mfr1 > input$bdate + months(12)) {
        # mere end 12 mdr på vaccine tidspunkt
        if (isTruthy(input$mfr1) & isTruthy(input$mfr2)) {
          # modtaget to vacciner
          if (abs(difftime(input$mfr2, input$mfr1, units = "days")) > 30) {
            # modtaget to vacciner med mindst en måned imellem
            mfr1_date = input$mfr1
            mfr2_date = input$mfr2
          } else {
            mfr1_date = input$mfr1
            mfr2_date = input$mfr1 + 365 * 2.5
          }
        } else {
          # modtaget en vaccine
          mfr1_date = input$mfr1
          mfr2_date = input$mfr1 + 365 * 2.5
        }
      } else {
        # mindre end 12 mdr på vaccine tidspunkt
        if (input$bdate + months(15) > today) {
          # mindre end 15 måneder
          mfr1_date = input$bdate + 30 * 15
          mfr2_date = input$bdate + 365 * 4
        }  else {
          # ældre end 15 måneder
          mfr1_date = today
          mfr2_date = today + 365 * 2.5
        }
        
      }
    }
    mfr1_text = as.character(as_date(mfr1_date, origin = "1970-01-01"))
    mfr2_text = as.character(as_date(mfr2_date, origin = "1970-01-01"))
    
    rbind(mfr1_text, mfr2_text)
  })
  
  dtkp <- reactive({
    dtkp1_date = input$bdate + 30 * 3
    dtkp2_date = input$bdate + 30 * 5
    dtkp3_date = input$bdate + 365
    dtkp4_date = input$bdate + 365 * 5
    today = as_date(Sys.Date(), origin = "1970-01-01")
    
    #    if ((isTruthy(input$dtkp1) | input$dtkp1 < input$bdate + 8*7)) {
    #DTKP ikke givet eller under 8 uger
    # følge vaccine
    #    } else {
    if (isTruthy(input$dtkp1)) {
      # mere end 8 uger på vaccine tidspunkt
      if (input$dtkp1 > input$bdate + 8 * 7) {
        dtkp1_date = input$dtkp1
        dtkp2_date = input$dtkp1 + 60
        dtkp3_date = dtkp2_date + 30 * 6
        dtkp4_date = dtkp3_date + 365 * 4
        
        if (isTruthy(input$dtkp2)) {
          # hvis 2 vacciner givet
          if (input$dtkp1 + 30 < input$dtkp2) {
            # hvis to vacciner givet med over 1 måned
            dtkp2_date = input$dtkp2
            dtkp3_date = dtkp2_date + 30 * 6
            dtkp4_date = dtkp3_date + 365 * 4
            
            if(isTruthy(input$dtkp3)) {
              if(input$dtkp2 + 30*6 < input$dtkp3) {
                dtkp3_date = input$dtkp3
                dtkp4_date = dtkp3_date + 365 * 4
                
                if(isTruthy(input$dtk4)) {
                  if(input$dtkp3 + 365*4 < input$dtkp4) {
                    dtkp4_date = input$dtkp4
                    
                  }
                }
                
              }
              
            }
            
          } else {
            # hvis to vacciner givet med UNDER 1 måned
            dtkp1_date = input$dtkp1
            dtkp2_date = input$dtkp1 + 60
            dtkp3_date = dtkp2_date + 30 * 6
            dtkp4_date = dtkp3_date + 365 * 4
          }
          
        }
        
      }
    }
    
    
    dtkp1_text = as.character(as_date(dtkp1_date, origin = "1970-01-01"))
    dtkp2_text = as.character(as_date(dtkp2_date, origin = "1970-01-01"))
    dtkp3_text = as.character(as_date(dtkp3_date, origin = "1970-01-01"))
    dtkp4_text = as.character(as_date(dtkp4_date, origin = "1970-01-01"))
    
    rbind(dtkp1_text, dtkp2_text, dtkp3_text, dtkp4_text)
  })
  
  output$show_test <- renderTable({
    dtkp()
  })
  
  
  
  output$vaccine_plot <- renderPlot(
    height = 100,
    ggplot(AllInputs(), aes(x = as_date(dates), y = 1)) +
      geom_point(size = 4) +
      ggrepel::geom_text_repel(aes(x = as_date(dates), label = vaccines)) +
      theme_bw() +
      labs(y = "", x = "Dato") +
      theme(axis.text.y.left = element_blank())
  )
  
  
  ### DTKP
  output$dateTextdtkp1  <- renderText({
    dtkp()[[1]]
  })
  
  output$dateTextdtkp2  <- renderText({
    dtkp()[[2]]
  })
  
  output$dateTextdtkp3  <- renderText({
    dtkp()[[3]]
  })
  output$dateTextdtkp4  <- renderText({
    dtkp()[[4]]
    
  })
  ## MFR
  output$dateTextmfr1  <- renderText({
    mfr()[[1]]
  })
  output$dateTextmfr2  <- renderText({
    mfr()[[2]]
  })
  
  
  output$dateTexthpv1  <- renderText({
    if (!isTruthy(input$hpv1)) {
      paste("hpv-1 skal gives", input$bdate + years(12))
    } else {
      paste("hpv-1 givet den", input$hpv1)
    }
  })
  output$dateTexthpv2  <- renderText({
    if (!isTruthy(input$hpv2)) {
      paste("hpv-2 skal gives", input$bdate + years(12) + months(5))
    } else {
      paste("hpv-2 givet den", input$hpv2)
    }
  })
  
  
}

shinyApp(ui, server)