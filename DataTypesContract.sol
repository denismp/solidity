pragma solidity >=0.4.22 <0.6.0;

contract DataTypesContract {
    address payable owner;
    bytes values;
    enum Answer {Yes, No, Maybe}
    Answer dicsion = Answer.Yes; // 0
    uint public numberFromHex = 0xA3F; // is 2623
    uint public arbitraryPrecision = ( 2 / 5 + 1 ) * 10; // (0.4 + 1) * 10 = 1.4*10 = 14
    string public textAsHex = "\x4b\x69\x6e\x67\x73\x6c\x61\x6e\x64"; // Kingsland
    string public textAsUnicode = "\u004b\u0069\u006e\u0067\u0073\u006c\u0061\u006e\u0064"; // Kingsland

    constructor() public {
        owner = msg.sender;
    }

    // This function uses the "memory" keyword.  This is non-storage memory
    // and it does not persist between invocations.
    function foo() public pure returns(string memory) {
        // strings are immutable.
        string memory str = "Hello World!";

        // bytes are mutable and therefore can be changed.
        // If we were to return the bs variable, it would not
        // be decoded and would be displayed as hex.
        bytes memory bs = "Hello World!";
        bs[0] = 'B';
        return str;
    }

    // This function pushes a hex byte onto the values storage variable.
    // The push() only works on storage variables.
    function pushByte(byte val) public {
        values.push(val);
    }

    function getValues() public view returns(bytes memory) {
        return values;
    }

    function getAddress() public view returns(address) {
        return msg.sender;
    }

    function getBalance() public view returns(uint) {
        return msg.sender.balance;
    }

    function giveMoneyToOwner() public payable {
        owner.transfer(msg.value);
    }
}