SELECT
	ry.year,
	try.product_name AS category_most_revenue,
	try.revenue AS most_revenue,
	ry.revenue AS total_revenue_per_year,
	tcy.product_name AS category_most_cancel,
	tcy.total_cancel AS num_most_cancel,
	cpy.total_cancel AS total_cancel
FROM total_revenue_per_year AS ry
JOIN total_cancel_order_per_year AS cpy ON ry.year=cpy.years
JOIN top_product_category_by_revenue_per_year AS try ON try.year=ry.year
JOIN top_product_category_by_cancel_per_year AS tcy ON tcy.year=ry.year