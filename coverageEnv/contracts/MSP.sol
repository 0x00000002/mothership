pragma solidity ^0.4.11;

import "./MiniMeToken.sol";

/*
  Copyright 2017, Anton Egorov (Mothership Foundation)
*/

contract MSP is MiniMeToken {event __CoverageMSP(string fileName, uint256 lineNumber);
event __FunctionCoverageMSP(string fileName, uint256 fnId);
event __StatementCoverageMSP(string fileName, uint256 statementId);
event __BranchCoverageMSP(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMSP(string fileName, uint256 branchId);
event __AssertPostCoverageMSP(string fileName, uint256 branchId);


  function MSP(address _tokenFactory)
    MiniMeToken(
                _tokenFactory,
                0x0,                // no parent token
                0,                  // no snapshot block number from parent
                "Mothership Token", // Token name
                18,                 // Decimals
                "MSP",              // Symbol
                false               // Enable transfers
                ) {__FunctionCoverageMSP('/Users/tikonoff/projects/mothership/contracts/MSP.sol',1);
}
}
