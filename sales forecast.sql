SELECT
    Salesperson_ID,
    Region,
    Product,
    SUM(Historical_Sales) AS Total_Historical_Sales,
    SUM(Forecast_Amount) AS Forecasted_Sales,
    ROUND(SUM(Forecast_Amount) / SUM(Historical_Sales) * 100, 2) AS Forecast_Growth_Percentage
FROM
    [dbo].[sales_forecast_data]
WHERE
    Forecast_Date >= DATEADD(QUARTER, -1, GETDATE()) -- Last quarter
    AND Forecast_Date < DATEADD(QUARTER, 1, GETDATE()) -- Next quarter
GROUP BY
    Salesperson_ID, Region, Product
ORDER BY
    Forecast_Growth_Percentage DESC;

	SELECT
    Salesperson_ID,
    Region,
    Product,
    SUM(Forecast_Amount) AS Risk_Amount,
    COUNT(*) AS Risk_Count
FROM
    [dbo].[sales_forecast_data]
	WHERE
    Forecast_Category = 'Committed at Risk'
GROUP BY
    Salesperson_ID, Region, Product
ORDER BY
    Risk_Amount DESC;

SELECT
    Salesperson_ID,
    Region,
    Product,
    SUM(Historical_Sales) AS Actual_Sales,
    SUM(Forecast_Amount) AS Forecasted_Sales,
    ROUND((SUM(Forecast_Amount) - SUM(Historical_Sales)) / SUM(Historical_Sales) * 100, 2) AS Forecast_Accuracy_Percentage
FROM
   [dbo].[sales_forecast_data] 
GROUP BY
    Salesperson_ID, Region, Product
ORDER BY
    Forecast_Accuracy_Percentage DESC;
SELECT
    Region,
    Product,
    SUM(Forecast_Amount) AS Forecasted_Sales,
    SUM(Historical_Sales) AS Historical_Sales,
    ROUND(SUM(Forecast_Amount) / SUM(Historical_Sales) * 100, 2) AS Growth_Opportunity_Percentage
FROM
    [dbo].[sales_forecast_data]
GROUP BY
    Region, Product
ORDER BY
    Growth_Opportunity_Percentage DESC;
