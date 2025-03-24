import mysql.connector
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, classification_report

# Step 1: Connect to MySQL Database
db_connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="customerers_db"
)

# Step 2: Load Data from MySQL
query = "SELECT age, gender, tenure, monthly_spending, total_spent, num_support_tickets, subscription_type, payment_method, is_churned FROM customs"
df = pd.read_sql(query, db_connection)

# Step 3: Check if data is loaded
if df.empty:
    print("❌ Error: No data found in the dataset. Check your database connection and query.")
    exit()

# Step 4: Encode Categorical Features
label_encoders = {}

for col in ['gender', 'subscription_type', 'payment_method']:
    le = LabelEncoder()
    df[col] = le.fit_transform(df[col])  # Convert categorical to numerical
    label_encoders[col] = le  # Save the encoder for future reference

# Step 5: Split Features and Target Variable
X = df.drop(columns=['is_churned'])  # Features
y = df['is_churned']  # Target (1 = Churned, 0 = Retained)

# Step 6: Split Data into Training and Testing Sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Step 7: Normalize Features
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# Step 8: Train the SVM Model
svm_model = SVC(kernel='rbf', C=1.0)  # Default C value without tuning
svm_model.fit(X_train, y_train)

# Step 9: Make Predictions
y_pred = svm_model.predict(X_test)

# Step 10: Evaluate Model Performance
accuracy = accuracy_score(y_test, y_pred)
print("✅ SVM Model Accuracy:", accuracy)
print("\n📊 Classification Report:\n", classification_report(y_test, y_pred))

# Step 11: Close MySQL Connection
db_connection.close()
