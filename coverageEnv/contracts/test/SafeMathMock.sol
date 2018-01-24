pragma solidity ^0.4.18;


import "../misc/SafeMath.sol";


contract SafeMathMock {event __CoverageSafeMathMock(string fileName, uint256 lineNumber);
event __FunctionCoverageSafeMathMock(string fileName, uint256 fnId);
event __StatementCoverageSafeMathMock(string fileName, uint256 statementId);
event __BranchCoverageSafeMathMock(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSafeMathMock(string fileName, uint256 branchId);
event __AssertPostCoverageSafeMathMock(string fileName, uint256 branchId);

    uint256 public result;

    function multiply(uint256 a, uint256 b) public {__FunctionCoverageSafeMathMock('/Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol',1);

__CoverageSafeMathMock('/Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol',11);
         __StatementCoverageSafeMathMock('/Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol',1);
result = SafeMath.mul(a, b);
    }

    function subtract(uint256 a, uint256 b) public {__FunctionCoverageSafeMathMock('/Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol',2);

__CoverageSafeMathMock('/Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol',15);
         __StatementCoverageSafeMathMock('/Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol',2);
result = SafeMath.sub(a, b);
    }

    function add(uint256 a, uint256 b) public {__FunctionCoverageSafeMathMock('/Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol',3);

__CoverageSafeMathMock('/Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol',19);
         __StatementCoverageSafeMathMock('/Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol',3);
result = SafeMath.add(a, b);
    }
}