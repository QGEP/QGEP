#!/bin/gawk -f

BEGIN {
   FS=",";
   printf("<?xml version=\"1.0\" ?>\n");
   printf("<!DOCTYPE TS>\n");   
   printf("<TS version=\"2.0\" language=\"de\" sourcelanguage=\"en\">\n");   
   printf("<context>\n");   
   printf("\t<name>database</name>\n");   
}

NF==0 { next }
NF==2 {
   printf("\t<message>\n");
   printf("\t\t<source>%s</source>\n",$1);
   printf("\t\t<translation>%s</translation>\n",$2);
   printf("\t</message>\n");
}
END {
   printf("</context>\n");
   printf("</TS>\n");
}
