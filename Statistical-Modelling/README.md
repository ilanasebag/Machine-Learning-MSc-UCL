# Statistical-Modelling

The dataset gives 2022 measurements of NOx (nitrogen oxide) pollution content in the ambient
air and some related variables. The measurements were taken over one year (typically 5-6
measurements a day) at a certain place in Switzerland close to a motorway. Data are sorted in
order of the day and time at which the measurements were taken.

The variables are (in order of appearance as columns in the data file):

- nox : NOx concentration in ambient air [ppb].
- noxem : Sum of NOx emission of cars on this motorway (units not given in my source).
- ws : Wind speed in m/s.
- humidity : Absolute humidity in the air in g/kg air.


The data were collected by an environmental research institute in order to make quantitative
statements about the strength of the influence of the three regressors noxem, ws and humidity
on the response variable nox.

In this repository, we aim to find a recommended fitted model in order to advise the institute about this data.
