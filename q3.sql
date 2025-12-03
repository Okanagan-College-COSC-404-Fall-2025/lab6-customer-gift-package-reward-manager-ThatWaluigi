CREATE or REPLACE PACKAGE Customer_Manager As
    Function GET_TOTAL_PURCHASE(customer_id Integer) RETURN NUMBER;

END Customer_Manager;

CREATE or REPLACE PACKAGE BODY Customer_Manager is
    Function GET_TOTAL_PURCHASE(customer_id Integer) RETURN NUMBER is
        v_total NUMBER;
    Begin
        SELECT SUM(oi.unit_price * oi.quantity) into v_total
        FROM ORDER_ITEMS oi, ORDERS o
        WHERE o.order_id =  oi.order_id AND o.customer_id = customer_id;

    END GET_TOTAL_PURCHASE

    Function CHOOSE_GIFT_PACKAGE(p_total_purchase Number) RETURN NUMBER is
    Begin
        SELECT 
        CASE
            WHEN
        Else Return Null;
    End CHOOSE_GIFT_PACKAGE
END Customer_Manager;
