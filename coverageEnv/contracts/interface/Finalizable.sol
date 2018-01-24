pragma solidity ^0.4.11;

contract Finalizable {event __CoverageFinalizable(string fileName, uint256 lineNumber);
event __FunctionCoverageFinalizable(string fileName, uint256 fnId);
event __StatementCoverageFinalizable(string fileName, uint256 statementId);
event __BranchCoverageFinalizable(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageFinalizable(string fileName, uint256 branchId);
event __AssertPostCoverageFinalizable(string fileName, uint256 branchId);

  function finalize();
  function finalized() returns (bool);
}
