require "faker"

tables = %w[takings week_date]

sql = File.open("db-create.sql", "w")

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
  taking float not null,
  non_vat float not null,
  card float not null,
  uber float not null
);"
)

sql.puts("\n")
sql.puts("insert into week_date(week_no, day_name, day, month, year)")
sql.puts("values")
counter = 1
date = Date.parse("4-7-2022")
(1..52).each do |week_no|
  (1..7).each do |day|
    day_name = date.strftime("%A")
    sql.puts "  (#{week_no}, '#{day_name}', #{date.day}, #{date.month}, #{date.year}),"
    date = date.next
    counter += 1
  end
end
sql.puts(";")

sql.puts("\n")
sql.puts("insert into takings(week_date_id, taking, non_vat, card, uber)")
sql.puts("values")
(1..counter).each do |week_date_id|
sql.puts "  (#{week_date_id}, #{Faker::Number.decimal(l_digits: 4, r_digits: 2)}, #{Faker::Number.decimal(l_digits: 4, r_digits: 2)}, #{Faker::Number.decimal(l_digits: 4, r_digits: 2)}, #{Faker::Number.decimal(l_digits: 3, r_digits: 2)}),"
end
sql.puts(";")

sql.close
