pragma solidity >=0.4.22 <0.6.0;

contract IncrementorContract {
    uint private value = 0;

    // This function is publically viewable via the api.
    function increment(uint step) public {
        //value += step;
        // If you want to call and the externalIncrement() here,
        // you have to call it lilke this:
        // this.externalIncrement(step);
        // Note the "this" operator.
        privateIncrement(step);
    }

    // This function is publically viewable via the api.
    function get() public view returns(uint) {
        return value;
    }

    // This function is not visible via the api interface, though everything
    // in the blockchain can eventually be seen.
    // This function cannnot be called by a derived contract.
    function privateIncrement(uint step) private {
        value += step;
    }

    // This function is similar to a private function, but it can be called
    // from a derived contract.
    function internalIncrement(uint step) internal {
        privateIncrement(step);
    }

    // This function is public in nature, but you can't modify
    // the parameters.
    function externalIncrement(uint step) external {
        internalIncrement(step);
    }
}

// This is how you inherit from and existing contract object.
contract Derived is IncrementorContract {
    function derivedIncrement(uint step) public {
        internalIncrement(step);
    }
}