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

/// @title MSPPlaceholder Contract
/// @author Jordi Baylina
/// @dev The MSPPlaceholder contract will take control over the MSP after the contribution
///  is finalized and before the Mothership Network is deployed.
///  The contract allows for MSP transfers and transferFrom and implements the
///  logic for transferring control of the token to the network when the offering
///  asks it to do so.


import "./misc/SafeMath.sol";
import "./interface/Controlled.sol";
import "./interface/TokenController.sol";
import "./interface/ERC20Token.sol";
import "./interface/MiniMeTokenI.sol";
import "./Contribution.sol";


contract MSPPlaceHolder is Controlled, TokenController {event __CoverageMSPPlaceHolder(string fileName, uint256 lineNumber);
event __FunctionCoverageMSPPlaceHolder(string fileName, uint256 fnId);
event __StatementCoverageMSPPlaceHolder(string fileName, uint256 statementId);
event __BranchCoverageMSPPlaceHolder(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMSPPlaceHolder(string fileName, uint256 branchId);
event __AssertPostCoverageMSPPlaceHolder(string fileName, uint256 branchId);

  using SafeMath for uint256;

  MiniMeTokenI public msp;
  Contribution public contribution;

  uint256 public activationTime;
  address public sitExchanger;

  /// @notice Constructor
  /// @param _controller Trusted controller for this contract.
  /// @param _msp MSP token contract address
  /// @param _contribution Contribution contract address
  /// @param _sitExchanger SIT-MSP Exchange address. (During the first day
  ///  only this exchanger will be able to move tokens)
  function MSPPlaceHolder(address _controller, address _msp, address _contribution, address _sitExchanger) {__FunctionCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',1);

__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',54);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',1);
controller = _controller;
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',55);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',2);
msp = MiniMeTokenI(_msp);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',56);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',3);
contribution = Contribution(_contribution);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',57);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',4);
sitExchanger = _sitExchanger;
  }

  /// @notice The controller of this contract can change the controller of the MSP token
  ///  Please, be sure that the controller is a trusted agent or 0x0 address.
  /// @param _newController The address of the new controller

  function changeController(address _newController) public onlyController {__FunctionCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',2);

__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',65);
    msp.changeController(_newController);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',66);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',5);
ControllerChanged(_newController);
  }


  //////////
  // MiniMe Controller Interface functions
  //////////

  // In between the offering and the network. Default settings for allowing token transfers.
  function proxyPayment(address) public payable returns (bool) {__FunctionCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',3);

__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',76);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',6);
return false;
  }

  function onTransfer(address _from, address, uint256) public returns (bool) {__FunctionCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',4);

__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',80);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',7);
return transferable(_from);
  }

  function onApprove(address _from, address, uint256) public returns (bool) {__FunctionCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',5);

__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',84);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',8);
return transferable(_from);
  }

  function transferable(address _from) internal returns (bool) {__FunctionCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',6);

    // Allow the exchanger to work from the beginning
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',89);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',9);
if (activationTime == 0) {__BranchCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',1,0);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',90);
       __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',10);
uint256 f = contribution.finalizedTime();
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',91);
       __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',11);
if (f > 0) {__BranchCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',2,0);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',92);
         __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',12);
activationTime = f.add(24 hours);
      } else {__BranchCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',2,1);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',94);
         __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',13);
return false;
      }
    }else { __BranchCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',1,1);}

__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',97);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',14);
return (getTime() > activationTime) || (_from == sitExchanger);
  }


  //////////
  // Testing specific methods
  //////////

  /// @notice This function is overridden by the test Mocks.
  function getTime() internal returns (uint256) {__FunctionCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',7);

__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',107);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',15);
return now;
  }


  //////////
  // Safety Methods
  //////////

  /// @notice This method can be used by the controller to extract mistakenly
  ///  sent tokens to this contract.
  /// @param _token The address of the token contract that you want to recover
  ///  set to 0 in case you want to extract ether.
  function claimTokens(address _token) public onlyController {__FunctionCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',8);

__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',120);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',16);
if (msp.controller() == address(this)) {__BranchCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',3,0);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',121);
      msp.claimTokens(_token);
    }else { __BranchCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',3,1);}

__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',123);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',17);
if (_token == 0x0) {__BranchCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',4,0);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',124);
      controller.transfer(this.balance);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',125);
       __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',18);
return;
    }else { __BranchCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',4,1);}


__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',128);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',19);
ERC20Token token = ERC20Token(_token);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',129);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',20);
uint256 balance = token.balanceOf(this);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',130);
    token.transfer(controller, balance);
__CoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',131);
     __StatementCoverageMSPPlaceHolder('/home/tknff/projects/Mothership-contracts-master/contracts/MSPPlaceholder.sol',21);
ClaimedTokens(_token, controller, balance);
  }

  event ClaimedTokens(address indexed _token, address indexed _controller, uint256 _amount);
  event ControllerChanged(address indexed _newController);
}
