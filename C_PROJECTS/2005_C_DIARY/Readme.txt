------------------------------------ Release Notes, Agenda 1.0 ------- -----------------------------
Internal design:

-The entered data is loaded, allocating memory dynamically at the time of create as well as at opening
of the file at which an initial reading of the "DATOSAG.DAT" file is performed.

-Error detection processes were developed against file opening failures as well
also out of memory when generating a new list item.

-The program is based on a single list of elements on which the ABM of data directly impacts,
while everything is saved in a binary sequential file.
-At the moment there are no routines that validate data entry throughout the program.
-There are still no routines to generate information backup.

User interface:

-The interface is based on "text mode" and runs on an MS-DOS window.
-The main interface of the program is based on four menus:
 "ABM Data", "Query", "Backup of information" and "Exit the program" which in turn in the cases of "ABM Data" 
  and "Query" have submenus as detailed below:
   1- ABM Data
      1- High
      2- Low
      3- Modification
      4- Return to the previous menu

   2- Consultation
      1- Search by name
      2- List All
      3- Export
      4- Return to the previous menu






 

