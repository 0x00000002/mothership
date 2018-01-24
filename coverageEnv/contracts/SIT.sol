pragma solidity ^0.4.11;

import "./MiniMeToken.sol";

/*
  Copyright 2017, Anton Egorov (Mothership Foundation)
*/

contract SIT is MiniMeToken {event __CoverageSIT(string fileName, uint256 lineNumber);
event __FunctionCoverageSIT(string fileName, uint256 fnId);
event __StatementCoverageSIT(string fileName, uint256 statementId);
event __BranchCoverageSIT(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSIT(string fileName, uint256 branchId);
event __AssertPostCoverageSIT(string fileName, uint256 branchId);


  function SIT(address _tokenFactory)
    MiniMeToken(
                _tokenFactory,
                0x0,                        // no parent token
                0,                          // no snapshot block number from parent
                "Strategic Investor Token", // Token name
                18,                         // Decimals
                "SIT",                      // Symbol
                false                       // Enable transfers
                ) {__FunctionCoverageSIT('/Users/tikonoff/projects/mothership/contracts/SIT.sol',1);
}
}
