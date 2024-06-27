---
title: poly-plague
description: a coronavirus dashboard for cal poly
repo: https://github.com/zimeg/poly-plague
order: 6
---

covid started halfway through my second year of college.

this was [a hectic time][hectic] and most people returned to their hometown
while [classes went online][finals] for the spring quarter.

## frequent testing policies

many students returned to san luis obispo in the fall despite most classes
remaining online.

as a precaution the university mandated that all students visiting campus
[submit a negative test][fall] and test regularly.

fall quarter of 2020 mostly required tests for [those visiting campus][campus].

resources were expanded in the winter quarter and testing was done twice a week.

by spring quarter the [nasal swabs were replaced][saliva] by saliva tests.

waiting for results days after testing always induced anxiety but viewing the
combined results was interesting:

![a dashboard showing coronavirus testing statistics with around thirty thousand total tests and six hundred positive cases](/code/poly-plague/chw.png "everything is fine it's all good")

## reacting to an omicron surge

the omicron variant spread widely over winter break in december 2021.

an immediate [spike in positive cases][surge] followed as students returned to
campus with each day breaking previous records.

this was extremely stressful as [classes continued in-person][omicron].

to cope with these stresses i made [another dashboard][dashboard] to display
data in a chart that could be adjusted:

![the same coronavirus testing statistics in a dashboard in a graph that can be adjusted](/code/poly-plague/dashboard.png "return from winter break")

## slow deterioration of software

data for the chart was automatically downloaded from the campus dashboard and
reformatted to make parsing easier.

an unexpected [update to the source data structure][update] broke the logic that
reformatted this data days after the site was published.

having little will and energy to make a fix, the site remained broken.

but the data continued to be downloaded and [committed to history][commits].

testing requirements and [the covid dashboard were removed][removal] at the
start of the 2022 fall quarter.

this included all references to the data as far as i know.

however the last updates to the data can still be accessed from the commits.

[campus]: https://mustangnews.net/cal-poly-releases-new-covid-19-testing-requirements/
[commits]: https://github.com/zimeg/poly-plague/commits/main
[dashboard]: https://poly-plague.vercel.app
[fall]: https://mustangnews.net/covid-19-safety-measures-for-student-employees/
[finals]: https://mustangnews.net/cal-poly-mandates-online-final-exams-for-winter-quarter-employees-continue-to-work-on-campus/
[hectic]: https://mustangnews.net/new-details-cal-poly-will-hold-in-person-finals-but-spring-break-travel-discouraged/
[omicron]: https://mustangnews.net/omicron-goes-to-school-students-and-faculty-frustrated-upon-return-to-campus-amid-largest-covid-19-surge/
[removal]: https://mustangnews.net/cal-poly-no-longer-requiring-covid-19-tests-for-unvaccinated-students-scraps-covid-dashboard/
[saliva]: https://mustangnews.net/university-adopts-new-covid-19-testing-methods-for-winter-quarter/
[surge]: https://mustangnews.net/cp-students-covid-jan-spike/
[update]: https://mustangnews.net/cal-poly-updates-covid-19-dashboard-to-show-number-of-covid-positive-students-not-just-total-positive-tests/
