create table Cities  
(  
	Id int primary key not null,  
	Name varchar(25) not null,  
)  
create table Clients  
(  
	Id int primary key not null,  
	Name varchar(25) not null,  
	Surname varchar(25) not null
)

create table Banks  
(  
	Id int primary key not null,  
	Name varchar(25) not null,
)
create table Branches  
(  
	Id int primary key not null,  
	ÑityId int FOREIGN KEY REFERENCES dbo.Cities(Id) not null,  
	BankId int FOREIGN KEY REFERENCES dbo.Banks(Id) not null
)
create table Accounts  
(  
	Id int primary key not null,  
	Balance float,  
	ClientsId  int FOREIGN KEY REFERENCES dbo.Clients(Id) not null,  
	BankId int FOREIGN KEY REFERENCES dbo.Banks(Id), 
) 
create table Cards  
(  
	Id int primary key not null,  
	Balance float not null,
	AccountId int FOREIGN KEY REFERENCES dbo.Accounts(Id),  
)
create table SocialStatuse  
(  
	Id int primary key not null,  
	Name varchar(25) not null,
	Accrual float 
)
create table Statuses  
(  
	Id int primary key not null,  
	SocialStatusId int FOREIGN KEY REFERENCES dbo.SocialStatuse(Id) not null,  
	ClientsId int FOREIGN KEY REFERENCES dbo.Clients(Id) not null
)  
