CREATE or REPLACE PACKAGE Customer_Manager As
    Function GET_TOTAL_PURCHASE(customer_id Integer) RETURN NUMBER;
    PROCEDURE ASSIGN_GIFTS_TO_ALL;

END Customer_Manager;

/

CREATE or REPLACE PACKAGE BODY Customer_Manager is
    Function GET_TOTAL_PURCHASE(customer_id Integer) RETURN NUMBER is
        v_total NUMBER;
    Begin
        SELECT NVL(SUM(oi.unit_price * oi.quantity), 0) into v_total
        FROM ORDER_ITEMS oi, ORDERS o
        WHERE o.order_id =  oi.order_id AND o.customer_id = customer_id;

        RETURN v_total;
    END GET_TOTAL_PURCHASE;

    Function CHOOSE_GIFT_PACKAGE(p_total_purchase Number) RETURN NUMBER is
    Begin
        Return CASE 
            WHEN p_total_purchase >= 5000 THEN 3
            WHEN p_total_purchase >= 1000  THEN 2
            WHEN p_total_purchase >= 100  THEN 1      
            Else Null
        END;
    End CHOOSE_GIFT_PACKAGE;

    PROCEDURE ASSIGN_GIFTS_TO_ALL is
        v_total Number;
        v_gift Number;
    Begin
        For x in (SELECT * FROM Customers)
        Loop
            v_total := Get_Total_Purchase(x.customer_id);
            v_gift := Choose_Gift_Package(v_total);

            INSERT into Customer_Rewards (Customer_Email, gift_id, Reward_date) Values (x.email_address, v_gift, SYSDATE);
        ENd Loop;

        Commit;
    END ASSIGN_GIFTS_TO_ALL;
END Customer_Manager;
/

COMMIT;
