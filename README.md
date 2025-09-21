# ⚡ QueryCraft  

> 🎯 A curated collection of **SQL problem statements** and their **elegant solutions**, designed to sharpen your query-building skills and master the art of **data manipulation**.  

---

## 🚀 Why QueryCraft?  
- 📚 Learn SQL concepts through **real-world problems**  
- ✨ Improve your **query optimization** and **analytical thinking**  
- 🛠️ Practice structured problem-solving with **step-by-step solutions**  
- 🌍 Great resource for **interview prep** & **daily SQL drills**  

---

## 🗂️ Contents  
- 🔹 Basic SQL Queries  
- 🔹 Joins & Subqueries  
- 🔹 Window Functions  
- 🔹 Advanced Analytics Problems  
- 🔹 Optimization Techniques  

---

## 📸 Preview  

```sql
-- Example: Find customers who purchased all products in the catalog
SELECT customer_id
FROM purchases p
JOIN products pr ON p.product_id = pr.product_id
GROUP BY customer_id
HAVING COUNT(DISTINCT pr.product_id) = (SELECT COUNT(*) FROM products);
