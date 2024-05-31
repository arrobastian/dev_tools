Alter Database youR_DDBB
Add FileGroup [Fg_table1]
Alter Database youR_DDBB
Add FileGroup [Fg_table2]
Alter Database youR_DDBB
Add FileGroup [Fg_table3]
Alter Database youR_DDBB
Add FileGroup [Fg_table4]

table1 --13.576.500 (13GB) (2GB por año)
 --48.794
table2 --78.970.791 (34GB) (5GB por año)
table3 --13.576.495 (6GB) (1GB por año)
table4 --78.206.567 (35GB) (5GB por año)

/*table1*/
Alter Database youR_DDBB
Add File
(Name = 'Fl_table1_2007',
 Filename = 'F:\Data3\Fl_table1_2007.ndf',
 Size = 1400MB,
 Maxsize = 2000MB)
 To Filegroup Fg_table1

Alter Database youR_DDBB
Add File
(Name = 'Fl_table1_2008',
 Filename = 'F:\Data3\Fl_table1_2008.ndf',
 Size = 1400MB,
 Maxsize = 2000MB)
 To Filegroup Fg_table1
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table1_2009',
 Filename = 'F:\Data3\Fl_table1_2009.ndf',
 Size = 1500MB,
 Maxsize = 2100MB)
 To Filegroup Fg_table1
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table1_2010',
 Filename = 'F:\Data3\Fl_table1_2010.ndf',
 Size = 1500MB,
 Maxsize = 2100MB)
 To Filegroup Fg_table1

Alter Database youR_DDBB
Add File
(Name = 'Fl_table1_2011',
 Filename = 'F:\Data3\Fl_table1_2011.ndf',
 Size = 1600MB,
 Maxsize = 2200MB)
 To Filegroup Fg_table1

Alter Database youR_DDBB
Add File
(Name = 'Fl_table1_2012',
 Filename = 'F:\Data3\Fl_table1_2012.ndf',
 Size = 1800MB,
 Maxsize = 2400MB)
 To Filegroup Fg_table1
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table1_2013',
 Filename = 'F:\Data3\Fl_table1_2013.ndf',
 Size = 2200MB,
 Maxsize = 2800MB)
 To Filegroup Fg_table1

Alter Database youR_DDBB
Add File
(Name = 'Fl_table1_2014',
 Filename = 'F:\Data3\Fl_table1_2014.ndf',
 Size = 1900MB,
 Maxsize = 2500MB)
 To Filegroup Fg_table1

/*table2*/
Alter Database youR_DDBB
Add File
(Name = 'Fl_table2_2007',
 Filename = 'F:\Data3\Fl_table2_2007.ndf',
 Size = 600MB,
 Maxsize = 1100MB)
 To Filegroup Fg_table2

Alter Database youR_DDBB
Add File
(Name = 'Fl_table2_2008',
 Filename = 'F:\Data3\Fl_table2_2008.ndf',
 Size = 2500MB,
 Maxsize = 3100MB)
 To Filegroup Fg_table2
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table2_2009',
 Filename = 'F:\Data3\Fl_table2_2009.ndf',
 Size = 4500MB,
 Maxsize = 5000MB)
 To Filegroup Fg_table2
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table2_2010',
 Filename = 'F:\Data3\Fl_table2_2010.ndf',
 Size = 4700MB,
 Maxsize = 5300)
 To Filegroup Fg_table2

Alter Database youR_DDBB
Add File
(Name = 'Fl_table2_2011',
 Filename = 'F:\Data3\Fl_table2_2011.ndf',
 Size = 4900MB,
 Maxsize = 5400MB)
 To Filegroup Fg_table2

Alter Database youR_DDBB
Add File
(Name = 'Fl_table2_2012',
 Filename = 'F:\Data3\Fl_table2_2012.ndf',
 Size = 5400MB,
 Maxsize = 6000MB)
 To Filegroup Fg_table2
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table2_2013',
 Filename = 'F:\Data3\Fl_table2_2013.ndf',
 Size = 6500MB,
 Maxsize = 7000MB)
 To Filegroup Fg_table2

Alter Database youR_DDBB
Add File
(Name = 'Fl_table2_2014',
 Filename = 'F:\Data3\Fl_table2_2014.ndf',
 Size = 56000MB,
 Maxsize = 6100MB)
 To Filegroup Fg_table2
 
 /*table3*/
Alter Database youR_DDBB
Add File
(Name = 'Fl_table3_2007',
 Filename = 'F:\Data3\Fl_table3_2007.ndf',
 Size = 1400MB,
 Maxsize = 2000MB)
 To Filegroup Fg_table3

Alter Database youR_DDBB
Add File
(Name = 'Fl_table3_2008',
 Filename = 'F:\Data3\Fl_table3_2008.ndf',
 Size = 1400MB,
 Maxsize = 2000MB)
 To Filegroup Fg_table3
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table3_2009',
 Filename = 'F:\Data3\Fl_table3_2009.ndf',
 Size = 1500MB,
 Maxsize = 2100MB)
 To Filegroup Fg_table3
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table3_2010',
 Filename = 'F:\Data3\Fl_table3_2010.ndf',
 Size = 1500MB,
 Maxsize = 2100MB)
 To Filegroup Fg_table3

Alter Database youR_DDBB
Add File
(Name = 'Fl_table3_2011',
 Filename = 'F:\Data3\Fl_table3_2011.ndf',
 Size = 1600MB,
 Maxsize = 2200MB)
 To Filegroup Fg_table3

Alter Database youR_DDBB
Add File
(Name = 'Fl_table3_2012',
 Filename = 'F:\Data3\Fl_table3_2012.ndf',
 Size = 1800MB,
 Maxsize = 2400MB)
 To Filegroup Fg_table3
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table3_2013',
 Filename = 'F:\Data3\Fl_table3_2013.ndf',
 Size = 2200MB,
 Maxsize = 2800MB)
 To Filegroup Fg_table3

Alter Database youR_DDBB
Add File
(Name = 'Fl_table3_2014',
 Filename = 'F:\Data3\Fl_table3_2014.ndf',
 Size = 1900MB,
 Maxsize = 2500MB)
 To Filegroup Fg_table3

/*table4*/
Alter Database youR_DDBB
Add File
(Name = 'Fl_table4_2007',
 Filename = 'F:\Data3\Fl_table4_2007.ndf',
 Size = 2600MB,
 Maxsize = 3100MB)
 To Filegroup Fg_table4

Alter Database youR_DDBB
Add File
(Name = 'Fl_table4_2008',
 Filename = 'F:\Data3\Fl_table4_2008.ndf',
 Size = 4600MB,
 Maxsize = 5200MB)
 To Filegroup Fg_table4
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table4_2009',
 Filename = 'F:\Data3\Fl_table4_2009.ndf',
 Size = 4600MB,
 Maxsize = 5100MB)
 To Filegroup Fg_table4
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table4_2010',
 Filename = 'F:\Data3\Fl_table4_2010.ndf',
 Size = 4800MB,
 Maxsize = 5400MB)
 To Filegroup Fg_table4

Alter Database youR_DDBB
Add File
(Name = 'Fl_table4_2011',
 Filename = 'F:\Data3\Fl_table4_2011.ndf',
 Size = 5100MB,
 Maxsize = 5700MB)
 To Filegroup Fg_table4

Alter Database youR_DDBB
Add File
(Name = 'Fl_table4_2012',
 Filename = 'F:\Data3\Fl_table4_2012.ndf',
 Size = 5700MB,
 Maxsize = 6300MB)
 To Filegroup Fg_table4
 
Alter Database youR_DDBB
Add File
(Name = 'Fl_table4_2013',
 Filename = 'F:\Data3\Fl_table4_2013.ndf',
 Size = 6800MB,
 Maxsize = 7400MB)
 To Filegroup Fg_table4

Alter Database youR_DDBB
Add File
(Name = 'Fl_table4_2014',
 Filename = 'F:\Data3\Fl_table4_2014.ndf',
 Size = 5800MB,
 Maxsize = 6400MB)
 To Filegroup Fg_table4
 
 
 
**Tercer Paso :  Generar una Partition Function (la cual determinará los rangos a partir de los cuales particionaremos la tabla, - en nuestro caso por fecha -)


Create Partition Function [PF_FACTU](datetime)
As Range Left For Values
 ('2007-12-31 23:59:59', '2008-12-31 23:59:59','2009-12-31 23:59:59',
  '2010-12-31 23:59:59', '2011-12-31 23:59:59', '2012-12-31 23:59:59',
  '2013-12-31 23:59:59', '2014-12-31 23:59:59')




Create Partition Scheme [PS_table4] As Partition [PF_FACTU]
To ([Fg_table4])

Create Partition Scheme [PS_table1] As Partition [PF_FACTU]
To ([Fg_table1])

Create Partition Scheme [PS_table3] As Partition [PF_FACTU]
To ([Fg_table3])

Create Partition Scheme [PS_table2] As Partition [PF_FACTU]
To ([Fg_table2])




Drop Index [PK__table1__1C1D2798] On [dbo].[youR_DDBB]
         With( Online = Off )

Create Clustered Index [PK__table1__1C1D2798] On [dbo].[youR_DDBB] (FactFec)
          on [PS_table1] (FactFec)
          

Drop Index [PK__table2__1E05700A] On [dbo].[youR_DDBB]
         With( Online = Off )

Create Clustered Index [PK__table2__1E05700A] On [dbo].[youR_DDBB] (FactFec)
          on [PS_table2] (FactFec)  
          

Drop Index [PK__table4__20E1DCB5] On [dbo].[youR_DDBB]
         With( Online = Off )

Create Clustered Index [PK__table4__20E1DCB5] On [dbo].[youR_DDBB] (FactFec)
          on [PS_table4] (FactFec)  
          

Drop Index [PK__table3__1FEDB87C] On [dbo].[youR_DDBB]
         With( Online = Off )

Create Clustered Index [PK__table3__1FEDB87C] On [dbo].[youR_DDBB] (FactFec)
          on [PS_table3] (FactFec)   