proc sql outobs=5;
title 'Top 5 Categories in Discharges Against Medical Advice 2019-2020';
   select Year, Category, Subcategory, '% AMA Discharges'n
   from work.patients
   order by '% AMA Discharges'n desc;
run;

proc sql outobs=5;
title 'Top 5 Readmissions Due To Discharge Against Medical Advice 2019-2020';
   select Year, 'Readmission After AMA or Not'n, 'Days Since Last Discharge'n, 'Readmission Rate'n
   from work.readmission
   order by readmission.'Readmission Rate'n desc;
run;

proc sgplot data=patients;
title 'AMA Discharges by Expected Payer 2019-2020';
   where Category='Expected Payer';
   vbar Subcategory / response='AMA Discharges'n;
run;