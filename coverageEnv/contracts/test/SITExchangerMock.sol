pragma solidity ^0.4.11;

import '../SITExchanger.sol';

// @dev SITExchangerMock mocks current block number

contract SITExchangerMock is SITExchanger {

    function SITExchangerMock(address _sit, address _msp, address _contribution)
        SITExchanger(_sit,  _msp, _contribution) {}

    function getBlockNumber() internal constant returns (uint) {
        return mock_blockNumber;
    }

    function setMockedBlockNumber(uint _b) public {
        mock_blockNumber = _b;
    }

    function collect() public {
        // SIT sholder could collect MSP right after contribution started
        require(getBlockNumber() > contribution.startBlock());

        // Get current MSP ballance
        uint256 balance = sit.balanceOfAt(msg.sender, contribution.initializedBlock());

        // And then subtract the amount already collected
        uint256 amount = balance.sub(collected[msg.sender]);

        require(amount > 0);  // Notify the user that there are no tokens to exchange

        totalCollected = totalCollected.add(amount);
        collected[msg.sender] = collected[msg.sender].add(amount);

//        assert(msp.transfer(msg.sender, amount));

        TokensCollected(msg.sender, amount);
    }

    uint public mock_blockNumber = 1;
}
