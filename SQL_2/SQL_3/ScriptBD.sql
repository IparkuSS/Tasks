create table Cites  
(  
    ÑityId int primary key not null,  
    Sity varchar(25)not null,  
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
create table Cards  
(  
	IdCard int primary key not null,  
    Balance float not null,
	AccountId int FOREIGN KEY REFERENCES dbo.Accounts(AccountId),  
)
create table SocialStatuse  
(  
    SocialStatusId int primary key not null,  
    Name varchar(25) not null,
	Accrual float 
)
create table Statuses  
(  
   StatusId int primary key not null,  
   SocialStatusId int FOREIGN KEY REFERENCES dbo.SocialStatuse(SocialStatusId) not null,  
   ClientsId int FOREIGN KEY REFERENCES dbo.Clients(ClientId)not null
)  
create table Banks  
(  
    BankId int primary key not null,  
    Name varchar(25)not null,
	IdCard int FOREIGN KEY REFERENCES dbo.Cards(IdCard) not null,
)
create table Branches  
(  
    BranchesId int primary key not null,  
    ÑityId int FOREIGN KEY REFERENCES dbo.Cites(ÑityId) not null,  
    BankId int FOREIGN KEY REFERENCES dbo.Banks(BankId)not null
) 