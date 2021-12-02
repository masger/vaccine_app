library(DiagrammeR)

cohort_diagram <- grViz(paste0(
  "digraph flowchart {
      
      # a 'graph' statement
      graph [overlap = true, fontsize = 10]
    
  
  # node definitions with substituted label text
      node [fontname = Helvetica, shape = rectangle]
      
      
      tab_start [label = 'Polio']
      
  # Ingen tidligere gyldig vaccination
      tab1 [label = 'Ingen tidligere polio vaccination']
      tab2 [label = 'Tidl vacc, men før alder >=8 uger']
      
      tab3 [label = 'Følg normalt børnevaccinationsprgrogram']
  # 1 tidligere gyldig vaccination
      tab4 [label = '1 tidl vacc givet ved alder >= 8 uger']
      tab5 [label = '1 vacc min. 1 md efter tidligere dose']
      tab6 [label = '1 vacc min 6 md efter anden dose']
      tab7 [label = '1 vacc min 4 år efter tredje dose']
      
  # 2 tidligere vaccinationer
      tab8 [label = '2 tidligere vaccinationer givet ved alder >= 8 uger']
      tab9 [label = '2 tidligere vaccinationer givet med <1 måneds interval']
      tab10 [label = '2 tidligere vaccinationer givet med >=1 måneds interval']
      
  # 3 tidl vaccinationer
      tab11 [label = '3 tidligere vaccinationer givet ved alder >= 8 uger']
      tab12 [label = 'interval ml. 2. og 3. dose < 6 md']
      tab13 [label = 'interval ml. 2 og 3. dose >= 6 md']
      
      
    #############################################################
  
        # edge definitions with the node IDs
      tab_start -> tab1
      tab_start -> tab2
      tab_start -> tab4
      tab_start -> tab8
      tab_start -> tab11
      tab1 -> tab3
      tab2 -> tab3
      tab4 -> tab5
      tab5 -> tab6
      tab6 -> tab7
      tab8 -> tab9
      tab8 -> tab10
      tab9 -> tab5
      tab10 -> tab6
      tab11 -> tab12
      tab11 -> tab13
      tab12 -> tab6
      tab13 -> tab7
  
      ;}"))
cohort_diagram
save_png <- function(plot, path){
  DiagrammeRsvg::export_svg(plot) %>%
    charToRaw() %>%
    rsvg::rsvg() %>%
    png::writePNG(path)
}
save_png(cohort_diagram,"test.png")
export_graph(graph = cohort_diagram,file_name = "test.svg",file_type = "svg")
export_graph(cohort_diagram,
             file_name = "pic.png",
             file_type = "png")
