require "faker"

tables = %w[takings week_date]

sql = File.open("create-db-7-years-from-2021.sql", "w")

tables.each do |table|
  sql.puts("drop table if exists #{table};")
end

sql.puts("\n")

sql.puts(
"create table week_date(
  id integer primary key autoincrement,
  week_no integer not null,
  day_name text not null,
  day integer not null,
  month integer not null,
  year integer not null
);"
)

sql.puts("\n")

sql.puts(
"create table takings(
  id integer primary key autoincrement,
  week_date_id integer not null,
  taking float null,
  non_vat float null,
  card float null,
  uber float null
);"
)

sql.puts("\n")
sql.puts("insert into week_date(week_no, day_name, day, month, year)")
sql.puts("values")
counter = 1
date = Date.parse("5-7-2021")
(1..(52 * 7)).each do |week_no|
  (1..7).each do |day|
    day_name = date.strftime("%A")
    sql.puts "  (#{week_no}, '#{day_name}', #{date.day}, #{date.month}, #{date.year}),"
    date = date.next
    counter += 1
  end
end
sql.puts(";")

sql.puts("\n")
sql.puts("insert into takings(week_date_id)")
sql.puts("values")
(1..counter).each do |week_date_id|
sql.puts "  (#{week_date_id}),"
end
sql.puts(";")

sql.close
