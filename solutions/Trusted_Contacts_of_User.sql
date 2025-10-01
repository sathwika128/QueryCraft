select i.invoice_id,c.customer_name,i.price,count(distinct ct.contact_email) contacts_cnt,
count(distinct case when cu.email is not null then ct.contact_email end) trusted_contacts_cnt
from invoices i 
join customers c on i.user_id=c.customer_id
left join contacts ct on ct.user_id=i.user_id
left join customers cu on cu.email=ct.contact_email
group by 1,2,3



-----------------------
SELECT 
    i.invoice_id,
    c.customer_name,
    i.price,
    COUNT(DISTINCT ct.contact_email) AS contacts_cnt,
    COUNT(DISTINCT CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM Customers cx 
            WHERE cx.email = ct.contact_email
        ) THEN ct.contact_email 
    END) AS trusted_contacts_cnt
FROM Invoices i
JOIN Customers c 
    ON i.user_id = c.customer_id
LEFT JOIN Contacts ct 
    ON i.user_id = ct.user_id
GROUP BY i.invoice_id, c.customer_name, i.price
ORDER BY i.invoice_id;
