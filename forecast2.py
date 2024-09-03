import pandas as pd
import numpy as np
import random
from datetime import datetime, timedelta
import os

# List of Microsoft products
products = [
    "Microsoft 365", "Azure", "Dynamics 365", "Windows 10", "Windows 11",
    "Visual Studio", "SQL Server", "Power BI", "OneDrive", "Teams",
    "SharePoint", "Exchange", "Surface Pro", "Surface Laptop", "Xbox",
    "Outlook", "Edge", "Minecraft", "LinkedIn", "GitHub"
]

# Forecast categories
forecast_categories = ["Committed", "Upside", "Uncommitted", "Committed at Risk"]

# Generate dataset
data = {
    "Salesperson_ID": np.random.randint(1000, 1050, 100),
    "Forecast_Category": np.random.choice(forecast_categories, 100),
    "Region": np.random.choice(["North America", "Europe", "Asia-Pacific", "Latin America"], 100),
    "Product": np.random.choice(products, 100),
    "Historical_Sales": np.round(np.random.uniform(5000, 50000, 100), 2),
    "Forecast_Amount": np.round(np.random.uniform(10000, 60000, 100), 2),
    "Forecast_Date": [
        (datetime.now() + timedelta(days=int(i))).strftime('%Y-%m-%d')
        for i in np.random.randint(1, 365, 100)
    ],
}

# Create DataFrame
df = pd.DataFrame(data)

# Define the file path to save the CSV file on the desktop
desktop_path = os.path.join(os.path.expanduser("~"), "Desktop", "sales_forecast_data.csv")

# Save to CSV on the desktop
df.to_csv(desktop_path, index=False)

print(f"Dataset generated and saved as '{desktop_path}'")
