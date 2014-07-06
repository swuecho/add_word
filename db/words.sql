create table if not exists words (
  id integer primary key autoincrement,
  word string not null,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
