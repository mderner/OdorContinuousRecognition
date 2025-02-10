Code

We used Matlab R2019a. To reproduce the figures in the manuscript, copy all the files into one folder, start matlab and navigate to the repository-folder.

cd('/Path/to/this/repo');

Then call one of these functions:

•	figure1.m: graphics from Fig1 which are rasterplots, mean instantaneous firing rates and spike density.

•	figure2.m: graphics from Fig2 (A-C) rasterplots, mean instantaneous firing rates and spike density 

•	figure2_ensembleActivity.m: graphics from Fig2 D which are instantaneous firing rates of ensemble activity 

•	ensembleActivity_clusterTest.m: performes cluster permutation test (Fig2 D)

•	tTests.m: performes paired and unpaired t-tests for all units (pre vs. stimulus, odor vs. non-odor), gives number of significant units and p-values of binomialtests.

Further .m files are included because they are called by the above scripts at some point or another.


Data

•	Figure1: data to plot example stimulus-responsive units, see Fig1, use code figure1.m

•	Figure2: data to plot example odor-associated units, see Fig2 (A-C), use code figure2.m

•	Fig2_emsemble: data to plot ensemble activity (Fig2 D use code figure2_ensembleActivity.m)

•	zScores: z-scores in each of the four time windows and prestimulus interval of each trial of each unit to test for stimulus-responsive and odor-associated units, use code tTests.m

•	scoresANOVA: p-Value results of t-tests for odor-associated (testOdor) and stimulus-responsive (testPre) units and table zScores with mean z-scores
