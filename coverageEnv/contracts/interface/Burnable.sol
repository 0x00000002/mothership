pragma solidity ^0.4.11;

/*
  Copyright 2017, Jorge Izquierdo (Aragon Foundation)
  Copyright 2017, Jordi Baylina (Giveth)

  Based on MiniMeToken.sol from https://github.com/Giveth/minime
  Original contract from https://github.com/aragon/aragon-network-token/blob/master/contracts/interface/Controlled.sol
*/

import "./Controlled.sol";

contract Burnable is Controlled {event __CoverageBurnable(string fileName, uint256 lineNumber);
event __FunctionCoverageBurnable(string fileName, uint256 fnId);
event __StatementCoverageBurnable(string fileName, uint256 statementId);
event __BranchCoverageBurnable(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageBurnable(string fileName, uint256 branchId);
event __AssertPostCoverageBurnable(string fileName, uint256 branchId);

  /// @notice The address of the controller is the only address that can call
  ///  a function with this modifier, also the burner can call but also the
  /// target of the function must be the burner
  modifier onlyControllerOrBurner(address target) {__FunctionCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',1);

__CoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',18);
    __AssertPreCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',1);
 __StatementCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',1);
assert(msg.sender == controller || (msg.sender == burner && msg.sender == target));__AssertPostCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',1);

__CoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',19);
    _;
  }

  modifier onlyBurner {__FunctionCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',2);

__CoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',23);
    __AssertPreCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',2);
 __StatementCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',2);
assert(msg.sender == burner);__AssertPostCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',2);

__CoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',24);
    _;
  }
  address public burner;

  function Burnable() {__FunctionCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',3);
  __StatementCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',3);
burner = msg.sender;}

  /// @notice Changes the burner of the contract
  /// @param _newBurner The new burner of the contract
  function changeBurner(address _newBurner) onlyBurner {__FunctionCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',4);

__CoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',33);
     __StatementCoverageBurnable('/Users/tikonoff/projects/mothership/contracts/interface/Burnable.sol',4);
burner = _newBurner;
  }
}
