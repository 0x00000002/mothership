// create a contract to transfer referal bonuses pool
pragma solidity ^0.4.11;

import "./interface/Controlled.sol";
import "./interface/MiniMeTokenI.sol";
import "./interface/Finalizable.sol";

contract ReferalsTokenHolder is Controlled {event __CoverageReferalsTokenHolder(string fileName, uint256 lineNumber);
event __FunctionCoverageReferalsTokenHolder(string fileName, uint256 fnId);
event __StatementCoverageReferalsTokenHolder(string fileName, uint256 statementId);
event __BranchCoverageReferalsTokenHolder(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageReferalsTokenHolder(string fileName, uint256 branchId);
event __AssertPostCoverageReferalsTokenHolder(string fileName, uint256 branchId);

  MiniMeTokenI public msp;
  mapping (address => bool) been_spread;

  function ReferalsTokenHolder(address _msp) {__FunctionCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',1);

__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',13);
     __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',1);
msp = MiniMeTokenI(_msp);
  }

  function spread(address[] _addresses, uint256[] _amounts) public onlyController {__FunctionCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',2);

__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',17);
    __AssertPreCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',1);
 __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',2);
require(Finalizable(msp.controller()).finalized());__AssertPostCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',1);

__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',18);
    __AssertPreCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',2);
 __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',3);
require(_addresses.length == _amounts.length);__AssertPostCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',2);


__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',20);
     __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',4);
for (uint256 i = 0; i < _addresses.length; i++) {
__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',21);
       __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',5);
address addr = _addresses[i];
__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',22);
       __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',6);
if (!been_spread[addr]) {__BranchCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',3,0);
__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',23);
         __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',7);
uint256 amount = _amounts[i];
__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',24);
        __AssertPreCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',4);
 __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',8);
assert(msp.transfer(addr, amount));__AssertPostCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',4);

__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',25);
         __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',9);
been_spread[addr] = true;
      }else { __BranchCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',3,1);}

    }
  }

//////////
// Safety Methods
//////////

  /// @notice This method can be used by the controller to extract mistakenly
  ///  sent tokens to this contract.
  /// @param _token The address of the token contract that you want to recover
  ///  set to 0 in case you want to extract ether.
  function claimTokens(address _token) onlyController {__FunctionCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',3);

__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',39);
     __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',10);
if (_token == 0x0) {__BranchCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',5,0);
__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',40);
      controller.transfer(this.balance);
__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',41);
       __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',11);
return;
    }else { __BranchCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',5,1);}


__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',44);
     __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',12);
ERC20Token token = ERC20Token(_token);
__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',45);
     __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',13);
uint balance = token.balanceOf(this);
__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',46);
    token.transfer(controller, balance);
__CoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',47);
     __StatementCoverageReferalsTokenHolder('/Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol',14);
ClaimedTokens(_token, controller, balance);
  }

  event ClaimedTokens(address indexed _token, address indexed _controller, uint _amount);
}
