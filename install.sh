#!/bin/bash
#Copyright 2014 University of Nebraska at Omaha (UNO)

#Setup User Name and Password for MySql
u=$USER
p=$PWD

git clone https://github.com/DoSOCSv1/DoSOCSv1-Database SOCSDatabase
git clone https://github.com/DoSOCSv1/DoSOCSv1 DoSOCS
git clone https://github.com/DoSOCSv1/DoSOCSv1-Dashboard SOCSDashboard

echo "Install SPDX Database..."
mysql --user=$u --password=$p < SOCSDatabase/SQL/SPDX.sql
#Exit mySql

echo "Creating Upload Directory..."
mkdir SOCSDashboard/uploads
chmod 777 SOCSDashboard/uploads


#Move source to base directory
echo "Reconfigure Repo Folder Structure"
mv DoSOCS/src/* DoSOCS/
mv SOCSDashboard/src/* SOCSDashboard/
chmod -R 777 DoSOCS

echo "Removing old Repo Directories"
rm DoSOCS/src -R
rm SOCSDashboard/src -R

echo "Remove Database Repo"
rm SOCSDatabase -R

echo "Install Complete"
echo "Don't forget to update the setting files ('DoSOCS/settings.py' AND 'SOCSDashboard/function/Data_Source.php') with the database"
echo "connection information, and with the paths to Ninka and FOSSology."
