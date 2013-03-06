#!/bin/gawk -f

@include "csv.awk"

BEGIN {
    csv_escape="\""
    csv_quote="\""
    csv_sep=","
    printf("<?xml version=\"1.0\" ?>\n");
    printf("<!DOCTYPE TS>\n");   
    printf("<TS version=\"2.0\" language=\"de\" sourcelanguage=\"en\">\n");   
    printf("<context>\n");   
    printf("\t<name>database</name>\n");   
}
{   # Parse the line.
    fields = parse_csv( $0, csv, csv_sep, csv_quote, csv_escape, "\n" );
    # Print the translated message
    printf("\t<message>\n");
    printf("\t\t<source>%s</source>\n",csv[0]);
    printf("\t\t<translation>%s</translation>\n",csv[1]);
    printf("\t</message>\n");
    delete csv;
}
END {
    printf("</context>\n");
    printf("</TS>\n");
}
