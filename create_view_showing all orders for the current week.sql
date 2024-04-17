CREATE VIEW current_week_report AS
Select orders.id,orders.products,concat(u.first_name,' ',u.last_name) AS client,p.type as payment, os.title as status from orders
join order_statuses os on os.id = orders.order_status_id
join payments p on p.id = orders.payment_id
join users u on u.id = orders.user_id
where week(curdate())=week(orders.created_at);