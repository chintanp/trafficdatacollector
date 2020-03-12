GlobalModule <- function(input, output, session) {
  stash = reactiveValues()
  #####################
  # Database connection
  #####################
  if (Sys.info()['sysname'] == "Windows") {
    # on windows the driver is different than linux
    stash$conn <- DBI::dbConnect(
      odbc::odbc(),
      Driver = "SQL Server",
      Server = Sys.getenv('DB_HOST'),
      Database = Sys.getenv('DB_NAME'),
      UID      = Sys.getenv('DB_USERNAME'),
      PWD      = Sys.getenv('DB_PASSWORD')
    )
  } else {
    stash$conn <- DBI::dbConnect(
      odbc::odbc(),
      Driver = "SQLServer",
      Server = Sys.getenv('DB_HOST'),
      Database = Sys.getenv('DB_NAME'),
      UID      = Sys.getenv('DB_USERNAME'),
      PWD      = Sys.getenv('DB_PASSWORD')
    )
  }
  
  stash$male_helmet_count <- 0
  stash$female_helmet_count <- 0
  stash$male_no_helmet_count <- 0
  stash$female_no_helmet_count <- 0
  
  # stash$conn <-  RODBC::odbcDriverConnect(glue::glue("Driver=ODBC Driver 17 for SQL Server;Server={Sys.getenv('DB_HOST')}; Database={Sys.getenv('DB_NAME')};Uid={Sys.getenv('DB_USERNAME')}; Pwd={Sys.getenv('DB_PASSWORD')}"))
  return (
    # list(
    #   Get_dbconn = reactive(stash$conn),
    #   get_male_hc = reactive(stash$male_helmet_count),
    #   get_female_hc = reactive(stash$female_helmet_count),
    #   get_male_nohc = reactive(stash$male_no_helmet_count),
    #   get_female_nohc = reactive(stash$female_no_helmet_count)
    # )
    list(stash = stash)
  )
}