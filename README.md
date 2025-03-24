Project Title: Customer Churn Prediction using SVM

Objective: Predict customer churn using machine learning (Support Vector Machine - SVM) based on customer data.

Technologies Used:
🐍 Python (scikit-learn, pandas, numpy)
💾 MySQL (for data storage)
📊 Machine Learning (SVM Model)

2. Dataset Description

Data Fields:

1.age
2.gender
3.tenure
4.monthly_spending
5.total_spent
6.num_support_tickets
7.subscription_type
8.payment_method
9.is_churned (Target Variable: 1 = Churned, 0 = Retained)

3. Data Preprocessing Steps
Handling Missing Data: Used .fillna() to replace missing values.
Feature Encoding: Converted categorical variables using LabelEncoder.
Data Scaling: Normalized numerical data using StandardScaler.
Train-Test Split: Split dataset into 80% training and 20% testing.

4. Model Evaluation
Accuracy Score:90%
Confusion Matrix: 0.85 Or 85% Means that the data available is churned
Performance Metrics:
Precision, Recall, F1-Score
Macro vs Weighted Averages



