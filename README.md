# utl-r-creating-a-clinical-summary-report-in-pdf-and-txt-with-p-values
R creating a clinical summary report in pdf and txt with p values
    %let pgm=utl-r-creating-a-clinical-summary-report-in-pdf-and-txt-with-p-values;

    %stop_submission;

    R creating a clinical summary report in pdf and txt with p values

    see github for documentation and complete code

     CONTENTS

         1 create pdf clinical report
           https://tinyurl.com/4tve4tch

         2 convert pdf report to text
           https://tinyurl.com/2d56pk6m

         3 related clinical repos


    pdf output
    https://tinyurl.com/4tve4tch
    https://github.com/rogerjdeangelis/utl-r-creating-a-clinical-summary-report-in-pdf-and-txt-with-p-values/blob/main/table.pdf

    txt output
    https://tinyurl.com/2d56pk6m
    https://github.com/rogerjdeangelis/utl-r-creating-a-clinical-summary-report-in-pdf-and-txt-with-p-values/blob/main/table.txt

    github
    https://tinyurl.com/9wc5wes2
    https://github.com/rogerjdeangelis/utl-r-creating-a-clinical-summary-report-in-pdf-and-txt-with-p-values

    stackoverflow
    https://tinyurl.com/3mefkxev
    https://stackoverflow.com/questions/79727800/tbl-summary-add-column-with-test-statistic

    /**************************************************************************************************************************/
    /* INPUT                                      |  PROCESS                      | OUTPUT                                    */
    /* =====                                      |  =======                      | ======                                    */
    /*                              R             | 1 CREATE PDF REPORT           |                                           */
    /*                              E          T  | ===================           |                                           */
    /*              M               S          T  |                               |                                           */
    /*              A     S    G    P    D     D  | *---- delete file ----;       |                                           */
    /*              R     T    R    O    E     E  | %utlfkil(d:/pdf/table.pdf);   |                                           */
    /* T     A      K     A    A    N    A     A  |                               |                                           */
    /* R     G      E     G    D    S    T     T  | %utl_rbeginx;                 |                                           */
    /* T     E      R     E    E    E    H     H  | parmcards4;                   |                                           */
    /*                                            | library(gtsummary)            |                                           */
    /* A    23    0.16    1    2    0    0    24  | library(gt)                   |                                           */
    /* B    49    0.04    2    3    0    1    15  | library(haven)                |                                           */
    /* B     9    1.10    2    1    1    0    24  | have<-read_sas(               |                                           */
    /* A    63    0.98    4    2    1    0    24  |   "d:/sd1/have.sas7bdat")     |                                           */
    /* A    31    0.27    1    2    0    0    24  | tbl <- have |>                |                                           */
    /* B    67    1.15    1    2    0    0    24  |  tbl_summary(by = TRT         |                                           */
    /* A     .    2.06    3    3    1    1    17  |   ,include = c(AGE,GRADE)) |> |                                           */
    /* B    68    0.10    4    2    0    1    15  |  add_p() |>                   |                                           */
    /* A    51    2.76    4    3    1    1    16  |  separate_p_footnotes() |>    |                                           */
    /* A    78    0.17    3    1    1    1    17  |  modify_column_unhide(        |                                           */
    /* B    39    0.61    4    1    0    1    15  |    "statistic") |>            |                                           */
    /*                                            |  as_gt()                      |                                           */
    /*                                            | gt::gtsave(tbl                |                                           */
    /* options validvarname=upcase;               |   , "d:/pdf/table.pdf")       |                                           */
    /* libname sd1 "d:/sd1";                      | ;;;;                          |                                           */
    /* data sd1.have;                             | %utl_rendx;                   |                                           */
    /*   input                                    |                               |                                           */
    /*    TRT$ AGE MARKER STAGE GRADE             |---------------------------------------------------------------------------*/
    /*    RESPONSE DEATH TTDEATH @@;              | 2 PDF TO TEXT                 | d:/txt/table.txt                          */
    /* cards4;                                    | =============                 |                                           */
    /* A 23 0.16 1 2 0 0 24  B 49 0.04 2 3 0 1 15 |                               |          DRUG A      DRUG B         p     */
    /* B 19 1.10 2 1 1 0 24  A 63 0.98 4 2 1 0 24 | %utl_pdftotext(               |          N = 24      N = 26    Stat val   */
    /* A 31 0.27 1 2 0 0 24  B 67 1.15 1 2 0 0 24 |    d:/pdf/table.pdf           |                                       3   */
    /* A 31 2.06 3 3 1 1 17  B 68 0.10 4 2 0 1 15 |   ,d:/txt/table.txt           |  Age   46 (36, 54) 48 (34, 56) 4,32 0.9   */
    /* A 51 2.76 4 3 1 1 16  A 78 0.17 3 1 1 1 17 | )                             |    Unk       7           4                */
    /* B 39 0.61 4 1 0 1 15  B 36 0.30 1 3 1 0 24 |                               |                                       4   */
    /* A 37 0.35 1 2 0 0 24  A 37 1.86 2 2 0 1 20 |                               |  Grade                         0.27 0.9   */
    /* A 32 1.73 1 1 0 1 18  B 53 2.00 3 1 0 0 24 |                               |    I     35 (36%)     33 (32%)            */
    /* A 31 0.14 1 2 0 0 24  A 36 1.89 3 1 1 0 24 |                               |    II   32 (33%)     36 (35%)             */
    /* B 34 0.20 3 1 0 1 10  A 51 0.16 3 1 0 0 24 |                               |    III  31 (32%)     33 (32%)             */
    /* B 42 0.51 1 3 0 0 24  A 48 1.20 3 3 0 1 21 |                               |                                           */
    /* B 63 0.06 3 1 1 0 24  B 57 0.10 1 2 0 1 12 |                               |  1 -> superscript                         */
    /* B 54 0.83 4 3 0 1 14  A 31 0.61 1 2 1 0 24 |                               |     Median (Q1, Q3); n (%)                */
    /* B 21 0.25 4 1 0 1 12  B 37 0.22 4 3 0 1 15 |                               |  2                                        */
    /* B 48 0.12 1 1 0 1 22  B 28 0.80 4 2 0 1 18 |                               |     Wilcoxon rank sum test;               */
    /* B 71 0.44 4 3 0 1 8   B 40 0.37 3 2 0 1 18 |                               |     Pearson’s Chi-squared test            */
    /* A 38 2.08 4 3 1 0 24  B 49 0.31 1 3 1 1 12 |                               |  3                                        */
    /* B 49 0.15 2 2 0 1 15  A 61 0.17 4 3 0 1 12 |                               |     Wilcoxon rank sum test                */
    /* A 57 0.06 1 3 0 0 24  B 56 1.47 3 1 1 0 24 |                               |  4                                        */
    /* A 46 0.32 1 2 0 0 24  A 54 0.16 4 3 1 1 17 |                               |     Pearson’s Chi-squared test            */
    /* A 47 0.26 2 1 0 0 24  B 71 0.73 1 1 1 0 24 |                               |                                           */
    /* A 52 0.71 2 2 0 0 24  A 38 0.12 1 3 1 0 24 |                               |                                           */
    /* A 61 1.71 4 1 0 1 16  B 31 0.09 2 2 0 0 24 |                               |                                           */
    /* A 38 0.09 4 1 0 1 23  B 48 0.38 1 2 0 1 12 |                               |                                           */
    /* B 34 0.10 4 2 0 1 6   B 00 0.21 4 2 0 1 10 |                               |                                           */
    /* ;;;;                                       |                               |                                           */
    /* run;quit;                                  |                               |                                           */
    /**************************************************************************************************************************/

    /*                   _
    (_)_ __  _ __  _   _| |_
    | | `_ \| `_ \| | | | __|
    | | | | | |_) | |_| | |_
    |_|_| |_| .__/ \__,_|\__|
            |_|
    */

    options validvarname=upcase;
    libname sd1 "d:/sd1";
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

    /**************************************************************************************************************************/
    /* TRT    AGE    MARKER    STAGE    GRADE    RESPONSE    DEATH    TTDEATH                                                 */
    /*                                                                                                                        */
    /*  A      23     0.16       1        2          0         0         24                                                   */
    /*  B      49     0.04       2        3          0         1         15                                                   */
    /*  B      19     1.10       2        1          1         0         24                                                   */
    /*  A      63     0.98       4        2          1         0         24                                                   */
    /*  A      31     0.27       1        2          0         0         24                                                   */
    /*  B      67     1.15       1        2          0         0         24                                                   */
    /*  A      31     2.06       3        3          1         1         17                                                   */
    /**************************************************************************************************************************/

    /*                       _                   _  __                            _
    / |   ___ _ __ ___  __ _| |_ ___   _ __   __| |/ _| _ __ ___ _ __   ___  _ __| |_
    | |  / __| `__/ _ \/ _` | __/ _ \ | `_ \ / _` | |_ | `__/ _ \ `_ \ / _ \| `__| __|
    | | | (__| | |  __/ (_| | ||  __/ | |_) | (_| |  _|| | |  __/ |_) | (_) | |  | |_
    |_|  \___|_|  \___|\__,_|\__\___| | .__/ \__,_|_|  |_|  \___| .__/ \___/|_|   \__|
                                      |_|                       |_|
    */

    %utlfkil(d:/pdf/table.pdf);

    %utl_rbeginx;
    parmcards4;
    library(gtsummary)
    library(gt)
    library(haven)
    have<-read_sas(
      "d:/sd1/have.sas7bdat")
    tbl <- have |>
     tbl_summary(by = TRT
      ,include = c(AGE,GRADE)) |>
     add_p() |>
     separate_p_footnotes() |>
     modify_column_unhide(
       "statistic") |>
     as_gt()
    gt::gtsave(tbl
      , "d:/pdf/table.pdf")
    ;;;;
    %utl_rendx;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*___                        _         _            _                              _
    |___ \    ___ _ __ ___  __ _| |_ ___  | |_ _____  _| |_  _ __ ___ _ __   ___  _ __| |_
      __) |  / __| `__/ _ \/ _` | __/ _ \ | __/ _ \ \/ / __|| `__/ _ \ `_ \ / _ \| `__| __|
     / __/  | (__| | |  __/ (_| | ||  __/ | ||  __/>  <| |_ | | |  __/ |_) | (_) | |  | |_
    |_____|  \___|_|  \___|\__,_|\__\___|  \__\___/_/\_\\__||_|  \___| .__/ \___/|_|   \__|
                                                                     |_|
    */

    %utl_pdftotext(
       d:/pdf/table.pdf
      ,d:/txt/table.txt
    )

    /**************************************************************************************************************************/
    /*|                       A             B                                                                                 */
    /*|                             1            1               2                                                            */
    /*| Characteristic       N = 24       N = 26     Statistic p-value                                                        */
    /*|                                                                3                                                      */
    /*| AGE                42 (34, 53) 48 (34, 56)      294          0.7                                                      */
    /*|                                                                4                                                      */
    /*| GRADE                                          0.290         0.9                                                      */
    /*|                                                                                                                       */
    /*|      1               7 (29%)      9 (35%)                                                                             */
    /*|                                                                                                                       */
    /*|      2               9 (38%)     10 (38%)                                                                             */
    /*|                                                                                                                       */
    /*|      3               8 (33%)      7 (27%)                                                                             */
    /*| 1                                                                                                                     */
    /*|     Median (Q1, Q3); n (%)                                                                                            */
    /*| 2                                                                                                                     */
    /*|     Wilcoxon rank sum test; Pearson’s Chi-squared test                                                                */
    /*| 3                                                                                                                     */
    /*|     Wilcoxon rank sum test                                                                                            */
    /*| 4                                                                                                                     */
    /*|     Pearson’s Chi-squared test                                                                                        */
    /**************************************************************************************************************************/

    /*____            _       _           _
    |___ /   _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___  ___
      |_ \  | `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \/ __|
     ___) | | | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) \__ \
    |____/  |_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/|___/
                                                      |_|
    */

    https://github.com/rogerjdeangelis/utl-Compendium-of-proc-report-clinical-tables
    https://github.com/rogerjdeangelis/utl-area-under-y-equal-x-squared-from-0-to-1-trapezoid-auc-clinical
    https://github.com/rogerjdeangelis/utl-clinical-if-a-patient-answers-yes-to-any-of-four-questions-they-will-be-ineligible
    https://github.com/rogerjdeangelis/utl-clinical-trials-futility-analysis
    https://github.com/rogerjdeangelis/utl-closed-form-solution-for-sample-size-in-a-clinical-equlivalence-trial-using-r-and-sas-and-sympy
    https://github.com/rogerjdeangelis/utl-converting-r-sas-and-excel-serial-dates-to-sqllite-serial-dates-and-posix-iso8601-clinical
    https://github.com/rogerjdeangelis/utl-create-a-simple-n-percent-clinical-table-in-r-sas-wps-python-output-pdf-rtf-xlsx-html-list
    https://github.com/rogerjdeangelis/utl-creating-a-clinical-demographic-report-using-r-and-python-sql
    https://github.com/rogerjdeangelis/utl-creating-a-clinical-n-mean-stddev-median-min-max-sas-dataset-from-proc-tabulate
    https://github.com/rogerjdeangelis/utl-creating-big-N-headers-in-your-reports-corresp-clinical-ods
    https://github.com/rogerjdeangelis/utl-data-process-model-for-clinical-adverse-events
    https://github.com/rogerjdeangelis/utl-do-clinical-visits-occur-according-to-study-schedule
    https://github.com/rogerjdeangelis/utl-dumify-a-crossover-clinical-trial-design-sas-with-and-without-macro-arrays
    https://github.com/rogerjdeangelis/utl-excluding-patients-that-had-same-condition-pre-and-post-clinical-randomization-hash
    https://github.com/rogerjdeangelis/utl-extract-icd9-codes-from-strings-clinical
    https://github.com/rogerjdeangelis/utl-last-assay-date-prior-to-exposure-date-clinical
    https://github.com/rogerjdeangelis/utl-make-fake-relational-clinical-tables-demographics-lab-exposure-adverse-events
    https://github.com/rogerjdeangelis/utl-mapping-clinical-terms-to-descriptions-for-a-large-number-of-vocabularies
    https://github.com/rogerjdeangelis/utl-r-creating-publication-ready-tables-in-ms-word-clinical
    https://github.com/rogerjdeangelis/utl-randomly-select-an-equal-number-of-screened-subjects-to-each-arm-of-a-clinical-trial
    https://github.com/rogerjdeangelis/utl-scan-and-extract-character-and-numeric-data-from-a-clinical-narative-of-one-million-bytes
    https://github.com/rogerjdeangelis/utl-set-the-clinical-programming-environment-and-extract-titles-foot-column-headings-from-mocks
    https://github.com/rogerjdeangelis/utl-simple-clinical-survival-plot-using-r-packages-kaplan-meier-curves
    https://github.com/rogerjdeangelis/utl-stat101-determining-sample-size-and-power-for-a-two-arm-clinical-trial-using-python-r
    https://github.com/rogerjdeangelis/utl-using-title-and-footnote-meta-data-to-drive-clinical-reports
    https://github.com/rogerjdeangelis/utl_clinical_n_percent_crosstab
    https://github.com/rogerjdeangelis/utl_clinical_report
    https://github.com/rogerjdeangelis/utl_minimal_code_for_demographic_clinical_n_percent_report
    https://github.com/rogerjdeangelis/utl_minimum_code_npct_clinical_report_with_bigN_headers

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
