package require sqlite3
sqlite3 db1 file:memdb1?mode=memory&cache=shared -uri true
db1 eval { CREATE TABLE users (id INT,name TEXT) }
sqlite3 db2 file:memdb1?mode=memory&cache=shared -uri true 
db2 eval { INSERT INTO users VALUES (1,'yamada') }

set resultset [db1 eval { SELECT * FROM users }]
foreach row $resultset {
  puts $row
}
set resultset [db2 eval { SELECT * FROM users }]
foreach row $resultset {
  puts $row
}

db1 close
db2 close
