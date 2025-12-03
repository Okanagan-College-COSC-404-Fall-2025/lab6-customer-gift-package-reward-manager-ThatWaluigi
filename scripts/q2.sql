Drop Table Customer_Rewards;

Create Table Customer_Rewards (Reward_Id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    Customer_Email VARCHAR2(50), gift_id NUMBER REFERENCES gift_catalog(Gift_Id), Reward_date DATE);

COMMIT;