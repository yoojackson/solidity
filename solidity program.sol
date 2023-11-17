// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

struct owner//a simple struct to hold address of 3 owner
{
    address own1;
    address own2;
    address own3;
}
contract transaction// A contract named transaction
{
    owner own;
    uint amount;
    address initaddress;//variable use to store sender address
    uint public money=100;//randomly initialized money 
    uint d;
    bool db;
    address revicer;
    uint transid;//Number of transaction counter
    constructor(address o1,address o2,address o3)//constructor to initialize the 3 owner address
    {
        own.own1=o1;
        own.own2=o2;
        own.own3=o3;
    }
    function initiate(address sender,uint ammo) public returns (uint)//A function to initiate transaction . 
    {
        
        if (sender == own.own1)//conditional statement to check weather the sender is one of the owner
        {
            initaddress=sender;
            amount=ammo;  
        }
        else if (sender == own.own2)
        {
            amount=ammo;
            initaddress=sender;
        }
        else if (sender == own.own3)
        {
            amount=ammo;
            initaddress=sender;
        }
        else 
        {
            
        }
        return amount;
    }
    function approval(address approval1,address approval2) public //function to approve from one of the other 2 owner.
    {
        if (initaddress == own.own1)
        {
            if (approval1 == own.own2 || approval1 == own.own3)
            {
                d=0;
                if (approval2 == own.own2 || approval2 == own.own3)
                {
                    d=0;
                }
            }
        }
        else if (initaddress == own.own2)
        {
            if (approval1 == own.own1 || approval1 == own.own3)
            {
                d=0;
                if (approval2 == own.own1 || approval2 == own.own3)
                {
                    d=0;
                }
            }
        }
        else if (initaddress == own.own3)
        {
            if (approval1 == own.own2 || approval1 == own.own1)
            {
                d=0;
                if (approval2 == own.own2 || approval2 == own.own1)
                {
                    d=0;
                }
            }
        }
        else 
        {
            d=1;
        }
    }
    function finaltransaction(address payable recive) public  external   payable 
    {
        db=money >= amount;
        if (d == 0)
        {
            if (db == true)
            {
                bool sent=recive.call{value:amount}("");
                require(sent,"Transaction fail");
                if (sent == true)
                {
                    money=money-amount;
                    transid=transid+1;
                }
                transid=transid+1;
            }
        }
        
    }
}