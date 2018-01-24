pragma solidity ^0.4.11;

import '../SIT.sol';

// @dev SITMock mocks current block number

contract SITMock is SIT {event __CoverageSITMock(string fileName, uint256 lineNumber);
event __FunctionCoverageSITMock(string fileName, uint256 fnId);
event __StatementCoverageSITMock(string fileName, uint256 statementId);
event __BranchCoverageSITMock(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSITMock(string fileName, uint256 branchId);
event __AssertPostCoverageSITMock(string fileName, uint256 branchId);


  function SITMock(address _tokenFactory) SIT(_tokenFactory) {__FunctionCoverageSITMock('/Users/tikonoff/projects/mothership/contracts/test/SITMock.sol',1);
}

  function getBlockNumber() internal returns (uint) {__FunctionCoverageSITMock('/Users/tikonoff/projects/mothership/contracts/test/SITMock.sol',2);

__CoverageSITMock('/Users/tikonoff/projects/mothership/contracts/test/SITMock.sol',12);
     __StatementCoverageSITMock('/Users/tikonoff/projects/mothership/contracts/test/SITMock.sol',1);
return mock_blockNumber;
  }

  function setMockedBlockNumber(uint _b) public {__FunctionCoverageSITMock('/Users/tikonoff/projects/mothership/contracts/test/SITMock.sol',3);

__CoverageSITMock('/Users/tikonoff/projects/mothership/contracts/test/SITMock.sol',16);
     __StatementCoverageSITMock('/Users/tikonoff/projects/mothership/contracts/test/SITMock.sol',2);
mock_blockNumber = _b;
  }

  uint mock_blockNumber = 1;
}
