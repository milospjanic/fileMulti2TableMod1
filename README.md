# fileMulti2TableMod1

Lets say you have multiple files with the same first column and you want to merge them. Use this awk script **fileMulti2TableMod1**. All files will be compared to the rows from 1st column of the 1st file. if one of the files has a missing value(s) even though they contain the correct element in first column, rows with missing values are not excluded but missing values are set to 0.

# Usage
<pre>
awk -f fileMulti2TableMod1.awk 1.test 2.test 3.test 4.test 5.test 6.test
<\pre>
