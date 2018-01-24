pragma solidity ^0.4.11;

/*
  Copyright 2017, Anton Egorov (Mothership Foundation)
  Copyright 2017, Jordi Baylina (Giveth)

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/// @title SITExchanger Contract
/// @author Anton Egorov
/// @dev This contract will be used to distribute MSP between SIT holders.
///  SIT token is not transferable, and we just keep an accounting between all tokens
///  deposited and the tokens collected.
///  The controllerShip of SIT should be transferred to this contract before the
///  contribution period starts.


import "./misc/SafeMath.sol";
import "./interface/Controlled.sol";
import "./interface/ERC20Token.sol";
import "./interface/MiniMeTokenI.sol";
import "./Contribution.sol";

contract SITExchanger is Controlled, TokenController {event __CoverageSITExchanger(string fileName, uint256 lineNumber);
event __FunctionCoverageSITExchanger(string fileName, uint256 fnId);
event __StatementCoverageSITExchanger(string fileName, uint256 statementId);
event __BranchCoverageSITExchanger(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSITExchanger(string fileName, uint256 branchId);
event __AssertPostCoverageSITExchanger(string fileName, uint256 branchId);

  using SafeMath for uint256;

  mapping (address => uint256) public collected;
  uint256 public totalCollected;
  MiniMeTokenI public sit;
  MiniMeTokenI public msp;
  Contribution public contribution;

  function SITExchanger(address _sit, address _msp, address _contribution) {__FunctionCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',1);

__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',46);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',1);
sit = MiniMeTokenI(_sit);
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',47);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',2);
msp = MiniMeTokenI(_msp);
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',48);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',3);
contribution = Contribution(_contribution);
  }

  /// @notice This method should be called by the SIT holders to collect their
  ///  corresponding MSPs
  function collect() public {__FunctionCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',2);

    // SIT sholder could collect MSP right after contribution started
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',55);
    __AssertPreCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',1);
 __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',4);
require(getBlockNumber() > contribution.startBlock());__AssertPostCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',1);


    // Get current MSP ballance
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',58);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',5);
uint256 balance = sit.balanceOfAt(msg.sender, contribution.initializedBlock());

    // And then subtract the amount already collected
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',61);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',6);
uint256 amount = balance.sub(collected[msg.sender]);

    __AssertPreCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',2);
 __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',7);
require(amount > 0);__AssertPostCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',2);
  // Notify the user that there are no tokens to exchange

__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',65);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',8);
totalCollected = totalCollected.add(amount);
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',66);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',9);
collected[msg.sender] = collected[msg.sender].add(amount);

__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',68);
    __AssertPreCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',3);
 __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',10);
assert(msp.transfer(msg.sender, amount));__AssertPostCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',3);


__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',70);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',11);
TokensCollected(msg.sender, amount);
  }

  function proxyPayment(address) public payable returns (bool) {__FunctionCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',3);

__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',74);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',12);
throw;
  }

  function onTransfer(address, address, uint256) public returns (bool) {__FunctionCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',4);

__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',78);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',13);
return false;
  }

  function onApprove(address, address, uint256) public returns (bool) {__FunctionCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',5);

__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',82);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',14);
return false;
  }

  //////////
  // Testing specific methods
  //////////

  /// @notice This function is overridden by the test Mocks.
  function getBlockNumber() internal returns (uint256) {__FunctionCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',6);

__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',91);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',15);
return block.number;
  }

  //////////
  // Safety Method
  //////////

  /// @notice This method can be used by the controller to extract mistakenly
  ///  sent tokens to this contract.
  /// @param _token The address of the token contract that you want to recover
  ///  set to 0 in case you want to extract ether.
  function claimTokens(address _token) public onlyController {__FunctionCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',7);

__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',103);
    __AssertPreCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',4);
 __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',16);
require(_token != address(msp));__AssertPostCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',4);

__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',104);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',17);
if (_token == 0x0) {__BranchCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',5,0);
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',105);
      controller.transfer(this.balance);
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',106);
       __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',18);
return;
    }else { __BranchCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',5,1);}


__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',109);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',19);
ERC20Token token = ERC20Token(_token);
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',110);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',20);
uint256 balance = token.balanceOf(this);
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',111);
    token.transfer(controller, balance);
__CoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',112);
     __StatementCoverageSITExchanger('/Users/tikonoff/projects/mothership/contracts/SITExchanger.sol',21);
ClaimedTokens(_token, controller, balance);
  }

  event ClaimedTokens(address indexed _token, address indexed _controller, uint256 _amount);
  event TokensCollected(address indexed _holder, uint256 _amount);

}
