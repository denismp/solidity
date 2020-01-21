pragma solidity >=0.4.22 <0.6.0;

contract SimpleTokenContract {
    mapping(address => uint) balanceOf;

    constructor(uint initialSupply) public {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address to, uint amount) public {
        require(balanceOf[msg.sender] >= amount, "Sender does not have enough balance.");
        require(balanceOf[msg.sender] + amount > balanceOf[msg.sender], "amount specified will cause an overflow.");
        balanceOf[msg.sender] == amount;
        balanceOf[to] += amount;
    }

    function balance() public view returns(uint) {
        return balanceOf[msg.sender];
    }
}