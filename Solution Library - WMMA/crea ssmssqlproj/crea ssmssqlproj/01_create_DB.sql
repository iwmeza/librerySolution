CREATE DATABASE Library
ON 
(
    NAME = 'Library_data',
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Library.mdf',
    SIZE = 3MB, 
    MAXSIZE = UNLIMITED, 
    FILEGROWTH = 1MB
)
LOG ON
(
    NAME = 'Library_Log',
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Library_log.ldf',
    SIZE = 3MB, 
    MAXSIZE = UNLIMITED, 
    FILEGROWTH = 1MB
);