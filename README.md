# fileMulti2TableMod1

Lets say you have multiple files with the same first column and you want to merge them. Use this awk script **fileMulti2TableMod1**. All files will be compared to the rows from 1st column of the 1st file. if one of the files has a missing value(s) even though they contain the correct element in first column, rows with missing values are not excluded but missing values are set to 0. Rows with column 1 not present in column 1 of the first file will not be shown, as well as those rows from the first file that are missing in other files' first columns. Only those rows with 1st columns present in every file are shown. See example.

# Usage
<pre>
awk -f fileMulti2TableMod1.awk 1.test 2.test 3.test 4.test 5.test 6.test
</pre>

# Example

<pre>
DN52ei1f:~ milospjanic$ cat 1.test 
mail	5
now	7
tomorrow	7
string	5
do	6
comeon	45
work	455
mondo	3
bike	56
DN52ei1f:~ milospjanic$ cat 2.test 
mail	4
now	4
test	56
tomorrow	4
string	4
do	4
dodo	0101
DN52ei1f:~ milospjanic$ cat 3.test 
mail	6
now	6
tomorrow	7
string	5
do	67
ubas	5889
dodo	456789
dove	67
blis	4499
fry	456	
DN52ei1f:~ milospjanic$ cat 4.test 
mail	89
blab	5
now	75
tomorrow	75
string	
do	555
DN52ei1f:~ milospjanic$ cat 5.test 
do	456
now	567
string
DN52ei1f:~ milospjanic$ cat 6.test 
do	456
now	
string

DN52ei1f:~ milospjanic$ awk -f fileMulti2TableMod1.awk 1.test 2.test 3.test 4.test 5.test 6.test 
do 6 4 67 555 456 456
now 7 4 6 75 567  0
string 5 4 5  0  0  0

</pre>
