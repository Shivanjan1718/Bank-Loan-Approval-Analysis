Bank Loan Approval & Risk Analysis Dashboard By: G.V. Shivanjan

📘 Project Overview: This project analyzes a bank's loan approval process to identify key factors influencing loan approval and rejection rates. It leverages SQL for data cleaning and transformation, Python for exploratory data analysis (EDA), and Power BI to build an interactive dashboard. The final dashboard provides actionable insights for stakeholders to assess risk, understand applicant demographics, and optimize the approval process.

🎯 Project Objective:

To clean and transform raw loan application data into a usable format for analysis.

To identify the key parameters and applicant characteristics that significantly impact loan approval status.

To analyze trends in loan approvals based on factors like credit history, income, education, and property area.

To build an interactive Power BI dashboard that helps decision-makers improve approval efficiency and perform data-driven risk assessment.

🛠️ Tools & Technologies:

Database: Microsoft SQL Server (for data cleaning, transformation, and initial analysis)

Analysis: Python (Pandas, Matplotlib, Seaborn) (for exploratory data analysis and correlation)

Visualization: Power BI (for building the interactive dashboard)

Data Source: Excel / CSV (raw_loan_Applications.csv)

📜 Project Workflow This project was executed in three main phases:

Phase 1: Data Cleaning & Transformation (SQL):

The initial dataset (found in /Data/raw_loan_Applications.csv) contained missing values and inconsistent data types.

All cleaning and transformation were performed in MS SQL Server.

Database & Table Creation: Created a new database Bank_Loan and imported the raw CSV data into a table named Loan_Applications.

Handling Missing Values: Used SQL queries to identify columns with NULLs. Created a new view, Cleaned_Loan_Applications, that filters out records with critical missing data (specifically LoanAmount and Credit_History).

Data Type Conversion: Mapped categorical 'Y'/'N' values in Loan_Status to 1/0 (Approved/Rejected) using CASE statements to make the data ready for quantitative analysis.

Initial Analysis (SQL): Performed preliminary analysis directly in SQL to check distributions and approval rates against different categories, such as Income_Group.

Export: The cleaned and transformed data was exported from the Cleaned_Loan_Applications view into Data/02_sql_cleaned_Loan_Applications.csv for use in Python and Power BI.

See sql_cleaning_queries.sql for the complete script.

Phase 2: Exploratory Data Analysis (Python):

The cleaned data was further analyzed in a Jupyter Notebook (data_analysis.ipynb) to uncover deeper statistical relationships.

Correlation Analysis: A correlation heatmap was generated using Seaborn and Matplotlib to visualize the relationships between numeric variables (e.g., ApplicantIncome, LoanAmount, and Loan_Status).

Feature Exploration: Conducted further analysis on the distributions of key features to understand the dataset's characteristics before visualization.

Phase 3: Dashboard Development (Power BI):

The final cleaned dataset (from the Data folder) was imported into Power BI to create a comprehensive, interactive dashboard.

Data Modeling: Established relationships between data tables (if any) and formatted data types.

DAX Measures: Created key measures to power the dashboard, such as:

Total Applications

Approved Applications & Rejected Applications

Approval Rate %

Average Loan Amount

Visualization: Designed a multi-page dashboard (bank.pbix) with interactive slicers and visuals to answer key business questions.

📊 Power BI Dashboard Showcase The dashboard provides a consolidated view of all key metrics, with slicers for Property Area, Education, Self-Employed Status, and Loan Status.

(This is the screenshot you provided. In GitHub, this image will render directly.)

Key Dashboard Components:

KPI Cards: At-a-glance metrics for Total Applications (543), Approval Rate (69%), Avg. Loan Amount (₹145.09K), and Rejected Applications (169).

Approval Rate by Credit History: A donut chart clearly showing that applicants with a credit history (Value 1) have a vastly superior approval rate.

Approval Rate by Property Area: A bar chart comparing approval rates across Urban, Semi-urban, and Rural areas.

Applicant Income vs. Loan Amount: A scatter plot to identify patterns and potential outliers in lending.

Detailed Views: Other charts visualize approvals by gender, marital status, education, and employment.

💡 Key Insights & Results:

Overall Approval Rate: The bank has an overall loan approval rate of 69%.

Credit History is Critical: The single most important factor is Credit History. Applicants with a credit history are approved at a significantly higher rate than those without.

Education & Location Matter: Graduates and applicants from Semi-urban and Urban areas have a higher likelihood of loan approval.

Income is Not Everything: The correlation between ApplicantIncome and Loan_Status was not as strong as expected, suggesting that stability (Credit History, Employment) is valued more highly than raw income.

🚀 Conclusion & Future Scope This project successfully demonstrates an end-to-end data analysis workflow, turning a raw dataset into an actionable intelligence tool. The Power BI dashboard effectively highlights the primary drivers of loan approval, enabling the bank to make faster, more informed, and data-driven decisions.

Future enhancements could include:

Predictive Modeling: Integrate a machine learning model (e.g., Logistic Regression) to predict the likelihood of loan approval for new applicants.

Real-time Data: Connect the Power BI dashboard to a live database to monitor approval trends in real-time.

Power BI App: Publish the dashboard as a Power BI App for wider distribution to loan officers and branch managers.

📂 Repository Structure

📁 Bank Loan Approval & Risk Analysis Project
├── 📁 Data
│   ├── raw_loan_Applications.csv         # Raw, original dataset
│   ├── 02_sql_cleaned_Loan_Applications.csv  # Cleaned data for Python/Power BI
│   └── final_Loan_Applications.csv       # (Add description or remove if unused)
│
├── data_analysis.ipynb           # Jupyter Notebook for Python EDA
├── sql_cleaning_queries.sql      # SQL script for all cleaning
├── bank.pbix                     # Power BI project file
├── Dashboard_ScreenShot.png      # Static image of the final dashboard
└── README.md                     # This documentation file
👨‍💻 Author

Name: G.V. Shivanjan

Role: Data Analyst (Fresher)

LinkedIn:  www.linkedin.com/in/gv-shivanjan 