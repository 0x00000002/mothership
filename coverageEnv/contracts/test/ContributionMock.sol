pragma solidity ^0.4.11;

import '../Contribution.sol';

// @dev ContributionMock mocks current block number

contract ContributionMock is Contribution {event __CoverageContributionMock(string fileName, uint256 lineNumber);
event __FunctionCoverageContributionMock(string fileName, uint256 fnId);
event __StatementCoverageContributionMock(string fileName, uint256 statementId);
event __BranchCoverageContributionMock(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageContributionMock(string fileName, uint256 branchId);
event __AssertPostCoverageContributionMock(string fileName, uint256 branchId);


  function ContributionMock() Contribution() {__FunctionCoverageContributionMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/ContributionMock.sol',1);
}

  function getBlockNumber() internal returns (uint) {__FunctionCoverageContributionMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/ContributionMock.sol',2);

__CoverageContributionMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/ContributionMock.sol',12);
     __StatementCoverageContributionMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/ContributionMock.sol',1);
return mock_blockNumber;
  }

  function setMockedBlockNumber(uint _b) public {__FunctionCoverageContributionMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/ContributionMock.sol',3);

__CoverageContributionMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/ContributionMock.sol',16);
     __StatementCoverageContributionMock('/home/tknff/projects/Mothership-contracts-master/contracts/test/ContributionMock.sol',2);
mock_blockNumber = _b;
  }

  uint mock_blockNumber = 1;
}
