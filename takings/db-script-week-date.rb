require 'date'

sql = File.open("week-date.sql", "w")

sql.puts("drop table if exists week_date;")
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

sql.puts("insert into week_date(week_no, day_name, day, month, year)")
sql.puts("values")
counter = 1
date = Date.parse("5-7-2021")
actual_week_no = 1 

(1..(52 * 7)).each do |week_no|
  actual_week_no = 1 if actual_week_no == 53
  puts actual_week_no

  (1..7).each do |day|
    day_name = date.strftime("%A")
    sql.puts "  (#{actual_week_no}, '#{day_name}', #{date.day}, #{date.month}, #{date.year}),"
    date = date.next
    counter += 1
  end
  actual_week_no += 1
end

sql.puts(";")
sql.close
