# Choice of compiler
$command = 'uplatex';    # pdflatex or platex or uplatex

# pdflatex
if ($command eq 'pdflatex') {
    $pdf_mode = 1; # make PDF directly
    $pdf_latex = 'pdflatex %O %S';
}

# platex
elsif ($command eq 'platex') {
    $pdf_mode = 3; # DVI to PDF
    $latex = 'platex %O %S';
    $dvipdf = 'dvipdfmx %O -o %D %S'; # DVI to PDF
}

# uplatex
elsif ($command eq 'uplatex') {
    $pdf_mode = 3; # DVI to PDF
    $latex = 'uplatex %O %S';
    $dvipdf = 'dvipdfmx %O -o %D %S';
}

# Output file deletion settings
$clean_ext = "aux log bbl blg fls fdb_latexmk out synctex.gz dvi";
