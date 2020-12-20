%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw2_205288439_p1.m
%
% Description: A script that computes students' homework data including
% submission date and duration of time taken. Also calculates decrease in
% credit for assignments submitted late according to a formula. 
%
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear all;
%% Inputs
dateMonth = input('Insert the assigned HW date, starting with months; e.g. XX/XX/XXXX\n'); %Inputs regarding assigned date.
dateDay = input('\n'); %Input for nth day of the month
dateYear = input('\n');%Input for year
if ((dateMonth > 12 || dateMonth < 1) || (dateDay > 30 || dateDay < 1) || dateYear <= 0) %Input processing. If month isnt 1-12, or day isn't 1-30 or year is before 0, error is produced.
    error('Invalid Input.');
end
assignmentTime = input('How long did the assignment take to finish (days)?\n'); %Asking for length to finish assignment.
if  (assignmentTime <= 0) %Input processing. Length of time must be positive.
    error('Invalid Input.');
end
%% Algorithm (Part A)
timeDays = rem(assignmentTime, 30); %this following algorithm breaks the earler input of assignmentTime into format (X days, X months, X years)
timeMonths = ((assignmentTime - timeDays) / 30); %Does so for months.
timeYears = 0; %By default, timeYears is set to zero.
if (timeMonths > 11) %If the time of the assignment is more than 11 months (12+), we begin calculating with years. 
    if (timeMonths == 12) %Sets timeYears to 0, timeMonths is zero. (12 mo = one year. We need to subtract months then!)
        timeYears = 1;
        timeMonths = 0;
    elseif (timeMonths > 12) %If duration is MORE than 12 months, we need to convert months into years, and store months as a remainder.
        timeYears = (timeMonths - rem(timeMonths, 12)) / 12; %Calculates 'timeYears' and finds assignment length in years w/ mod.
        timeMonths = rem(timeMonths, 12); %Redefines 'timeMonths' as a remainder.
    end
else 
    timeYears = 0; %Could be omitted. If the length of time spent on the assignment is less than 12 months, 0 years are involved. 
end

if (dateDay + timeDays <= 30) %I begin calculating the day on which the HW was submitted. Simplest case: dateDay+timeDays <= 30
    if (dateMonth + timeMonths <= 12) %Simplest case: months sum to les than 12. 
        endMonth = dateMonth + timeMonths; %Dates added.
        endDay = dateDay + timeDays; %Dates added.
        endYear = dateYear + timeYears; %Same.
    else %% "Else" being that dateMonth+timeMonths sum to more than 12 
        endMonth = dateMonth + timeMonths - 12; %Months are added, and 12 is subtracted.
        endDay = dateDay + timeDays; %Simplest case as before w/days. Just add them.
        endYear = dateYear + timeYears + 1; %End year is start date year + time spent years + 1, because the months "start over" for summing to more than 12.
    end
else %Case where days sum to more than 30. 
    if (dateMonth + timeMonths < 12) %Simplest case for months. Just add them.
        endMonth = dateMonth + timeMonths + 1; %Add an extra 1 because the days "roll over" and create a new month.
        endDay = dateDay + timeDays - 30; %Same concept as line before. Subtract 30 and add +1 to months. 
        endYear = dateYear + timeYears; %Sum years as normal.
    elseif(dateMonth + timeMonths >= 12) %% "Else" being that dateMonth+assignmentTimeMonths sum to more than 12 (or equal)
        endMonth = dateMonth + timeMonths - 12 + 1; %adding start month, and time in months. Subtracting 12 because months "roll over", and adding 1 because days of the month do too.
        endDay = dateDay + timeDays - 30; %Days roll over, adding one to month.
        endYear = dateYear + timeYears + 1; %Months roll over, adding one to year. 
    end
end
%% Display 
fprintf('Your homework was submitted on %02.0f/%02.0f/%02.0f\n', endMonth, endDay, endYear); %Outputting results.
%% Part B : Input
duedateMonth = input('Insert the assigned HW due date, starting with months; e.g. XX/XX/XXXX\n'); %Input in XX/XX/XXXX.
duedateDay = input('\n');
duedateYear = input('\n');
if ((duedateMonth > 12 || duedateMonth < 1) || (duedateDay > 30 || duedateDay < 1) || duedateYear <= 0)
    error('Invalid Input.\n'); %Same as before. Vetting for invalid inputs. See part (A). 
end
if (duedateYear < dateYear) %Additional vetting of inputs. Checking to make sure due date isn't before date assigned.
    error('Invalid Input. This is before the current date!\n'); %Does check for years.
elseif (duedateYear == dateYear && duedateMonth < dateMonth) %Does check for same year, different month case. 
    error('Invalid Input. This is before the current date!\n');
elseif (duedateYear == dateYear && duedateMonth == dateMonth && duedateDay < dateDay) %Does check for same year, same month. 
    error('Invalid Input. This is before the current date!\n');
end
%% Date Calculation 
% turns the due date into N days since the assignment date. Thus, I can
% directly compare with 'assignmentTime'. 
numberDaysSubmitted = 360 * endYear + 30 * endMonth + endDay; %Calculates the days since year 0. This is an extremely extremely straightforward way of comparing two dates.
numberDaysDue= 360 * duedateYear + 30* duedateMonth +duedateDay;
result = numberDaysSubmitted - numberDaysDue; %"result" is the difference b/t submission date and due date. It is the "lateness".
%% Output
if (result <= 0) %Case "result" <=0, work done on time.
        fprintf('Great work! Your score is 100!\n')
elseif(result > 0 && result < 5) %Work is less than five days late and more than 0 days late. 
        studentScore = 100 - result * 10; %Calculate 10% reduction per day.
        if (result == 1)
        fprintf('You were %.0f day late. Your score is %.0f\n',result, studentScore) %Written just for aesthetics. 1 "days" would not look as nice.
        else 
        fprintf('You were %.0f days late. Your score is %.0f\n',result, studentScore) %Prints lateness and result grade.
        end
else 
        fprintf('Too late! No credit is given.\n') %Case HW is five or more days late. 
end
        
