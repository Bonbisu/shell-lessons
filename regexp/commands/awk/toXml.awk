BEGIN { FS="[,\n]"; RS="\n\n"; OFS="\n"; }
{ print "<product>" $1 "</product>", "<price>" $2 "</price>", "<stock>" $3 "</stock>\n",  
cnt++
}
END { "Total products: " cnt} 
