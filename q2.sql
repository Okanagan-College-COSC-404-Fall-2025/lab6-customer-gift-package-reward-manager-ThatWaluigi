Drop Table Customer_Rewards;

Create Table Customer_Rewards (Reward_Id NUMBER PRIMARY KEY, 
    Customer_Email VARCHAR2(50), Gift_Id NUMBER REFERENCES gift_catalog(Gift_Id), Reward_date DATE);