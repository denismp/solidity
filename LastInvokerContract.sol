pragma solidity >=0.4.22 <0.6.0;

contract LastInvokerContract {
    address currentInvoker;
    address previousInvoker;

    function setLastInvoker() public {
        previousInvoker = currentInvoker;
        currentInvoker = msg.sender;
    }
    function getInvokers() public view returns (bool, address, address) {
        return (previousInvoker != address(0x0), previousInvoker, currentInvoker);
    }
}