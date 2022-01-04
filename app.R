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
            height = 150,
            width = 2,
            title = "Fødselsdato",
            dateInput('bdate',
                      label = 'Fødselsdato:',
                      value = Sys.Date()),
          ),
          box(
            width = 10,
            "Vaccine timeline",
            plotOutput("vaccine_plot"),
            height = 150
          )
        ),

        ### vacciner
        fluidRow(
          tabBox(width = 4,

          tabPanel(title = "DiTeKiPol-Hib + PCV",
            dateInput('dtkp1',
                      label = 'Pentavac (DiTeKiPol-Hib):',
                      value = as.Date(NA)),
            dateInput('dtkp2',
                      label = 'Pentavac (DiTeKiPol-Hib):',
                      value = as.Date(NA)),
            dateInput('dtkp3',
                      label = 'Pentavac (DiTeKiPol-Hib):',
                      value = as.Date(NA)),
            dateInput('dtkp4',
                      label = 'Tetravac booster (DiTeKiPol):',
                      value = as.Date(NA)),

            dateInput('pcv1',
                      label = 'PCV-12:',
                      value = as.Date(NA)),
            dateInput('pcv2',
                      label = 'PCV-12:',
                      value = as.Date(NA)),
            dateInput('pcv3',
                      label = 'PCV-12:',
                      value = as.Date(NA))),
          tabPanel(title = "MFR og HPV",
            dateInput('mfr1',
                      label = 'MFR:',
                      value = as.Date(NA)),
            dateInput('mfr2',
                      label = 'MFR:',
                      value = as.Date(NA)),

            dateInput('hpv1',
                      label = 'HPV 1:',
                      value = as.Date(NA)),
            dateInput('hpv2',
                      label = 'HPV 2:',
                      value = as.Date(NA))
          )),

          box(width = 8,
            #textOutput("dateTextbdate"),
            h3("DiTeKiPol-Hib"),
            textOutput("dateTextdtkp1"),
            textOutput("dateTextdtkp2"),
            textOutput("dateTextdtkp3"),
            textOutput("dateTextdtkp4"),
            h3("PCV"),

            textOutput("dateTextpcv1"),
            textOutput("dateTextpcv2"),
            textOutput("dateTextpcv3"),
            h3("MFR"),
            textOutput("dateTextmfr1"),
            textOutput("dateTextmfr2"),
            h3("HPV"),
            textOutput("dateTexthpv1"),
            textOutput("dateTexthpv2"),
            textOutput("dateTexthpv3"),
            #textOutput("dateTextbdate"

            uiOutput("hib_box"))


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
                         title = "Di-Te-Ki-Po",
                         dateInput('dtkp_other1',
                                   label = 'Di-Te-Ki-Po',
                                   value = as.Date(NA)),
                         dateInput('dtkp_other2',
                                   label = 'Di-Te-Ki-Po',
                                   value = as.Date(NA)),
                         dateInput('dtkp_other3',
                                   label = 'Di-Te-Ki-Po',
                                   value = as.Date(NA)),
                       ),
                       box(
                         width = 2,
                         title = "Difteri",
                         dateInput('di_other1',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('di_other2',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('di_other3',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                       ),
                       box(
                         width = 2,
                         title = "Tetanus",
                         dateInput('te_other1',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('te_other2',
                                   label = 'Difteri',
                                   value = as.Date(NA)),
                         dateInput('te_other3',
                                   label = 'Difteri',
                                   value = as.Date(NA)),

                       ),
                       box(
                         width = 2,
                         title = "Kighose",
                         dateInput('ki_other1',
                                   label = 'Kighoste',
                                   value = as.Date(NA)),
                         dateInput('ki_other2',
                                   label = 'Kighoste',
                                   value = as.Date(NA)),
                         dateInput('ki_other3',
                                   label = 'Kighoste',
                                   value = as.Date(NA)),

                       ),
                       box(
                         width = 2,
                         title = "Polio",
                         dateInput('po_other1',
                                   label = 'Polio',
                                   value = as.Date(NA)),
                         dateInput('po_other2',
                                   label = 'Polio',
                                   value = as.Date(NA)),
                         dateInput('po_other3',
                                   label = 'Polio',
                                   value = as.Date(NA)),

                       ),
                       box(
                         width = 2,
                         title = "HiB",
                         dateInput('hib_other1',
                                   label = 'HiB',
                                   value = as.Date(NA)),
                         dateInput('hib_other2',
                                   label = 'HiB',
                                   value = as.Date(NA)),
                         dateInput('hib_other3',
                                   label = 'HiB',
                                   value = as.Date(NA)),

                       ),
                     )),
            ## PCV ---------------------
            tabPanel(title = "PCV",
                     fluidRow(box(
                       width = 4,
                       dateInput('pcv_other1',
                                 label = 'PCV1',
                                 value = as.Date(NA)),
                       dateInput('pcv_other1',
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
        value = pmax(input$m_other1, input$f_other1, input$r_other1)
      )
    }
    if (isTruthy(input$m_other2) &
        isTruthy(input$f_other2) & isTruthy(input$r_other2)) {
      updateDateInput(
        session,
        "mfr2",
        value = pmax(input$m_other2, input$f_other2, input$r_other2)
      )
    }
    if (isTruthy(input$di_other1) &
        isTruthy(input$te_other1) & isTruthy(input$ki_other1) &
        isTruthy(input$po_other1)) {
      updateDateInput(
        session,
        "dtkp_other1",
        value = pmax(
          input$di_other1,
          input$te_other1,
          input$ki_other1,
          input$po_other1
        )
      )
    }
    if (isTruthy(input$di_other2) &
        isTruthy(input$te_other2) & isTruthy(input$ki_other2) &
        isTruthy(input$po_other2)) {
      updateDateInput(
        session,
        "dtkp_other2",
        value = pmax(
          input$di_other2,
          input$te_other2,
          input$ki_other2,
          input$po_other2
        )
      )
    }
    if (isTruthy(input$di_other3) &
        isTruthy(input$te_other3) & isTruthy(input$ki_other3) &
        isTruthy(input$po_other3)) {
      updateDateInput(
        session,
        "dtkp_other3",

        value = pmax(
          input$di_other3,
          input$te_other3,
          input$ki_other3,
          input$po_other3
        )
      )
    }
    if (isTruthy(input$di_other4) &
        isTruthy(input$te_other4) & isTruthy(input$ki_other4) &
        isTruthy(input$po_other4)) {
      updateDateInput(
        session,
        "dtkp_other4",

        value = pmax(
          input$di_other4,
          input$te_other4,
          input$ki_other4,
          input$po_other4
        )
      )
    }






  })

  AllInputs <- reactive({
    myvalues <- NULL
    newvalues <- NULL
    name_df <- data.table(vaccines = c("bdate"	,"dtkp1","dtkp2","dtkp3","dtkp4",
                                        "pcv1",	"pcv2","pcv3",
                                        "mfr1",	"mfr2",
                                        "di_other1","di_other2","di_other3","di_other4",
                                        "te_other1","te_other2","te_other3","te_other4",
                                        "ki_other1","ki_other2","ki_other3","ki_other4",
                                        "po_other1","po_other2","po_other3","po_other4",
                                        "hib_other1","hib_other2","hib_other3","hib_other4",
                                        "pcv_other1","pcv_other2","pcv_other3",
                                        "m_other1","m_other2",
                                        "f_other1","f_other2",
                                        "r_other1","r_other2",
                                        "hpv-other1","hpv-other2"),

                          name = c("Fødselsdag",
                                   "DTKP","DTKP","DTKP","DTKP",
                                   "PCV","PCV","PCV",
                                   "MFR","MFR",
                                   "DI","DI","DI","DI",
                                   rep("TE",4),
                                   rep("KI",4),
                                   rep("PO",4),
                                   rep("HiB",4),
                                   rep("PCV",3),
                                   rep("M",2),
                                   rep("F",2),
                                   rep("R",2),
                                   rep("HPV",2)))


    for (i in 1:length(names(input))) {
      newvalues <- data.table(vaccines = as.character(names(input)[i]),
                              dates = as.character(input[[names(input)[i]]]))
      myvalues <- rbind(myvalues, newvalues)
    }
    myvalues = name_df[myvalues,on = "vaccines"]
    myvalues[dates != "TRUE" & !is.na(dates)]
  })

  output$show_inputs <- renderTable({
    AllInputs()
  })

  ### MFR vaccine
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

  #### DTKP
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

            if (isTruthy(input$dtkp3)) {
              if (input$dtkp2 + 30 * 6 < input$dtkp3) {
                dtkp3_date = input$dtkp3
                dtkp4_date = dtkp3_date + 365 * 4

                if (isTruthy(input$dtk4)) {
                  if (input$dtkp3 + 365 * 4 < input$dtkp4) {
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

  # polio <- reactive({
  #   pol1_date = input$bdate + 30 * 3
  #   pol2_date = input$bdate + 30 * 5
  #   pol3_date = input$bdate + 365
  #   pol4_date = input$bdate + 365 * 5
  #   today = as_date(Sys.Date(), origin = "1970-01-01")
  #
  #   #    if ((isTruthy(input$dtkp1) | input$dtkp1 < input$bdate + 8*7)) {
  #   #DTKP ikke givet eller under 8 uger
  #   # følge vaccine
  #   #    } else {
  #   if (isTruthy(input$dtkp1)) {
  #     # mere end 8 uger på vaccine tidspunkt
  #     if (input$dtkp1 > input$bdate + 8 * 7) {
  #       dtkp1_date = input$dtkp1
  #       dtkp2_date = input$dtkp1 + 60
  #       dtkp3_date = dtkp2_date + 30 * 6
  #       dtkp4_date = dtkp3_date + 365 * 4
  #
  #       if (isTruthy(input$dtkp2)) {
  #         # hvis 2 vacciner givet
  #         if (input$dtkp1 + 30 < input$dtkp2) {
  #           # hvis to vacciner givet med over 1 måned
  #           dtkp2_date = input$dtkp2
  #           dtkp3_date = dtkp2_date + 30 * 6
  #           dtkp4_date = dtkp3_date + 365 * 4
  #
  #           if (isTruthy(input$dtkp3)) {
  #             if (input$dtkp2 + 30 * 6 < input$dtkp3) {
  #               dtkp3_date = input$dtkp3
  #               dtkp4_date = dtkp3_date + 365 * 4
  #
  #               if (isTruthy(input$dtk4)) {
  #                 if (input$dtkp3 + 365 * 4 < input$dtkp4) {
  #                   dtkp4_date = input$dtkp4
  #
  #                 }
  #               }
  #
  #             }
  #
  #           }
  #
  #         } else {
  #           # hvis to vacciner givet med UNDER 1 måned
  #           dtkp1_date = input$dtkp1
  #           dtkp2_date = input$dtkp1 + 60
  #           dtkp3_date = dtkp2_date + 30 * 6
  #           dtkp4_date = dtkp3_date + 365 * 4
  #         }
  #
  #       }
  #
  #     }
  #   }
  #
  #
  #   dtkp1_text = as.character(as_date(dtkp1_date, origin = "1970-01-01"))
  #   dtkp2_text = as.character(as_date(dtkp2_date, origin = "1970-01-01"))
  #   dtkp3_text = as.character(as_date(dtkp3_date, origin = "1970-01-01"))
  #   dtkp4_text = as.character(as_date(dtkp4_date, origin = "1970-01-01"))
  #
  #   rbind(dtkp1_text, dtkp2_text, dtkp3_text, dtkp4_text)
  # })

  ### PCV
  pcv <- reactive({
    pcv1_date = input$bdate + 30 * 3
    pcv2_date = input$bdate + 30 * 5
    pcv3_date = input$bdate + 365
    today = as_date(Sys.Date(), origin = "1970-01-01")


    if (isTruthy(input$pcv1)) {
      # børn mindre end et år skal have tre vacciner
      if (input$pcv1 < input$bdate + 365) {
        pcv1_date = input$pcv1
        pcv2_date = input$pcv1 + 60
        pcv3_date = pcv2_date + 30 * 6

        if (isTruthy(input$pcv2)) {
          # hvis 2 vacciner givet
          if (input$pcv1 + 30 < input$pcv2) {
            # hvis to vacciner givet med over 1 måned
            pcv2_date = input$pcv2
            pcv3_date = pcv2_date + 30 * 6

            if (isTruthy(input$pcv3)) {
              # hvis tre vacciner givet med over 2 måned
              if (input$pcv2 + 30 * 2 < input$pcv3) {
                pcv3_date = input$pcv3

              }

            }

          }

        }

      } else {
        # hvis to vacciner givet med UNDER 1 måned
        pcv1_date = input$pcv1
        if (isTruthy(input$pcv2)) {
          # hvis 2 vacciner givet
          if (input$pcv1 + 30 < input$pcv2) {
            # hvis to vacciner givet med over 1 måned
            pcv2_date = input$pcv2


          }
        }
      }
      # if (input$bdate > today - 365 * 2) {
      #   pcv1_text = as.character(as_date(pcv1_date, origin = "1970-01-01"))
      #   pcv2_text = as.character(as_date(pcv2_date, origin = "1970-01-01"))
      #   pcv3_text = as.character(as_date(pcv3_date, origin = "1970-01-01"))
      # } else {
      #   pcv1_text = "Børn over 2 skal kun vaccineres ved særlig høj risikogruppe"
      #   pcv2_text = ""
      #   pcv3_text = ""
      # }

    }
    pcv1_text = as.character(as_date(pcv1_date, origin = "1970-01-01"))
    pcv2_text = as.character(as_date(pcv2_date, origin = "1970-01-01"))
    pcv3_text = as.character(as_date(pcv3_date, origin = "1970-01-01"))

    rbind(pcv1_text, pcv2_text, pcv3_text)

  })

  ### HPV
  hpv <- reactive({
    hpv1_date = input$bdate + 365 * 12
    hpv2_date = input$bdate + 365 * 12 + 30 * 6
    hpv3_date = NA_Date_
    today = as_date(Sys.Date(), origin = "1970-01-01")

    if (isTruthy(input$hpv1)) {
      # mere end 8 uger på vaccine tidspunkt
      if (input$hpv1 > input$bdate + 12 * 365) {
        hpv1_date = input$hpv1
        hpv2_date = input$hpv1 + 30 * 6

        if (isTruthy(input$hpv2)) {
          # hvis 2 vacciner givet, skal det være inden for 5 måneder og max 13 måneder
          if (input$hpv1 + 30 * 5 < input$hpv2 &
              input$hpv1 + 30 * 13 > input$hpv2) {
            # hvis to vacciner givet med over 1 måned
            hpv2_date = input$hpv2
          } else {
            hpv_temp = input$hpv2 + 30 * 3
            hpv3_date = min(hpv_temp, today)
          }

        }

      }

    }

    hpv1_text = as.character(as_date(hpv1_date, origin = "1970-01-01"))
    hpv2_text = as.character(as_date(hpv2_date, origin = "1970-01-01"))
    hpv3_text = fifelse(is.na(hpv3_date), "", as.character(as_date(hpv3_date, origin = "1970-01-01")))

    rbind(hpv1_text, hpv2_text, hpv3_text)
  })




  ### HIB
  hib <- reactive({
    hib1_date = input$bdate + 30 * 3
    hib2_date = input$bdate + 30 * 5
    hib3_date = input$bdate + 365
    hib_special = 0
    today = Sys.Date()
    # barn har fået tetravac og ikke pentavac
    if (isTruthy(input$dtkp_other1) & !isTruthy(input$dtkp1)) {
      hib_special = 1
      if (isTruthy(input$hib_other1)) {
        # mere end 8 uger på vaccine tidspunkt
        if (input$hib_other1 > input$bdate + 8 * 7) {
          hib1_date = input$hib_other1
          hib2_date = input$hib_other1 + 60
          hib3_date = hib2_date + 30 * 6
        }
        if (input$bdate + months(12) > today &
            input$bdate + years(5) < today &
            !hib1_date == input$hib_other1) {
          hib1_date = Sys.Date()
          hib2_date = NA_Date_
          hib3_date = NA_Date_
        }

      }
      # alder mellem 5-12 måneder
      if (input$bdate + months(5) > today &
          input$bdate + months(12) < today &
          !isTruthy(input$hib_other1)) {
        hib1_date = Sys.Date()
        hib2_date = Sys.Date() + months(2)
        hib3_date = NA_Date_
      }
    }

    hib1_text = as.character(as_date(hib1_date, origin = "1970-01-01"))
    hib2_text = as.character(as_date(hib2_date, origin = "1970-01-01"))
    hib3_text = fifelse(is.na(hib3_date), "", as.character(as_date(hib3_date, origin = "1970-01-01")))

    rbind(hib1_text, hib2_text, hib3_text,hib_special)

  })

  output$show_test <- renderTable({

    hpv()

  })

  output[["hib_box"]] <- renderUI({

    if(hib()[4] == 0)return()
    box(
      width = 8,
      title = "HIB",
      textOutput("dateTexthib")
      #textOutput("dateTextbdate"
    )

  })




  output$vaccine_plot <- renderPlot(
    height = 100,

    ggplot(AllInputs(), aes(
      x = as_date(dates),
      y = 1,
      col = as_date(dates) > Sys.Date()
    )) +
      geom_point(size = 4) +
      ggrepel::geom_text_repel(aes(x = as_date(dates), label = name)) +
      theme_bw() +
      labs(y = "", x = "") +
      guides(col = "none") +
      ggsci::scale_color_d3() +
      theme(axis.text.y.left = element_blank())
  )


  ### DTKP
  output$dateTextdtkp1  <- renderText({
    paste0(
      "Første vaccine med DTKP-Hib ",
      ifelse(dtkp()[[1]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      dtkp()[[1]]
    )
  })

  output$dateTextdtkp2  <- renderText({
    paste0(
      "Anden vaccine med DTKP-Hib ",
      ifelse(dtkp()[[2]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      dtkp()[[2]]
    )
  })

  output$dateTextdtkp3  <- renderText({
    paste0(
      "Tredje vaccine med DTKP-Hib ",
      ifelse(dtkp()[[3]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      dtkp()[[3]]
    )
  })
  output$dateTextdtkp4  <- renderText({
    paste0(
      "Booster vaccine med DTKP ",
      ifelse(dtkp()[[4]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      dtkp()[[4]]
    )

  })
  ## PCV
  output$dateTextpcv1  <- renderText({
    paste0(
      "Første vaccine med PCV ",
      ifelse(pcv()[[1]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      pcv()[[1]]
    )
  })
  output$dateTextpcv2  <- renderText({
    paste0(
      "Anden vaccine med PCV ",
      ifelse(pcv()[[2]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      pcv()[[2]]
    )
  })
  output$dateTextpcv3  <- renderText({
    paste0(
      "Tredje vaccine med PCV ",
      ifelse(pcv()[[3]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      pcv()[[3]]
    )
  })
  output$dateTexthib  <- renderText({
    paste0("OBS, HiB skal gives:",
           " Første stik: ", hib()[1],
           " Andet stik: ", hib()[2],
           " Trejde stik: ",hib()[3])

  })


  ## MFR
  output$dateTextmfr1  <- renderText({
    paste0(
      "Første vaccine med MFR ",
      ifelse(mfr()[[1]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      mfr()[[1]]
    )
  })
  output$dateTextmfr2  <- renderText({
    paste0(
      "Anden vaccine med MFR ",
      ifelse(mfr()[[2]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      mfr()[[2]]
    )
  })


  output$dateTexthpv1  <- renderText({
    paste0(
      "Første vaccine med HPV ",
      ifelse(hpv()[[1]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      hpv()[[1]]
    )
  })

  output$dateTexthpv2  <- renderText({
    paste0(
      "Anden vaccine med HPV ",
      ifelse(hpv()[[1]] > Sys.Date(), "skal gives", "er givet"),
      " d. ",
      hpv()[[1]]
    )
  })
  output$dateTexthpv3  <- renderText({
    if (hpv()[[3]] == "") {
      paste0("Tredje vaccine med HPV skal kun gives ved misset interval")

    } else {
      paste0(
        "Trejde vaccine med HPV ",
        ifelse(hpv()[[3]] > Sys.Date(), "skal gives", "er givet"),
        " d. ",
        hpv()[[3]]
      )
    }
  })


}

shinyApp(ui, server)
