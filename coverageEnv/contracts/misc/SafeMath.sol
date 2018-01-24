pragma solidity ^0.4.18;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {event __CoverageSafeMath(string fileName, uint256 lineNumber);
event __FunctionCoverageSafeMath(string fileName, uint256 fnId);
event __StatementCoverageSafeMath(string fileName, uint256 statementId);
event __BranchCoverageSafeMath(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSafeMath(string fileName, uint256 branchId);
event __AssertPostCoverageSafeMath(string fileName, uint256 branchId);


  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal returns (uint256) {__FunctionCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',1);

__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',14);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',1);
if (a == 0) {__BranchCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',1,0);
__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',15);
       __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',2);
return 0;
    }else { __BranchCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',1,1);}

__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',17);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',3);
uint256 c = a * b;
__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',18);
    __AssertPreCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',2);
 __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',4);
assert(c / a == b);__AssertPostCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',2);

__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',19);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',5);
return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal returns (uint256) {__FunctionCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',2);

    // assert(b > 0); // Solidity automatically throws when dividing by 0
__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',27);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',6);
uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',29);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',7);
return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal returns (uint256) {__FunctionCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',3);

__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',36);
    __AssertPreCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',3);
 __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',8);
assert(b <= a);__AssertPostCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',3);

__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',37);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',9);
return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal returns (uint256) {__FunctionCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',4);

__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',44);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',10);
uint256 c = a + b;
__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',45);
    __AssertPreCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',4);
 __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',11);
assert(c >= a);__AssertPostCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',4);

__CoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',46);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/mothership/contracts/misc/SafeMath.sol',12);
return c;
  }
}