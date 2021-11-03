create table Cites  
(  
    ÑityId int primary key not null,  
    NameSity varchar(25)not null,  
    
)  
create table Banks  
(  
    BankId int primary key not null,  
    NameBank varchar(25)not null
)
create table Branches  
(  
    BranchesId int primary key not null,  
    ÑityId int FOREIGN KEY REFERENCES dbo.Cites(ÑityId) not null,  
    BankId int FOREIGN KEY REFERENCES dbo.Banks(BankId)not null
)  
create table Clients  
(  
   ClientId int primary key not null,  
   Name varchar(25)not null,  
   Surname varchar(25)not null
)
create table Accounts  
(  
    AccountId int primary key not null,  
    Balance float,  
    ClientsId  int FOREIGN KEY REFERENCES dbo.Clients(ClientId)not null  
) 
create table SucialStatuses  
(  
    SocialStatusId int primary key not null,  
    Name varchar(25) not null,
	Accrual float 
)
create table Cards  
(  
	IdCard int primary key not null,  
    OwnerName varchar(25)not null,  
    Balance float not null,
	BankId int FOREIGN KEY REFERENCES dbo.Banks(BankId) not null,
	AccountId int FOREIGN KEY REFERENCES dbo.Accounts(AccountId),  
	SocialStatusId int FOREIGN KEY REFERENCES dbo.SucialStatuses(SocialStatusId) not null,  

)
create table Statuses  
(  
   StatusId int primary key not null,  
   SocialStatusId int FOREIGN KEY REFERENCES dbo.SucialStatuses(SocialStatusId) not null,  
   ClientsId int FOREIGN KEY REFERENCES dbo.Clients(ClientId)not null
)  
