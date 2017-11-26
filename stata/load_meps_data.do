cd /Users/Kaveh/Dropbox/Berkeley/projects/econ/medexp/rawdata
set more off 


/* 
* notes on race

* in 1996: same as 2001
* in 2001: 1 indian, 2 aleut/eskimo, 3 api, 4 black, 5 white (racex)
** racethnx: 1 hispanic, 2 black/nothisp, 3 other
* in 2002: 1 white, 2 black, 3 namer, 4 asian, 5 api, 6 multiple
** racethnx: 1 hispanic, 2 black/nohisp, 3 asian not hisp, 4 other
* in 2005: same as 2002
* in 2011: same as 2002
* in 2012: same as 2002
* in 2013: same as 2015
* in 2014: same as 2015
* in 2015: same as 2002/5, except category 5 (api) lumped in with asian

*/ 

* LOAD AND SAVE 2015 

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    CPSFAMID 29-30 ///
  byte   AGE15X 177-178 ///
  byte   RACEV1X 188-188 ///
  byte   RACETHX 194-194 ///
  long   TTLP15X 1418-1424 ///
  long   FAMINC15 1425-1431 ///
  byte   POVCAT15 1432-1432 ///
  double POVLEV15 1433-1443 ///
  long   TOTEXP15 2563-2568 ///
  long   TOTSLF15 2569-2573 ///
  double PERWT15F 5284-5295 ///
  double FAMWT15F 5296-5307 ///
  byte   INSCOV15 2174-2174 ///
using `"h181.dat"'

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid cpsfamid age15x racev1x racethx ///
	faminc15 ttlp15x povlev15 povcat15 ///
	totexp15 totslf15 ///
	perwt15f famwt15f ///
	inscov15

* rename variables
rename (cpsfamid age15x racev1x racethx) (famid age race ethn)
rename (faminc15 ttlp15x povlev15 povcat15) (faminc perinc povlev povcat)
rename (totexp15 totslf15) (totexp totslf)
rename (perwt15f famwt15f) (perwt famwt)
rename inscov15 inscov

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 2015

* save dataset 
tempfile m2015
save `m2015'

***********************

* LOAD AND SAVE 2014

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    CPSFAMID 29-30 ///
  byte   AGE14X 177-178 ///
  byte   RACEV1X 188-188 ///
  long   TTLP14X 1440-1446 ///
  long   FAMINC14 1447-1452 ///
  byte   POVCAT14 1453-1453 ///
  double POVLEV14 1454-1464 ///
  long   TOTEXP14 2584-2589 ///
  long   TOTSLF14 2590-2594 ///
  double PERWT14F 5333-5344 ///
  double FAMWT14F 5345-5356 ///
  byte   INSCOV14 2196-2196 ///
using `"h171.dat"'


* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid cpsfamid age14x racev1x ///
	faminc ttlp14x povlev povcat ///
	totexp totslf ///
	perwt14f famwt14f ///
	inscov

* rename variables
rename (cpsfamid age14x racev1x) (famid age race)
rename (faminc14 ttlp14x povlev14 povcat14) (faminc perinc povlev povcat)
rename (totexp14 totslf14) (totexp totslf)
rename (perwt14f famwt14f) (perwt famwt)
rename inscov14 inscov

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2014

* save dataset 
tempfile m2014
save `m2014'



***********************

* LOAD AND SAVE 2013

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    CPSFAMID 29-30 ///
  byte   AGE13X 177-178 ///
  byte   RACEV1X 189-189 ///
  long   TTLP13X 1362-1368 ///
  long   FAMINC13 1369-1375 ///
  byte   POVCAT13 1376-1376 ///
  double POVLEV13 1377-1388 ///
  long   TOTEXP13 2474-2479 ///
  long   TOTSLF13 2480-2485 ///
  double PERWT13F 5166-5177 /// 
  double FAMWT13F 5178-5189 ///
  byte   INSCOV13 2071-2071 ///
using `"h163.dat"' 


* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid cpsfamid age13x racev1x ///
	faminc ttlp13x povlev povcat ///
	totexp totslf ///
	perwt13f famwt13f ///
	inscov

* rename variables
rename (cpsfamid age13x racev1x) (famid age race)
rename (faminc13 ttlp13x povlev13 povcat13) (faminc perinc povlev povcat)
rename (totexp13 totslf13) (totexp totslf)
rename (perwt13f famwt13f) (perwt famwt)
rename inscov13 inscov

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2013

* save dataset 
tempfile m2013
save `m2013'



***********************

* LOAD AND SAVE 2012

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    CPSFAMID 29-30 ///
  byte   AGE12X 199-200 ///
  byte   RACEV1X 211-211 ///
  long   TTLP12X 1502-1507 ///
  long   FAMINC12 1508-1513 ///
  byte   POVCAT12 1514-1514 ///
  double POVLEV12 1515-1525 ///
  long   TOTEXP12 2677-2682 ///
  long   TOTSLF12 2683-2688 ///
  double PERWT12F 5303-5314 ///
  double FAMWT12F 5315-5326 ///
  byte   INSCOV12 2211-2211 ///
using `"h155.dat"' 


* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid cpsfamid age12x racev1x ///
	faminc ttlp12x povlev povcat ///
	totexp totslf ///
	perwt12f famwt12f ///
	inscov

* rename variables
rename (cpsfamid age12x racev1x) (famid age race)
rename (faminc12 ttlp12x povlev12 povcat12) (faminc perinc povlev povcat)
rename (totexp12 totslf12) (totexp totslf)
rename (perwt12f famwt12f) (perwt famwt)
rename inscov12 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2012

* save dataset 
tempfile m2012
save `m2012'


***********************

* LOAD AND SAVE 2011

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    CPSFAMID 29-30 ///
  byte   AGE11X 199-200 ///
  byte   RACEX 210-210 ///
  long   TTLP11X 1834-1839 ///
  long   FAMINC11 1840-1846 ///
  byte   POVCAT11 1847-1847 ///
  double POVLEV11 1848-1858 ///
  long   TOTEXP11 3015-3021 ///
  long   TOTSLF11 3022-3026 ///
  double PERWT11F 5696-5708 ///
  double FAMWT11F 5709-5720 ///
  byte   INSCOV11 2547-2547 ///
using `"h147.dat"' 


* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid cpsfamid age11x racex ///
	faminc ttlp11x povlev povcat ///
	totexp totslf ///
	perwt11f famwt11f ///
	inscov

* rename variables
rename (cpsfamid age11x racex) (famid age race)
rename (faminc11 ttlp11x povlev11 povcat11) (faminc perinc povlev povcat)
rename (totexp11 totslf11) (totexp totslf)
rename (perwt11f famwt11f) (perwt famwt)
rename inscov11 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2011

* save dataset
tempfile m2011
save `m2011'


***********************

* LOAD AND SAVE 2010

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    CPSFAMID 29-30 ///
  byte   AGE10X 199-200 ///
  byte   RACEX 210-210 ///
  long   TTLP10X   1563-1568 ///
  long   FAMINC10  1569-1574 ///
  byte   POVCAT10  1575-1575 ///
  double POVLEV10  1576-1586 ///
  long   TOTEXP10  2730-2735 ///
  long   TOTSLF10  2736-2740 ///
  double PERWT10F  5505-5516 ///
  double FAMWT10F  5517-5528 ///
  byte   INSCOV10  2275-2275 ///
using `"h138.dat"' 


* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid cpsfamid age10x racex ///
	faminc ttlp10x povlev povcat ///
	totexp totslf ///
	perwt10f famwt10f ///
	inscov

* rename variables
rename (cpsfamid age10x racex) (famid age race)
rename (faminc10 ttlp10x povlev10 povcat10) (faminc perinc povlev povcat)
rename (totexp10 totslf10) (totexp totslf)
rename (perwt10f famwt10f) (perwt famwt)
rename inscov10 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2010

* save dataset
tempfile m2010
save `m2010'

***********************

* LOAD AND SAVE 2009

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    CPSFAMID 29-30 ///
  byte   AGE09X 206-207 ///
  byte   RACEX 217-217 ///
  long   TTLP09X 1563-1568 ///
  long   FAMINC09 1569-1574 ///
  byte   POVCAT09 1575-1575 ///
  double POVLEV09 1576-1586 ///
  long   TOTEXP09 2723-2728 ///
  long   TOTSLF09 2729-2734 ///
  double PERWT09F 5564-5575 ///
  double FAMWT09F 5576-5587 ///
  byte   INSCOV09 2268-2268 ///
using `"h129.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid cpsfamid age09x racex ///
	faminc ttlp09x povlev povcat ///
	totexp totslf ///
	perwt09f famwt09f ///
	inscov

* rename variables
rename (cpsfamid age09x racex) (famid age race)
rename (faminc09 ttlp09x povlev09 povcat09) (faminc perinc povlev povcat)
rename (totexp09 totslf09) (totexp totslf)
rename (perwt09f famwt09f) (perwt famwt)
rename inscov09 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2009

* save dataset
tempfile m2009
save `m2009'


***********************

* LOAD AND SAVE 2008

clear 

* INPUT ALL VARIABLES
* XX check if FAMID08 and CPSFAMID interchangeable
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID08 25-26 ///
  byte   AGE08X 193-194 ///
  byte   RACEX 217-217 ///
  long   TTLP08X 356-362 ///
  long   FAMINC08 363-369 ///
  byte   POVCAT08 370-370 ///
  double POVLEV08 371-381 ///
  long   TOTEXP08 2716-2721 ///
  long   TOTSLF08 2722-2726 ///
  double PERWT08F 5357-5368 ///
  double FAMWT08F 5369-5380 ///
  byte   INSCOV08 2276-2276 ///
using `"h121.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid08 age08x racex ///
	faminc ttlp08x povlev povcat ///
	totexp totslf ///
	perwt08f famwt08f ///
	inscov

* rename variables
rename (famid08 age08x racex) (famid age race)
rename (faminc08 ttlp08x povlev08 povcat08) (faminc perinc povlev povcat)
rename (totexp08 totslf08) (totexp totslf)
rename (perwt08f famwt08f) (perwt famwt)
rename inscov08 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2008

* save dataset
tempfile m2008
save `m2008'



***********************

* LOAD AND SAVE 2007

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID07 25-26 ///
  byte   AGE07X 193-194 ///
  byte   RACEX 201-201 ///
  long   TTLP07X 340-345 ///
  long   FAMINC07 346-351 ///
  byte   POVCAT07 352-352 ///
  double POVLEV07 353-363 ///
  long   TOTEXP07 2465-2470 ///
  long   TOTSLF07 2471-2475 ///
  double PERWT07F 5102-5113 ///
  double FAMWT07F 5114-5125 ///
  byte   INSCOV07 2025-2025 ///
using `"h113.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid07 age07x racex ///
	faminc ttlp07x povlev povcat ///
	totexp totslf ///
	perwt07f famwt07f ///
	inscov

* rename variables
rename (famid07 age07x racex) (famid age race)
rename (faminc07 ttlp07x povlev07 povcat07) (faminc perinc povlev povcat)
rename (totexp07 totslf07) (totexp totslf)
rename (perwt07f famwt07f) (perwt famwt)
rename inscov07 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 2007

* save dataset
tempfile m2007
save `m2007'

***********************

* LOAD AND SAVE 2006

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID06 25-26 ///
  byte   AGE06X 207-208 ///
  byte   RACEX 216-216 ///
  long   TTLP06X 355-360 ///
  byte   POVCAT06 361-361 ///
  long   TOTEXP06 2470-2475 ///
  long   TOTSLF06 2476-2481 ///
  double PERWT06F 4549-4560 ///
  double FAMWT06F 4561-4572 ///
  byte   INSCOV06 2030-2030 ///
using `"h105.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid06 age06x racex ///
	ttlp06x povcat ///
	totexp totslf ///
	perwt06f famwt06f ///
	inscov

* rename variables
rename (famid06 age06x racex) (famid age race)
rename (ttlp06x povcat06) (perinc povcat)
rename (totexp06 totslf06) (totexp totslf)
rename (perwt06f famwt06f) (perwt famwt)
rename inscov06 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2006

* save dataset
tempfile m2006
save `m2006'


***********************

* LOAD AND SAVE 2005

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID05 25-26 ///
  byte   AGE05X 207-208 ///
  byte   RACEX 216-216 ///
  long   TTLP05X 347-352 ///
  byte   POVCAT05 353-353 ///
  long   TOTEXP05 2423-2428 ///
  long   TOTSLF05 2429-2433 ///
  double PERWT05F 4470-4481 ///
  double FAMWT05F 4482-4493 ///
  byte   INSCOV05 2023-2023 ///
using `"h97.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid05 age05x racex ///
	ttlp05x povcat ///
	totexp totslf ///
	perwt05f famwt05f ///
	inscov

* rename variables
rename (famid05 age05x racex) (famid age race)
rename (ttlp05x povcat05) (perinc povcat)
rename (totexp05 totslf05) (totexp totslf)
rename (perwt05f famwt05f) (perwt famwt)
rename inscov05 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 2005

* save dataset
tempfile m2005
save `m2005'


***********************

* LOAD AND SAVE 2004

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID04 24-25 ///
  byte   AGE04X 206-207 ///
  byte   RACEX 215-215 ///
  long   TTLP04X 366-371 ///
  byte   POVCAT04 372-372 ///
  long   TOTEXP04 2395-2400 ///
  long   TOTSLF04 2401-2405 ///
  double PERWT04F 4411-4422 ///
  double FAMWT04F 4423-4434 ///
  byte   INSCOV04 2011-2011 ///
using `"h89.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid04 age04x racex ///
	ttlp04x povcat ///
	totexp totslf ///
	perwt04f famwt04f ///
	inscov

* rename variables
rename (famid04 age04x racex) (famid age race)
rename (ttlp04x povcat04) (perinc povcat)
rename (totexp04 totslf04) (totexp totslf)
rename (perwt04f famwt04f) (perwt famwt)
rename inscov04 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2004

* save dataset
tempfile m2004
save `m2004'

***********************

* LOAD AND SAVE 2003

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID03 24-25 ///
  byte   AGE03X 206-207 ///
  byte   RACEX 215-215 ///
  long   TTLP03X 366-372 ///
  byte   POVCAT03 373-373 ///
  long   TOTEXP03 2386-2391 ///
  long   TOTSLF03 2392-2397 ///
  double PERWT03F 4412-4423 ///
  double FAMWT03F 4424-4435 ///
  byte   INSCOV03 2004-2004 ///
using `"h79.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid03 age03x racex ///
	ttlp03x povcat ///
	totexp totslf ///
	perwt03f famwt03f ///
	inscov

* rename variables
rename (famid03 age03x racex) (famid age race)
rename (ttlp03x povcat03) (perinc povcat)
rename (totexp03 totslf03) (totexp totslf)
rename (perwt03f famwt03f) (perwt famwt)
rename inscov03 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)


* create year variable
gen year = 2003

* save dataset
tempfile m2003
save `m2003'


***********************

* LOAD AND SAVE 2002

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID02 24-25 ///
  byte   AGE02X 206-207 ///
  byte   RACEX 215-215 ///
  long   TTLP02X 365-370 ///
  byte   POVCAT02 371-371 ///
  long   TOTEXP02 2365-2370 ///
  long   TOTSLF02 2371-2375 ///
  double PERWT02F 4418-4429 ///
  double FAMWT02F 4430-4441 ///
  byte   INSCOV02 1264-1264 ///
using `"h70.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid02 age02x racex ///
	ttlp02x povcat ///
	totexp totslf ///
	perwt02f famwt02f ///
	inscov

* rename variables
rename (famid02 age02x racex) (famid age race)
rename (ttlp02x povcat02) (perinc povcat)
rename (totexp02 totslf02) (totexp totslf)
rename (perwt02f famwt02f) (perwt famwt)
rename inscov02 inscov

* recode race variable to be consistent with 2015
recode race (5 = 4)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 2002

* save dataset
tempfile m2002
save `m2002'


***********************

* LOAD AND SAVE 2001

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID01 24-25 ///
  byte   AGE01X 207-208 ///
  byte   RACEX 216-216 ///
  long   TTLP01X 396-401 ///
  byte   POVCAT01 402-402 ///
  long   TOTEXP01 2316-2321 ///
  long   TOTSLF01 2322-2326 ///
  double PERWT01F 4301-4312 ///
  double FAMWT01F 4313-4324 ///
  byte   INSCOV01 1290-1290 ///
using `"h60.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid01 age01x racex ///
	ttlp01x povcat ///
	totexp totslf ///
	perwt01f famwt01f ///
	inscov

* rename variables
rename (famid01 age01x racex) (famid age race)
rename (ttlp01x povcat01) (perinc povcat)
rename (totexp01 totslf01) (totexp totslf)
rename (perwt01f famwt01f) (perwt famwt)
rename inscov01 inscov

* recode race variable to be consistent with 2015
recode race (1 2 = 3) (3 = 4) (4 = 2) (5 = 1)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 2001

* save dataset
tempfile m2001
save `m2001'


***********************

* LOAD AND SAVE 2000

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID00 24-25 ///
  byte   AGE00X 212-213 ///
  byte   RACEX 221-221 ///
  long   TTLP00X 398-403 ///
  byte   POVCAT00 404-404 /// 
  long   TOTEXP00 2300-2305 ///
  long   TOTSLF00 2306-2310 ///
  double PERWT00F 4255-4266 ///
  double FAMWT00F 4267-4278 ///
  byte   INSCOV00 1297-1297 ///
using `"h50.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid00 age00x racex ///
	ttlp00x povcat ///
	totexp totslf ///
	perwt00f famwt00f ///
	inscov

* rename variables
rename (famid00 age00x racex) (famid age race)
rename (ttlp00x povcat00) (perinc povcat)
rename (totexp00 totslf00) (totexp totslf)
rename (perwt00f famwt00f) (perwt famwt)
rename inscov00 inscov

* recode race variable to be consistent with 2015
recode race (1 2 = 3) (3 = 4) (4 = 2) (5 = 1)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 2000

* save dataset
tempfile m2000
save `m2000'


***********************

* LOAD AND SAVE 1999

clear 

* INPUT ALL VARIABLES
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID99 24-25 ///
  byte   AGE99X 212-213 ///
  byte   RACEX 221-221 ///
  long   TTLP99X 401-406 ///
  byte   POVCAT99 407-407 ///
  long   TOTEXP99 1749-1754 ///
  long   TOTSLF99 1755-1759 ///
  double PERWT99F 3657-3668 ///
  double FAMWT99F 3669-3680 ///
  byte   INSCOV99 1302-1302 ///
using `"h38.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid99 age99x racex ///
	ttlp99x povcat ///
	totexp totslf ///
	perwt99f famwt99f ///
	inscov

* rename variables
rename (famid99 age99x racex) (famid age race)
rename (ttlp99x povcat99) (perinc povcat)
rename (totexp99 totslf99) (totexp totslf)
rename (perwt99f famwt99f) (perwt famwt)
rename inscov99 inscov

* recode race variable to be consistent with 2015
recode race (1 2 = 3) (3 = 4) (4 = 2) (5 = 1)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
* XX check to make sure not doubling incomes for joint filers
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 1999

* save dataset
tempfile m1999
save `m1999'


***********************

* LOAD AND SAVE 1998

clear 

* INPUT ALL VARIABLES
* check if WTDPER98 and PERWTYYF are interchangeable
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID98 24-25 ///
  byte   AGE98X 198-199 ///
  byte   RACEX 207-207 ///
  double TTLP98X 398-406 ///
  byte   POVCAT98 407-407 ///
  long   TOTEXP98 1691-1696 ///
  long   TOTSLF98 1697-1701 ///
  double WTDPER98 3578-3589 ///
  double WTFAMF98 3590-3601 ///
  byte   INSCOV98 1362-1362 ///
using `"h28.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid98 age98x racex ///
	ttlp98x povcat ///
	totexp totslf ///
	wtdper98 wtfamf98 ///
	inscov

* rename variables
rename (famid98 age98x racex) (famid age race)
rename (ttlp98x povcat98) (perinc povcat)
rename (totexp98 totslf98) (totexp totslf)
rename (wtdper98 wtfamf98) (perwt famwt)
rename inscov98 inscov

* recode race variable to be consistent with 2015
recode race (1 2 = 3) (3 = 4) (4 = 2) (5 = 1)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
* XX check to make sure not doubling incomes for joint filers
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 1998

* save dataset
tempfile m1998
save `m1998'


***********************

* LOAD AND SAVE 1997

clear 

* INPUT ALL VARIABLES
* check if WTDPER98 and PERWTYYF are interchangeable
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID97 24-25 ///
  byte   AGE97X 196-197 ///
  byte   RACEX 205-206 ///
  double TTLP97X 398-406 ///
  byte   POVCAT97 407-407 ///
  long   TOTEXP97 1584-1589 ///
  long   TOTSLF97 1590-1594 ///
  double WTDPER97 3544-3555 ///
  double WTFAMF97 3556-3567 ///
  byte   INSCOV97 1354-1354 ///
using `"h20.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid97 age97x racex ///
	ttlp97x povcat ///
	totexp totslf ///
	wtdper97 wtfamf97 ///
	inscov

* rename variables
rename (famid97 age97x racex) (famid age race)
rename (ttlp97x povcat97) (perinc povcat)
rename (totexp97 totslf97) (totexp totslf)
rename (wtdper97 wtfamf97) (perwt famwt)
rename inscov97 inscov

* recode race variable to be consistent with 2015
recode race (1 2 = 3) (3 = 4) (4 = 2) (5 = 1)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
* XX check to make sure not doubling incomes for joint filers
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 1997

* save dataset
tempfile m1997
save `m1997'


***********************

* LOAD AND SAVE 1996

clear 

* INPUT ALL VARIABLES
* check if WTDPERYY and PERWTYYF are interchangeable
* check if TTLPNX and TTLPYYX interchangeable
quietly infix ///
  long   DUID 1-5 ///
  int    PID 6-8 ///
  str    DUPERSID 9-16 ///
  str    FAMID96 21-22 ///
  byte   AGE96X 170-171 ///
  byte   RACEX 179-180 ///
  double TTLPNX 347-355 ///
  byte   POVCAT 356-356 ///
  long   TOTEXP96 1871-1876 ///
  long   TOTSLF96 1877-1881 ///
  double WTDPER96 3549-3560 ///
  double WTFAMF96 3525-3536 ///
  byte   INSCOV96 1367-1367 ///
using `"h12.dat"' 

* rename vars to lowercase
rename *, lower

* keep necessary vars
keep duid pid dupersid famid96 age96x racex ///
	ttlpnx povcat ///
	totexp totslf ///
	wtdper96 wtfamf96 ///
	inscov

* rename variables
rename (famid96 age96x racex) (famid age race)
rename ttlpnx perinc
rename (totexp96 totslf96) (totexp totslf)
rename (wtdper96 wtfamf96) (perwt famwt)
rename inscov96 inscov

* recode race variable to be consistent with 2015
recode race (1 2 = 3) (3 = 4) (4 = 2) (5 = 1)

* aggregate total medical expenditures within families
bys duid famid: egen totexpfam = sum(totexp)
bys duid famid: egen totslffam = sum(totslf)

* aggregate total income within families
* XX validate that this is correct way to generate faminc (using data from later years)
* XX check to make sure not doubling incomes for joint filers
bys duid famid: egen faminc = sum(perinc)

* impose $100 floor for family income
replace faminc = 100 if faminc<=99

* generate health care service burden
gen hburden = (totslffam > 0.1*faminc)

* create age categories
recode age (18/34 = 101) (35/54 = 102) (55/64 = 103) (65/85 = 104) (nonmissing = .), gen(agecat)

* create year variable
gen year = 1996

* save dataset
tempfile m1996
save `m1996'


********************

* append all files together

forvalues i=1997(1)2015 {
	append using `m`i''
}
save ../data_derived/meps, replace
outsheet using ../data_derived/meps.csv, comma replace

use ../data_derived/meps, clear
drop if age>64
gen count=1
collapse (mean) hburden (rawsum) count [pw=perwt], by(year agecat)
twoway ///
(connected hburden year if agecat==101) ///
(connected hburden year if agecat==102) ///
(connected hburden year if agecat==103)
