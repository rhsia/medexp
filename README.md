# Trends in the Financial Burden of Health Care Costs, 1999-2015

In light of [recent news](https://www.kff.org/health-costs/report/the-burden-of-medical-debt-results-from-the-kaiser-family-foundationnew-york-times-medical-bills-survey/) that many American families struggle with medical debt, we aim to characterize the financial burden of health care costs in the U.S.

We have two main goals:
- Characterize trends in costs over time
- Characterize trends in costs by personal characteristics such as income, race, age, and insurance coverage

As a first step, we define the following measure of financial burden: a family is "underinsured" if it spent more than 10% of its annual family income on out-of-pocket medical expenditures, including copays, deductibles, and payments not covered by insurance. This measure was a main outcome in [this](https://jamanetwork.com/journals/jama/fullarticle/204529) 2006 Banthin and Bernard paper; they call it "health care service burden."

One key point of clarification about this measure: even though expenditures and income are pooled across family members, the measure itself is defined for each individual.  Thus our analysis remains at the individual level, consistent with Banthan and Bernard.

We construct this measure using the Medical Expenditure Panel Survey ([MEPS](https://meps.ahrq.gov/mepsweb/)), which gathers detailed annual data on the costs and use of health care for the U.S. civilian noninstitutionalized population. The earliest (latest) available data is from 1996 (2015).

Let's first look at underinsurance over time across all individuals:

![Image](https://raw.githubusercontent.com/kdanesh/medexp/gh-pages/output/ui.png)

A few notes here:
- The 1996-2003 trend is consistent with Banthin and Bernard's findings.
- Our estimates do not precisely match theirs.  Two reasons this may be the case: we've used pre-tax while they've used post-tax income (hence our estimates are slightly lower), and I haven't gotten around to using the MEPS sample weights. 
- (Stating the obvious) This measure of financial burden looks to have peaked in the mid-2000s before falling back to earlier levels. This could be for many reasons, which could be interesting to look into (see next steps below).

Let's now look at underinsurance over time by income, race, age, and insurance coverage.

![Image](https://raw.githubusercontent.com/kdanesh/medexp/gh-pages/output/ui_pov.png)

![Image](https://raw.githubusercontent.com/kdanesh/medexp/gh-pages/output/ui_race.png)

![Image](https://raw.githubusercontent.com/kdanesh/medexp/gh-pages/output/ui_age.png)

![Image](https://raw.githubusercontent.com/kdanesh/medexp/gh-pages/output/ui_ins.png)

Some notes:
- The post-2007 fall in underinsurance seems to be concentrated among folks who are poor, older, and publicly insured or uninsured.
- The MEPS race variable doesn't have appear to have a "Hispanic" indicator. But they have an ethnicity variable that does, which I'll work on incorporating so that we can plot the trend for Hispanic individuals.
<<<<<<< HEAD
- I need to look into the weird 2007 kink in the plot by age. It's probably a coding error.
=======
- I need to look into the weird 2007 kink in the plot by age. It's probably because of a coding error.
>>>>>>> master

Potential next steps (roughly ordered by priority):
- Incorporate sample weights to make analysis representative of U.S. population
- Investigate 2007 kink in plot by age
- Figure out how to separate out Hispanic individuals
- Think of ways to test hypotheses for why underinsurance has decreased. Have people gotten healthier? Has insurance gotten better? Are people more reluctant to go to the doctor since they don't have money? Would be intersting to reject some of these hypotheses, and would probably also make the paper more compelling
- Construct alternate measure(s) of financial burden. Maybe a good one would be Banthin and Bernard's other main outcome measure, which they call "total burden" ("total" because it includes premiums)
- Plot underinsurance by health status (e.g., self-reported health, number of chronic conditions, etc.)
- Estimate post-tax income to precisely match B&B's numbers


