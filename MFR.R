library(DiagrammeR)

cohort_diagram <- grViz(paste0(
  "digraph flowchart {
      
      # a 'graph' statement
      graph [overlap = true, fontsize = 10]
    
  
  # node definitions with substituted label text
      node [fontname = Helvetica, shape = rectangle]
      
      tab_start [label = 'MFR vaccine givet eller M, F og R givet seperat']
      tab_nej [label = 'Nej']

      tab1 [label = 'Alder på vaccinetidspunkt for første vaccine /n eller seneste vaccine hvis M F og R givet seperat']
      tab2 [label = '<12 mdr']
      tab3 [label = '>12 mdr']
  # over 12 måneder
      tab4 [label = '<15 mdr i dag']
      tab5 [label = '>15 mdr i dag']
  # under 15 måneder nu
      tab6 [label = 'DVP']
  # over 15 måneder nu
      tab7 [label = 'Vaccine nu og om 2½ år']
  # Over 12 måneder på vaccinetidspunkt
      tab8 [label = 'En MFR givet']
      tab10 [label = 'Ny MFR 2½ år efter MFR vaccine']
      tab11 [label = 'Giv MFR nu og om 2½ år']
  # To MFR givet    
      tab12 [label = 'To MFR givet']
      tab13 [label = '>1 måned mellem de to vacciner']
      tab14 [label = '<1 måned mellem de to vacciner']
      tab15 [label = 'Giv en MFR 2½ år efter første vaccine']
  
      # edge definitions with the node IDs
      tab_start -> tab1
      tab_start -> tab_nej
      tab_nej -> tab4
      tab_nej -> tab5
  
      tab1 -> tab2 
      tab1 -> tab3
      
      tab2 -> tab4
      tab2 -> tab5
      tab4 -> tab6
      tab5 -> tab7
  
      tab3 -> tab8

      tab8 -> tab10

      tab3 -> tab12
      tab12 -> tab13
      tab12 -> tab14
      tab14 -> tab15
  
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
