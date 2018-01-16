pragma solidity ^0.4.11;

import '../MSP.sol';

// @dev MSPMock mocks current block number

contract MSPMock is MSP {event __CoverageMSPMock(string fileName, uint256 lineNumber);
event __FunctionCoverageMSPMock(string fileName, uint256 fnId);
event __StatementCoverageMSPMock(string fileName, uint256 statementId);
event __BranchCoverageMSPMock(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMSPMock(string fileName, uint256 branchId);
event __AssertPostCoverageMSPMock(string fileName, uint256 branchId);


  function MSPMock(address _tokenFactory) MSP(_tokenFactory) {__FunctionCoverageMSPMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPMock.sol',1);
}

  function getBlockNumber() internal returns (uint) {__FunctionCoverageMSPMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPMock.sol',2);

__CoverageMSPMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPMock.sol',12);
     __StatementCoverageMSPMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPMock.sol',1);
return mock_blockNumber;
  }

  function setMockedBlockNumber(uint _b) public {__FunctionCoverageMSPMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPMock.sol',3);

__CoverageMSPMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPMock.sol',16);
     __StatementCoverageMSPMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPMock.sol',2);
mock_blockNumber = _b;
  }

  uint mock_blockNumber = 1;
}
