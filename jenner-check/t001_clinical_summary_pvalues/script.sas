/* Adapted from utl-r-creating-a-clinical-summary-report-in-pdf-and-txt-with-p-values.sas
   Original libname pointed at a local Windows path (d:/sd1); redirected here to a
   relative WORK-style path so the DATA step below - copied verbatim from the
   source repo, including its exact CARDS4 rows - runs standalone. The PROC FREQ /
   NPAR1WAY step is the SAS-native equivalent of the R gtsummary::tbl_summary() |>
   add_p() comparison the repo builds (AGE via Wilcoxon rank-sum, GRADE via
   Pearson chi-square), computed here directly against TRT using the same fields. */

options validvarname=upcase;
libname sd1 "%sysfunc(pathname(work))";

data sd1.have;
  input
   TRT$ AGE MARKER STAGE GRADE
   RESPONSE DEATH TTDEATH @@;
cards4;
A 23 0.16 1 2 0 0 24  B 49 0.04 2 3 0 1 15
B 19 1.10 2 1 1 0 24  A 63 0.98 4 2 1 0 24
A 31 0.27 1 2 0 0 24  B 67 1.15 1 2 0 0 24
A 31 2.06 3 3 1 1 17  B 68 0.10 4 2 0 1 15
A 51 2.76 4 3 1 1 16  A 78 0.17 3 1 1 1 17
B 39 0.61 4 1 0 1 15  B 36 0.30 1 3 1 0 24
A 37 0.35 1 2 0 0 24  A 37 1.86 2 2 0 1 20
A 32 1.73 1 1 0 1 18  B 53 2.00 3 1 0 0 24
A 31 0.14 1 2 0 0 24  A 36 1.89 3 1 1 0 24
B 34 0.20 3 1 0 1 10  A 51 0.16 3 1 0 0 24
B 42 0.51 1 3 0 0 24  A 48 1.20 3 3 0 1 21
B 63 0.06 3 1 1 0 24  B 57 0.10 1 2 0 1 12
B 54 0.83 4 3 0 1 14  A 31 0.61 1 2 1 0 24
B 21 0.25 4 1 0 1 12  B 37 0.22 4 3 0 1 15
B 48 0.12 1 1 0 1 22  B 28 0.80 4 2 0 1 18
B 71 0.44 4 3 0 1 8   B 40 0.37 3 2 0 1 18
A 38 2.08 4 3 1 0 24  B 49 0.31 1 3 1 1 12
B 49 0.15 2 2 0 1 15  A 61 0.17 4 3 0 1 12
A 57 0.06 1 3 0 0 24  B 56 1.47 3 1 1 0 24
A 46 0.32 1 2 0 0 24  A 54 0.16 4 3 1 1 17
A 47 0.26 2 1 0 0 24  B 71 0.73 1 1 1 0 24
A 52 0.71 2 2 0 0 24  A 38 0.12 1 3 1 0 24
A 61 1.71 4 1 0 1 16  B 31 0.09 2 2 0 0 24
A 38 0.09 4 1 0 1 23  B 48 0.38 1 2 0 1 12
B 34 0.10 4 2 0 1 6   B 00 0.21 4 2 0 1 10
;;;;
run;quit;

title "Descriptive summary by TRT arm (input, as sd1.have)";
proc means data=sd1.have n mean std median q1 q3;
  class TRT;
  var AGE;
run;

title "AGE by TRT -- Wilcoxon rank-sum test (matches repo's add_p() column 3)";
proc npar1way data=sd1.have wilcoxon;
  class TRT;
  var AGE;
run;

title "GRADE by TRT -- Pearson chi-square test (matches repo's add_p() column 2/4)";
proc freq data=sd1.have;
  tables TRT*GRADE / chisq;
run;

title;
