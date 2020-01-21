pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2; // This is experimental.  don't use in main net.
// https://blog.ethereum.org/2019/03/26/solidity-optimizer-and-abiencoderv2-bug/

contract StructContract {
    struct Person {
        string firstName;
        string lastName;
    }
    Person person;

    function set(string memory first, string memory last) public {
        person.firstName = first;
        person.lastName = last;
    }

    function get() public view returns(string memory, string memory) {
        return(person.firstName, person.lastName);
    }

    // This function requires the ABIEncoderV2 to return a struct.
    function getStruct() public view returns(Person memory) {
        return person;
    }
}