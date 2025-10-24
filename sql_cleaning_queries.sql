Create database Bank_Loan
Use Bank_Loan
Select * from raw_Loan_Applications

--Checking for Null Values
Select 
SUM(case when Gender IS NULL then 1 else 0 end) as Null_Gender,
SUM(case when Married IS NULL then 1 else 0 end) as Null_Married,
SUM(case when Dependents IS NULL then 1 else 0 end) as Null_Dependents,
SUM(case when Education IS NULL then 1 else 0 end) as Null_Education,
SUM(case when Self_Employed IS NULL then 1 else 0 end) as Null_Selfemployed,
SUM(case when ApplicantIncome IS NULL then 1 else 0 end) as Null_Applicantincome,
SUM(case when CoApplicantIncome IS NULL then 1 else 0 end) as Null_CoApplicantIncome,
SUM(case when LoanAmount IS NULL then 1 else 0 end) as Null_LoanAmount,
SUM(case when Loan_Amount_Term IS NULL then 1 else 0 end) as Null_LoanamountTerm,
SUM(case when Credit_History IS NULL then 1 else 0 end) as Null_Credithistory,
SUM(case when Property_Area IS NULL then 1 else 0 end) as Null_PropertyArea,
SUM(case when Loan_Status IS NULL then 1 else 0 end) as Null_LoanStatus
From raw_loan_Applications


Create view sql_cleaned_Loan_Applications as
Select * From raw_loan_Applications
where 
	LoanAmount is not null 
	and Credit_History is not null
	and Loan_Status is not null

Select * From sql_cleaned_Loan_Applications

--Total Applications,Approved&Rejected
select COUNT(*) as Total_Applications,
SUM(case when Loan_Status = 1 then 1 else 0 end) as Approved,
SUM(case when Loan_status = 0 then 1 else 0 end) as Rejected
from sql_cleaned_Loan_Applications

--Approval Rate
select
ROUND((sum(case when Loan_Status = 1 then 1 else 0 end)*100.0)/count(*),2) as Approval_rate_Percentage
from sql_cleaned_Loan_Applications

--Income based analysis
select Loan_Status,
ROUND(avg(ApplicantIncome),2) as Avg_applicantincome,
ROUND(avg(CoApplicantIncome),2) as Avg_CoapplicantIncome,
ROUND(avg(LoanAmount),2) as Avg_Loanamount
from sql_cleaned_Loan_Applications
group by Loan_Status

--Top 10 Highest income
Select Top 10 Loan_ID,ApplicantIncome,LoanAmount,Loan_Status
from sql_cleaned_Loan_Applications
order by ApplicantIncome desc


--Approvals By Property_Area
select Property_Area,
COUNT(*) as Total_Applicants,
SUM(case when Loan_Status = 1 then 1 else 0 end) as Approved,
ROUND((Sum(Case when Loan_Status=1 then 1 else 0 end)*100.0)/COUNT(*),2) as approval_Percentage
from sql_cleaned_Loan_Applications
Group by Property_Area
Order by approval_Percentage desc

--Approvals By Education Level
Select Education,
Count(*) as Total_Applicants,
SUM(case when Loan_Status = 1 then 1 else 0 end) as Approved,
ROUND((Sum(Case when Loan_Status=1 then 1 else 0 end)*100.0)/COUNT(*),2) as Approval_Rate
from sql_cleaned_Loan_Applications
group by Education
order by Approval_Rate desc

--Credit History Vs Loan Approval
select Credit_History,
COUNT(*) as Total_Applicants,
SUM(case when Loan_Status = 1 then 1 else 0 end) as Approved,
ROUND(Sum(Case when Loan_Status = 1 then 1 else 0 end)*100.0/COUNT(*),2) as Approval_Rate
From sql_cleaned_Loan_Applications
group by Credit_History
order by Credit_History desc

--High-Risk Applicants(Rejected +Low Credit)
select Loan_ID,Gender,Married,ApplicantIncome,LoanAmount,Credit_History,Loan_Status
from sql_cleaned_Loan_Applications
where Loan_Status=0 and Credit_History = 0
order by ApplicantIncome desc

--Self-Employed vs salaried Approval Rate
Select Self_Employed,
COUNT(*) As Total_Applicants,
SUM(case when Loan_Status = 1 then 1 else 0 end) as Approved,
ROUND(Sum(Case when Loan_Status =1 then 1 else 0 end)*100.0/COUNT(*),2) as Approval_Rate
from sql_cleaned_Loan_Applications
group by Self_Employed

--Loan Term Vs Average Loan Amount
select Loan_Amount_Term,
ROUND(AVG(LoanAmount),2) as Avg_Loanamount,
SUM(case when Loan_Status =1 then 1 else 0 end) as Approved_Count
from sql_cleaned_Loan_Applications
group by Loan_Amount_Term
order by Loan_Amount_Term

--Income Level Vs Loan Approval
select 
    case 
        when ApplicantIncome <2500 then 'Low Income(<2500)'
        when ApplicantIncome between 2500 and 5000 then 'Medium Income(2500-5000)'
        when ApplicantIncome between 5001 and 10000 then 'High Income(5001-10000)'
        else 'Very High Income(>10000)'
      end as Income_Group,
      COUNT(*) as Total_Applicants,
      SUM(case when Loan_Status =1 then 1 else 0 end) as Approved,
      ROUND((Cast(SUM(Case when Loan_Status =1 then 1 else 0 end) as Float)/COUNT(*))*100,2) as Approval_Percentage
From sql_cleaned_Loan_Applications
Group by
      case
        when ApplicantIncome <2500 then 'Low Income(<2500)'
        when ApplicantIncome between 2500 and 5000 then 'Medium Income(2500-5000)'
        when ApplicantIncome between 5001 and 10000 then 'High Income(5001-10000)'
        else 'Very High Income(>10000)'
      end
order by Approval_Percentage desc



--Create view for summary dashboard 
Create view Loan_summary_Report as
Select 
    Property_Area,Education,Credit_History,Self_Employed,
    ROUND(avg(ApplicantIncome),2) as avg_Income,
    ROUND(avg(LoanAmount),2) as Avg_LoanAmount,
    ROUND((sum(case when Loan_Status = 1 then 1 else 0 end)*100.0)/COUNT(*),2) as Approval_Rate
from sql_cleaned_Loan_Applications
group by Property_Area,Education,Credit_History,Self_Employed


select * from sql_cleaned_Loan_Applications