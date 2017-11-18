
********************************************************
Utilisation de freetds pour explorer le serveur dsidbb01
********************************************************


Etape 1
=======

On a un serveur de base de données MSSQL,
on veut connaitre les instances qui tournent sur ce serveur :
https://stackoverflow.com/questions/141154/how-can-i-determine-installed-sql-server-instances-and-their-versions

On se connecte au serveur avec cette commande

```
fisql -S dsibdd01 -U sa -P BDD,adm
```

Une fois connecté, on execute :

```
DECLARE @GetInstances TABLE
( Value nvarchar(100),
  InstanceNames nvarchar(100),
  Data nvarchar(100))

Insert into @GetInstances
EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = 'SOFTWARE\Microsoft\Microsoft SQL Server',
  @value_name = 'InstalledInstances'

Select InstanceNames from @GetInstances
```

On otient le resultat suivant :

```
MSSQLSERVER
SIS
AIRWATCH
```

Etape 2
=======

On a un serveur de base de données MSSQL et une instance
on veut connaitre les bases qui sont sur cette instance :
https://docs.microsoft.com/fr-fr/sql/relational-databases/databases/view-a-list-of-databases-on-an-instance-of-sql-server

```
fisql -S "dsibdd01\MSSQLSERVER" -U sa -P BDD,adm
```

```
fisql -S "dsibdd01\MSSQLSERVER" -U superdvlp -P axtsd
```



Une fois connecté, on execute :

```
SELECT name, database_id, create_date
FROM sys.databases ;
GO
```

On obtient le resultat suivant :

```
master
tempdb
model
mdsdb
ATAL
ATALTEST
```

Etape 3
=======

On a un serveur de base de données MSSQL, une instance et une base de données
on veut connaitre les tables de cette base
https://sqlserver.developpez.com/faq/?page=Consulter-les-informations-de-schema#Comment-obtenir-la-liste-des-tables-d-une-base-de-donnee

```
fisql -S "dsibdd01\MSSQLSERVER" -U sa -P BDD,adm
```

Une fois connecté, on execute :

```
USE ATAL
go
select DB_NAME()
GO
SELECT table_name
FROM information_schema.tables
WHERE table_type='BASE TABLE'
go
```


Etape 4
=======

On fait la meme manip, mais avec python3 et le module pymssql
cf ./bin/database/database.py
