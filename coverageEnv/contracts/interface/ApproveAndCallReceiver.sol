pragma solidity ^0.4.11;

/*
  Copyright 2017, Jordi Baylina (Giveth)

  Original contract from https://github.com/aragon/aragon-network-token/blob/master/contracts/interface/ApproveAndCallReceiver.sol
*/

contract ApproveAndCallReceiver {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);

  function receiveApproval(address _from, uint256 _amount, address _token, bytes _data);
}
