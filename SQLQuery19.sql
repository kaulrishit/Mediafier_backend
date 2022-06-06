CREATE DATABASE Mediafier;

CREATE TABLE Users(users_Id int primary key identity (1,1) , users_Username varchar(30) NOT NUll , Users_Password NVARCHAR(30) NOT NULL, users_CreatedAt smalldatetime);



CREATE TABLE Folders(folders_Id int primary key identity(1,1), folders_name varchar(30) NOT NULL, folders_CreatedBy int FOREIGN KEY REFERENCES Users(users_Id),folders_CreatedAt smalldatetime , folders_ISDeleted bit default 0);

--ALTER TABLE Folders ADD CONSTRAINT [DF_folders_ISDeleted] DEFAULT (0) FOR folders_ISDeleted 
--GO

CREATE TABLE document(doc_id int primary key identity(1,1), doc_name varchar(100),doc_contentType varchar(100), doc_size int, doc_createdBy int FOREIGN KEY REFERENCES Users(users_Id), doc_createdAt smalldatetime, doc_folderId int FOREIGN KEY REFERENCES Folders(folders_Id), doc_isDeleted bit);

ALTER TABLE document ADD CONSTRAINT [doc_isDeleted] DEFAULT (0) FOR doc_isDeleted 
GO

insert into Users values ('Abc','qrwe@346','2022-05-30 10:00:00');
insert into Folders values ('F',1,'2022-05-30 10:01:00',1);
insert into document values ('Abc','qrwe@346',300,1,'2022-05-30 10:00:00',1);

select * from Users;
select * from Folders;
select * from document;


drop table document;


ALTER TABLE users 
ALTER COLUMN Users_Password nvarchar(500);