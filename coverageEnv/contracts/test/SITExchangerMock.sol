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
        SITExchanger(_sit,  _msp, _contribution) {__FunctionCoverageSITExchangerMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/SITExchangerMock.sol',1);
}

    function getBlockNumber() internal returns (uint) {__FunctionCoverageSITExchangerMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/SITExchangerMock.sol',2);

__CoverageSITExchangerMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/SITExchangerMock.sol',13);
         __StatementCoverageSITExchangerMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/SITExchangerMock.sol',1);
return mock_blockNumber;
    }

    function setMockedBlockNumber(uint _b) public {__FunctionCoverageSITExchangerMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/SITExchangerMock.sol',3);

__CoverageSITExchangerMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/SITExchangerMock.sol',17);
         __StatementCoverageSITExchangerMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/SITExchangerMock.sol',2);
mock_blockNumber = _b;
    }

    uint public mock_blockNumber = 1;
}
