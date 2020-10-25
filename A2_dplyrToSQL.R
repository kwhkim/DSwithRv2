install.packages('dbplyr')
install.packages('nycflights13')

install.packages('sqldf')
install.packages('RSQLite')


library(dplyr)
library(dbplyr)
library(sqldf)
#library(RSQLite)
library(nycflights13)
head(flights, 3)


dat <- flights
a1 <- dat %>% select(carrier, origin, dest)
a2 <- sqldf('SELECT carrier, origin, dest FROM dat')
all.equal(a1, as_tibble(a2))


(r1 <- dat %>% head(3))
r2 <- as_tibble(sqldf('SELECT * FROM dat LIMIT 3'))
all.equal(r1,r2)


(r1 <- dat %>% select(carrier) %>% filter(!duplicated(carrier)))
r2 <- as_tibble(sqldf('SELECT DISTINCT carrier FROM dat'))
all.equal(r1, r2)


(r1 <- dat %>% select(carrier) %>% filter(!duplicated(carrier)) %>% nrow)
(r2 <- as_tibble(sqldf('SELECT COUNT(DISTINCT carrier) FROM dat')))
all.equal(r1, r2)


con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
flights <- copy_to(con, nycflights13::flights)
airports <- copy_to(con, nycflights13::airports)


flights %>%
  select(contains("delay")) %>%
  show_query()


DBI::dbGetQuery(con, 
  'SELECT `dep_delay`, `arr_delay` FROM `nycflights13::flights`') %>% 
  head(3)


dbFilename <- "flights.db"
if (file.exists(dbFilename)) file.remove(dbFilename)
con2 <- DBI::dbConnect(drv=SQLite(), dbname=dbFilename)
dbListTables(con2)
data(flights)
dbWriteTable(con2, "flights", flights)
dbListTables(con2)
dbDisconnect(con2)


con2 <- DBI::dbConnect(drv=SQLite(), dbname=dbFilename)
DBI::dbGetQuery(con2, 'SELECT `dep_delay`, `arr_delay` FROM flights') %>% head
dbDisconnect(con2)

