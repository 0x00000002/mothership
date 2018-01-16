pragma solidity ^0.4.11;

import '../MSPPlaceholder.sol';

// @dev MSPPlaceHolderMock mocks current block number

contract MSPPlaceholderMock is MSPPlaceHolder {event __CoverageMSPPlaceholderMock(string fileName, uint256 lineNumber);
event __FunctionCoverageMSPPlaceholderMock(string fileName, uint256 fnId);
event __StatementCoverageMSPPlaceholderMock(string fileName, uint256 statementId);
event __BranchCoverageMSPPlaceholderMock(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMSPPlaceholderMock(string fileName, uint256 branchId);
event __AssertPostCoverageMSPPlaceholderMock(string fileName, uint256 branchId);


  uint mock_time;

  function MSPPlaceholderMock(address _controller, address _msp, address _contribution, address _sitExchanger)
    MSPPlaceHolder(_controller, _msp, _contribution, _sitExchanger) {__FunctionCoverageMSPPlaceholderMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPPlaceholderMock.sol',1);

__CoverageMSPPlaceholderMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPPlaceholderMock.sol',13);
     __StatementCoverageMSPPlaceholderMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPPlaceholderMock.sol',1);
mock_time = now;
  }

  function getTime() internal returns (uint) {__FunctionCoverageMSPPlaceholderMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPPlaceholderMock.sol',2);

__CoverageMSPPlaceholderMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPPlaceholderMock.sol',17);
     __StatementCoverageMSPPlaceholderMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPPlaceholderMock.sol',2);
return mock_time;
  }

  function setMockedTime(uint _t) public {__FunctionCoverageMSPPlaceholderMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPPlaceholderMock.sol',3);

__CoverageMSPPlaceholderMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPPlaceholderMock.sol',21);
     __StatementCoverageMSPPlaceholderMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/MSPPlaceholderMock.sol',3);
mock_time = _t;
  }
}
