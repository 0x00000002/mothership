pragma solidity ^0.4.11;

/*
  Copyright 2017, Jorge Izquierdo (Aragon Foundation)
  Copyright 2017, Jordi Baylina (Giveth)

  Based on MiniMeToken.sol from https://github.com/Giveth/minime
  Original contract from https://github.com/aragon/aragon-network-token/blob/master/contracts/interface/Controlled.sol
*/

contract Controlled {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

  /// @notice The address of the controller is the only address that can call
  ///  a function with this modifier
  modifier onlyController {__FunctionCoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',1);
  __StatementCoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',1);
if (msg.sender != controller) { __StatementCoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',2);
__BranchCoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',1,0);throw;}else { __BranchCoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',1,1);}
 _; }

  address public controller;

  function Controlled() {__FunctionCoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',2);
  __StatementCoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',3);
controller = msg.sender;}

  /// @notice Changes the controller of the contract
  /// @param _newController The new controller of the contract
  function changeController(address _newController) onlyController {__FunctionCoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',3);

__CoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',23);
     __StatementCoverageControlled('/home/tikonoff/projects/mothership/contracts/interface/Controlled.sol',4);
controller = _newController;
  }
}
