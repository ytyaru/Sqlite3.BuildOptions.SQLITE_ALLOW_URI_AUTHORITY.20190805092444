package require sqlite3
# db1とdb2は接続を共有していない！
sqlite3 db1 file::memory: -uri true
db1 eval { CREATE TABLE users (id INT,name TEXT) }
sqlite3 db2 file::memory: -uri true
# 共有してないのでusersテーブルが作成されておらずエラーになる！
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
