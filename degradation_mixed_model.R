library(lme4)

library(lmerTest)

library(pbkrtest)

library(emmeans)

Model <- lmer(Ibuprofen ~ Day*Culture*Trt + (1|Reactor), data = IbuprofenData)

#lmer is used to fit the mixed model

#(1|Reactor) is used to indicate Reactor as a random effect

#You can look at summary(Model), most of that output is NOT very helpful.  I do like to check the random effects very briefly.

#This will give a diagnostic plot of resids vs fitted values

plot(Model)

#Pause and look at the ANOVA table.  Using the F-tests in the ANOVA table is a strategy to control for multiple testing.

anova(Model)

#From here, emmeans is VERY flexible.  But this means WE need to be thoughtful about what tests to run.

#For now, I am going to focus on comparing between treatments, separate for each culture and day.

emmeans(Model, pairwise ~ Trt|Day*Culture)

# Just another example, suppose we want pairwise comparisons of downstream timepoints vs day 0 separately for each Trt and Culture:

emmeans(Model, dunnett ~ Day|Trt*Culture)
