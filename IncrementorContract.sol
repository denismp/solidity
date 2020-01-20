pragma solidity >=0.4.22 <0.6.0;

contract IncrementorContract {
    uint private value = 0;

    function increment(uint step) public {
        value += step;
    }

    function get() public view returns(uint) {
        return value;
    }
}