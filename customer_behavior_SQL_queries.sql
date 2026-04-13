select gender, SUM(purchase_amount) as revenue
from customer
group by gender

select customer_id
from customer
where discount_applied = 'Yes' and purchase_amount >= (select AVG(purchase_amount) from customer)


select item_purchased , avg(review_rating) as "Average Product Rating"
from customer
group by item_purchased
order by avg(review_rating) desc
limit 5;


select shipping_type , round(AVG(purchase_amount),2)
from customer
where shipping_type in ('Standard','Express')
group by shipping_type

select subscription_status,
count (customer_id) as total_customer,
round(avg(purchase_amount),2) as avg_spend,
round(SUM(purchase_amount),2) as total_spend
from customer
group by (subscription_status) 
order by  total_spend, avg_spend desc;


SELECT 
    item_purchased,
    ROUND(
        SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
    2) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5;


with customer_type as(
select customer_id, previous_purchases,
case
        when previous_purchases = 1 then 'NEW'
        when previous_purchases between 2 and 10 then 'Returning'
        else 'loyal'
        end as customer_segment
from customer
)
select customer_segment , count(*) as "Number of customer"
from customer_type
group by customer_segment


select subscription_status, count(customer_id) as repeat_buyers
from customer
where previous_purchases>5
group by subscription_status

select age_group,
sum(purchase_amount) as total_revenue
from customer
group by Age_group
order by total_revenue desc;