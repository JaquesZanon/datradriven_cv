devtools::install_github("nstrayer/datadrivencv")
devtools::install_github('mitchelloharawild/icons')

#library(googlesheets4)
#gs4_auth_configure(api_key = ".....")
#read_sheet("https://docs.google.com/spreadsheets/d/1uWsN_sXHwTmbgmNGUAy6FSFs4kEFJ_6li6SFR5UsutU/edit#gid=0")

#install.packages(googlesheets)
#library(googlesheets)
#gs_auth(new_user = TRUE)
#gs_ls()


#downloading the raw zip package
library(devtools)
install_local("C:/Users/jaque/Desktop/datadrivencv-master.zip")
library("datadrivencv")

datadrivencv::use_datadriven_cv(full_name = "My Name")





use_datadriven_cv(
  full_name = "Jaques Everton Zanon",
  data_location = "C:/Users/jaque/Desktop/Nova pasta/tabelas/",
  source_location = getwd(),
  output_dir = getwd())
use_datadriven_cv(
    full_name = "Jaques Everton Zanon",
    data_location = "https://docs.google.com/spreadsheets/d/1uWsN_sXHwTmbgmNGUAy6FSFs4kEFJ_6li6SFR5UsutU/edit#gid=0",
    pdf_location = diretorio,
    html_location = diretorio,
    source_location = "https://github.com/nstrayer/cv")
 
use_datadriven_cv(
  full_name = "Sarah Arcos",
  data_location = "C:/Users/jaque/Desktop/Nova pasta/data/",
  pdf_location = "https://github.com/nstrayer/cv/raw/master/strayer_cv.pdf",
  html_location = "nickstrayer.me/datadrivencv/",
  source_location = "https://github.com/nstrayer/datadrivencv",
  which_files = "all",
  output_dir = getwd(),
  create_output_dir = FALSE,
  use_network_logo = TRUE,
  open_files = TRUE
)

use_datadriven_cv(
  full_name = "Jaques E. Zanon",
  data_location = "C:/Users/jaque/Desktop/Nova pasta/data/",
  pdf_location = "https://github.com/nstrayer/cv/raw/master/strayer_cv.pdf",
  html_location = "nickstrayer.me/datadrivencv/",
  source_location = "https://github.com/nstrayer/datadrivencv",
  which_files = "all",
  output_dir = getwd(),
  create_output_dir = FALSE,
  use_network_logo = TRUE,
  open_files = TRUE
)





   

  
  use_csv_data_storage()
?use_csv_data_storage  
  temp_dir <- fs::dir_create(fs::path(tempdir(), "cv_w_csvs"))
  datadrivencv::use_csv_data_storage(
    folder_name = fs::path(temp_dir, "csv_data"),
    create_output_dir = TRUE
  )
  list.files(fs::path(temp_dir, "csv_data"))

  rmarkdown::render("cv.rmd",
                    params = list(pdf_mode = FALSE),
                    output_file = "cv.html")
  
  # Knit the PDF version to temporary html location
  tmp_html_cv_loc <- fs::file_temp(ext = ".html")
  rmarkdown::render("cv.rmd",
                    params = list(pdf_mode = TRUE),
                    output_file = tmp_html_cv_loc)
  
  # Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html_cv_loc,
                         output = "cv.pdf")
    
