pragma solidity ^0.4.11;


/**
 * Math operations with safety checks
 */
library SafeMath {event __CoverageSafeMath(string fileName, uint256 lineNumber);
event __FunctionCoverageSafeMath(string fileName, uint256 fnId);
event __StatementCoverageSafeMath(string fileName, uint256 statementId);
event __BranchCoverageSafeMath(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSafeMath(string fileName, uint256 branchId);
event __AssertPostCoverageSafeMath(string fileName, uint256 branchId);

  function mul(uint a, uint b) internal returns (uint) {__FunctionCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',1);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',9);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',1);
uint c = a * b;
__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',10);
    __AssertPreCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',1);
 __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',2);
assert(a == 0 || c / a == b);__AssertPostCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',1);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',11);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',3);
return c;
  }

  function div(uint a, uint b) internal returns (uint) {__FunctionCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',2);

    // assert(b > 0); // Solidity automatically throws when dividing by 0
__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',16);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',4);
uint c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',18);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',5);
return c;
  }

  function sub(uint a, uint b) internal returns (uint) {__FunctionCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',3);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',22);
    __AssertPreCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',2);
 __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',6);
assert(b <= a);__AssertPostCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',2);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',23);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',7);
return a - b;
  }

  function add(uint a, uint b) internal returns (uint) {__FunctionCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',4);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',27);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',8);
uint c = a + b;
__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',28);
    __AssertPreCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',3);
 __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',9);
assert(c >= a);__AssertPostCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',3);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',29);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',10);
return c;
  }

  function max64(uint64 a, uint64 b) internal returns (uint64) {__FunctionCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',5);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',33);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',11);
return a >= b ? a : b;
  }

  function min64(uint64 a, uint64 b) internal returns (uint64) {__FunctionCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',6);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',37);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',12);
return a < b ? a : b;
  }

  function max256(uint256 a, uint256 b) internal returns (uint256) {__FunctionCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',7);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',41);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',13);
return a >= b ? a : b;
  }

  function min256(uint256 a, uint256 b) internal returns (uint256) {__FunctionCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',8);

__CoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',45);
     __StatementCoverageSafeMath('/home/tknff/projects/Mothership-contracts-master/contracts/misc/SafeMath.sol',14);
return a < b ? a : b;
  }
}
