pragma solidity ^0.4.11;

import '../SITExchanger.sol';

// @dev SITExchangerMock mocks current block number

contract SITExchangerMock is SITExchanger {event __CoverageSITExchangerMock(string fileName, uint256 lineNumber);
event __FunctionCoverageSITExchangerMock(string fileName, uint256 fnId);
event __StatementCoverageSITExchangerMock(string fileName, uint256 statementId);
event __BranchCoverageSITExchangerMock(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSITExchangerMock(string fileName, uint256 branchId);
event __AssertPostCoverageSITExchangerMock(string fileName, uint256 branchId);


    function SITExchangerMock(address _sit, address _msp, address _contribution)
        SITExchanger(_sit,  _msp, _contribution) {__FunctionCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',1);
}

    function getBlockNumber() internal returns (uint) {__FunctionCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',2);

__CoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',13);
         __StatementCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',1);
return mock_blockNumber;
    }

    function setMockedBlockNumber(uint _b) public {__FunctionCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',3);

__CoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',17);
         __StatementCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',2);
mock_blockNumber = _b;
    }

    function collect() public {__FunctionCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',4);

        // SIT sholder could collect MSP right after contribution started
__CoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',22);
        __AssertPreCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',1);
 __StatementCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',3);
require(getBlockNumber() > contribution.startBlock());__AssertPostCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',1);


        // Get current MSP ballance
__CoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',25);
         __StatementCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',4);
uint256 balance = sit.balanceOfAt(msg.sender, contribution.initializedBlock());

        // And then subtract the amount already collected
__CoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',28);
         __StatementCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',5);
uint256 amount = balance.sub(collected[msg.sender]);

        __AssertPreCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',2);
 __StatementCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',6);
require(amount > 0);__AssertPostCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',2);
  // Notify the user that there are no tokens to exchange

__CoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',32);
         __StatementCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',7);
totalCollected = totalCollected.add(amount);
__CoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',33);
         __StatementCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',8);
collected[msg.sender] = collected[msg.sender].add(amount);

//        assert(msp.transfer(msg.sender, amount));

__CoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',37);
         __StatementCoverageSITExchangerMock('/Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol',9);
TokensCollected(msg.sender, amount);
    }

    uint public mock_blockNumber = 1;
}
