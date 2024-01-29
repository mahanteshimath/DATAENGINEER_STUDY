--If you need to define multiple CTEs, you
--simply separate them by commas. Each can refer to the previously defined CTEs, and the
--outer query can refer to all of them. After the outer query terminates, all CTEs defined in that
--WITH statement are gone. The fact that you don’t nest CTEs makes it easier to follow the logic
--and therefore reduces the chances for errors. For example, if you want to refer to one CTE
--from another, you can use the following general form.

select *  from Sales.SalesOrderDetail
order by productid



WITH CTE1 AS (
  select
    ProductID, SUM(OrderQty) as TotalOrderQty
  from Sales.SalesOrderDetail
  group by ProductID
),
CTE2 AS (
  select
    p.ProductID, pc.ProductCategoryID, pc.Name,
	ROW_NUMBER() OVER (PARTITION BY pc.ProductCategoryID ORDER BY CTE1.TotalOrderQty DESC) AS Rn
  from Production.Product p
  inner join Production.ProductSubcategory psc
    on psc.ProductSubcategoryID = p.ProductSubcategoryID
  inner join Production.ProductCategory pc
    on pc.ProductCategoryID = psc.ProductCategoryID
  inner join CTE1 ON CTE1.ProductID = P.productID
)
  SELECT
    CTE2.ProductCategoryID,
    CTE2.Name,
    CTE1.ProductID,
    CTE1.TotalOrderQty,
    rn
  FROM CTE1
  INNER JOIN CTE2 on CTE1.ProductID = CTE2.ProductID
WHERE rn <= 3
order by cte2.productcategoryID

