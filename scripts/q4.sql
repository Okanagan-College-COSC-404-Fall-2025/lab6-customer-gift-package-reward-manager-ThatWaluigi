BEGIN
    CUSTOMER_MANAGER.ASSIGN_GIFTS_TO_ALL();
END;
/

SELECT * 
FROM Customer_Rewards cr, gift_catalog gc
WHERE cr.gift_id = gc.gift_id
Fetch FIRST 5 Rows Only;

/

SELECT Count(*)
From CUSTOMER_REWARDS;

/
COMMIT;