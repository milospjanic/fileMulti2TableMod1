# Read first file and put first column into hash table h1 and second column into hash h2 with keys from first column 

NR==FNR { h1[$1] = $1; h2[$1] = $2; next; }

# Read $1 from second, third file etc, compare first column with hash h1, if positive add to hash column 2

NF{ if($1 in h1) h2[$1] = h2[$1] OFS $2;}

# Read $1 and if it is empty append 0 to hash h2

NF{ if($1 in h1 && $2=="") h2[$1] = h2[$1] OFS 0}

# At the end calculate lenght of the hash h2 if it is >ARGC-2 print, this eliminates truncated rows that couldnt be found in all files

END { for(k in h2)
  if(split(h2[k], a) > ARGC-2)
    print k OFS h2[k]
}
