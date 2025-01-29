**Pizza Sales Report**  

**Description:**  
Analyzed pizza sales data to identify high-demand items, customer ordering patterns, and peak sales periods.

**Purpose:**  
To enhance operational efficiency and customer satisfaction in a pizza store by analyzing sales performance, customer preferences, and peak order times.

**Key Contributions:**  
Cleaned and organized sales data to ensure consistency and improve data reliability.  
Conducted exploratory data analysis (EDA) to uncover trends in customer preferences by pizza type, size, and order timing.  
Created visualizations to showcase sales performance across different times of the day, enabling improved staffing and inventory planning.  
Provided actionable insights for menu optimization, pricing strategies, and targeted promotions.

**Data Cleaning and Preparing:**
1. Creating new column _new_oeder_id_ using the equation (=1/COUNTIF([order_id],[@[order_id]])), as one order may contain multiple items, so the _oreder_id_ could be repeated.
2. Extracting day and hour from _order_date_ using equations (=TEXT([@[order_date]],"dddd")) and (=TEXT([@[order_time]],"h AM/PM")).

**Dashboard:**
1. Total Revenue: $817860
2. Total Orders: 21350
3. Total Pizzas Sold: 49574
4. Average Order Value: $38.31
5. Average Pizza per Order: 2.32
6. Total Pizza Sold by Category
7. Total Pizza Sold by Size
8. Percentage of Sales by Category
9. Percentage of Sales by Size
10. Top 5 Pizza Sold
11. Bottom 5 Pizza Sold
12. Total Order per Day
13. Total Orders per Hour

**Insights:**
- Rush hours and days: (Thursday & Friday) - (12 PM to 1 PM & 5 PM to 6 PM)
- Best Sales: Classic category - Large size - The Classic Deluxe Pizza 
- Notice that the Chicken category is sold less than the Veggie by about 600 pieces but makes more profit by about 0.30%.

**Tools Used:** SQL, Excel.
