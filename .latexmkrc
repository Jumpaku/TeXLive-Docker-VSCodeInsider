#!/usr/bin/env perl
$pdf_mode         = 3;
$latex            = 'pdflatex -halt-on-error';
$latex_silent     = 'pdflatex -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';

#$pdf_previewer = 'open';
