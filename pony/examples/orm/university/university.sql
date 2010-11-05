drop table if exists Faculties;
create table Faculties(
  number integer primary key,
  name varchar(50) unique not null
);
drop table if exists Departments;
create table Departments(
  number integer primary key,
  name varchar(50) unique not null,
  faculty integer not null references Faculties(number)
);
drop table if exists Groups;
create table Groups(
  number integer primary key,
  grad_year integer not null,
  department integer not null references Department(number)
);
drop table if exists Students;
create table Students(
  id integer primary key,
  name varchar(50) not null,
  scholarship integer not null default 0,
  "group" integer not null references Groups(number)
);
drop table if exists Majors;
create table Majors(
  name varchar(50) primary key,
  department integer not null references Departments(number)
);
drop table if exists Subjects;
create table Subjects(
  name varchar(50) primary key
);
drop table if exists Courses;
create table Courses(
  id integer primary key,
  major varchar(50) not null references Majors(name),
  subject varchar(50) not null references Subjects(name),
  semester integer not null,
  lect_hours integer not null,
  pract_hours integer not null,
  credit integer not null,
  unique(major, subject, semester)
);
drop table if exists Teachers;
create table Teachers(
  id integer primary key,
  name varchar(50) not null,
  degree varchar(50),
  department integer not null references Departments(number)
);
drop table if exists Grades;
create table Grades(
  student integer not null references Students(id),
  course integer not null references Courses(id),
  teacher integer not null references Teachers(id),
  date date not null,
  value varchar(2) not null
);
drop table if exists Classrooms;
create table Classrooms(
  number varchar(10) primary key,
  description text
); 
drop table if exists Lessons;
create table Lessons(
  day_of_week integer,
  meeting_time integer,
  classroom varchar(10) references Classrooms(number),
  course integer not null references Courses(id),
  teacher integer not null references Teachers(id),
  primary key(day_of_week, meeting_time, classroom)
);
drop table if exists Group_Lesson;
create table Group_Lesson(
  "group" integer,
  lesson_day_of_week integer,
  lesson_meeting_time integer,
  lesson_classroom varchar(10),
  primary key("group", lesson_day_of_week, lesson_meeting_time, lesson_classroom) 
);
drop table if exists Subject_Teacher;
create table Subject_Teacher(
  subject varchar(50),
  teacher varchar(50),
  primary key(subject, teacher)
);

