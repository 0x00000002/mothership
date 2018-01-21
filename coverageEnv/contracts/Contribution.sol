pragma solidity ^0.4.11;

import "./misc/SafeMath.sol";
import "./interface/Controlled.sol";
import "./interface/TokenController.sol";
import "./interface/MiniMeTokenI.sol";
import "./interface/Finalizable.sol";

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

  Based on SampleCampaign-TokenController.sol from https://github.com/Giveth/minime
  Original contract is https://github.com/status-im/status-network-token/blob/master/contracts/StatusContribution.sol
*/

contract Contribution is Controlled, TokenController, Finalizable {event __CoverageContribution(string fileName, uint256 lineNumber);
event __FunctionCoverageContribution(string fileName, uint256 fnId);
event __StatementCoverageContribution(string fileName, uint256 statementId);
event __BranchCoverageContribution(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageContribution(string fileName, uint256 branchId);
event __AssertPostCoverageContribution(string fileName, uint256 branchId);

  using SafeMath for uint256;

  uint256 constant public maxGasPrice = 50000000000;
  uint256 constant public maxCallFrequency = 100;

  uint256 public totalSupplyCap; // Total MSP supply to be generated
  uint256 public exchangeRate; // ETH-MSP exchange rate
  uint256 public totalSold; // How much tokens sold
  uint256 public totalSaleSupplyCap; // Token sale cap

  MiniMeTokenI public sit;
  MiniMeTokenI public msp;

  uint256 public startBlock;
  uint256 public endBlock;

  address public destEthDevs;
  address public destTokensSit;
  address public destTokensTeam;
  address public destTokensReferals;

  address public mspController;

  uint256 public finalizedBlock;
  uint256 public initializedBlock;
  uint256 public finalizedTime;

  uint256 public minimum_investment;
  uint256 public minimum_goal;

  mapping (address => uint256) public lastCallBlock;

  bool public paused;

  modifier initialized() {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',1);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',66);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',1);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',1);
require(address(msp) != 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',1);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',67);
    _;
  }

  modifier contributionOpen() {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',2);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',71);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',2);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',2);
require(getBlockNumber() >= startBlock &&
            getBlockNumber() <= endBlock &&
            finalizedBlock == 0 &&
            address(msp) != 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',2);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',75);
    _;
  }

  modifier notPaused() {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',3);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',79);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',3);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',3);
require(!paused);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',3);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',80);
    _;
  }

  function Contribution() {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',4);

    // Booleans are false by default consider removing this
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',85);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',4);
paused = false;
  }

  /// @notice This method should be called by the controller before the contribution
  ///  period starts This initializes most of the parameters
  /// @param _msp Address of the MSP token contract
  /// @param _mspController Token controller for the MSP that will be transferred after
  ///  the contribution finalizes.
  /// @param _totalSupplyCap Maximum amount of tokens to generate during the contribution
  /// @param _exchangeRate ETH to MSP rate for the token sale
  /// @param _startBlock Block when the contribution period starts
  /// @param _endBlock The last block that the contribution period is active
  /// @param _destEthDevs Destination address where the contribution ether is sent
  /// @param _destTokensSit Address of the exchanger SIT-MSP where the MSP are sent
  ///  to be distributed to the SIT holders.
  /// @param _destTokensTeam Address where the tokens for the team are sent
  /// @param _destTokensReferals Address where the tokens for the referal system are sent
  /// @param _sit Address of the SIT token contract
  function initialize(
      address _msp,
      address _mspController,

      uint256 _totalSupplyCap,
      uint256 _exchangeRate,
      uint256 _minimum_goal,

      uint256 _startBlock,
      uint256 _endBlock,

      address _destEthDevs,
      address _destTokensSit,
      address _destTokensTeam,
      address _destTokensReferals,

      address _sit
  ) public onlyController {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',5);

    // Initialize only once
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',122);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',4);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',5);
require(address(msp) == 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',4);


__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',124);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',6);
msp = MiniMeTokenI(_msp);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',125);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',5);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',7);
require(msp.totalSupply() == 0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',5);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',126);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',6);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',8);
require(msp.controller() == address(this));__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',6);

    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',7);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',9);
require(msp.decimals() == 18);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',7);
  // Same amount of decimals as ETH

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',129);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',8);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',10);
require(_mspController != 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',8);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',130);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',11);
mspController = _mspController;

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',132);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',9);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',12);
require(_exchangeRate > 0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',9);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',133);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',13);
exchangeRate = _exchangeRate;

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',135);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',10);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',14);
require(_startBlock >= getBlockNumber());__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',10);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',136);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',11);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',15);
require(_startBlock < _endBlock);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',11);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',137);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',16);
startBlock = _startBlock;
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',138);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',17);
endBlock = _endBlock;

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',140);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',12);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',18);
require(_destEthDevs != 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',12);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',141);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',19);
destEthDevs = _destEthDevs;

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',143);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',13);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',20);
require(_destTokensSit != 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',13);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',144);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',21);
destTokensSit = _destTokensSit;

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',146);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',14);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',22);
require(_destTokensTeam != 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',14);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',147);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',23);
destTokensTeam = _destTokensTeam;

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',149);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',15);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',24);
require(_destTokensReferals != 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',15);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',150);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',25);
destTokensReferals = _destTokensReferals;

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',152);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',16);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',26);
require(_sit != 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',16);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',153);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',27);
sit = MiniMeTokenI(_sit);

    // SIT amount should be no more than 20% of MSP total supply cap
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',156);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',17);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',28);
require(MiniMeTokenI(sit).totalSupply() * 5 <= _totalSupplyCap);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',17);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',157);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',29);
totalSupplyCap = _totalSupplyCap;

    // We are going to sale 70% of total supply cap
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',160);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',30);
totalSaleSupplyCap = percent(70).mul(_totalSupplyCap).div(percent(100));

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',162);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',31);
minimum_goal = _minimum_goal;
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',163);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',32);
initializedBlock = getBlockNumber();
  }

  function setMinimumInvestment(
      uint _minimum_investment
  ) public onlyController {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',6);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',169);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',33);
minimum_investment = _minimum_investment;
  }

  /// @notice If anybody sends Ether directly to this contract, consider he is
  ///  getting MSPs.
  function () public payable notPaused {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',7);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',175);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',34);
proxyPayment(msg.sender);
  }


  //////////
  // TokenController functions
  //////////

  /// @notice This method will generally be called by the MSP token contract to
  ///  acquire MSPs. Or directly from third parties that want to acquire MSPs in
  ///  behalf of a token holder.
  /// @param _th MSP holder where the MSPs will be minted.
  function proxyPayment(address _th) public payable notPaused initialized contributionOpen returns (bool) {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',8);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',188);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',18);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',35);
require(_th != 0x0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',18);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',189);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',36);
doBuy(_th);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',190);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',37);
return true;
  }

  function onTransfer(address, address, uint256) public returns (bool) {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',9);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',194);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',38);
return false;
  }

  function onApprove(address, address, uint256) public returns (bool) {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',10);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',198);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',39);
return false;
  }

  function doBuy(address _th) internal {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',11);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',202);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',19);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',40);
require(tx.gasprice <= maxGasPrice);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',19);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',203);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',20);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',41);
require(msg.value >= minimum_investment);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',20);


    // Antispam mechanism
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',206);
    address caller;
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',207);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',42);
if (msg.sender == address(msp)) {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',21,0);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',208);
       __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',43);
caller = _th;
    } else {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',21,1);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',210);
       __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',44);
caller = msg.sender;
    }

    // Do not allow contracts to game the system
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',214);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',22);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',45);
require(!isContract(caller));__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',22);


__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',216);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',23);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',46);
require(getBlockNumber().sub(lastCallBlock[caller]) >= maxCallFrequency);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',23);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',217);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',47);
lastCallBlock[caller] = getBlockNumber();

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',219);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',48);
uint256 toFund = msg.value;
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',220);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',49);
uint256 leftForSale = tokensForSale();
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',221);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',50);
if (toFund > 0) {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',24,0);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',222);
       __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',51);
if (leftForSale > 0) {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',25,0);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',223);
         __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',52);
uint256 tokensGenerated = toFund.mul(exchangeRate);

        // Check total supply cap reached, sell the all remaining tokens
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',226);
         __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',53);
if (tokensGenerated > leftForSale) {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',26,0);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',227);
           __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',54);
tokensGenerated = leftForSale;
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',228);
           __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',55);
toFund = leftForSale.div(exchangeRate);
        }else { __BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',26,1);}


__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',231);
        __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',27);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',56);
assert(msp.generateTokens(_th, tokensGenerated));__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',27);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',232);
         __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',57);
totalSold = totalSold.add(tokensGenerated);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',233);
        destEthDevs.transfer(toFund);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',234);
         __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',58);
NewSale(_th, toFund, tokensGenerated);
      } else {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',25,1);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',236);
         __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',59);
toFund = 0;
      }
    }else { __BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',24,1);}


__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',240);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',60);
uint256 toReturn = msg.value.sub(toFund);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',241);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',61);
if (toReturn > 0) {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',28,0);
      // If the call comes from the Token controller,
      // then we return it to the token Holder.
      // Otherwise we return to the sender.
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',245);
       __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',62);
if (msg.sender == address(msp)) {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',29,0);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',246);
        _th.transfer(toReturn);
      } else {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',29,1);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',248);
        msg.sender.transfer(toReturn);
      }
    }else { __BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',28,1);}

  }

  /// @dev Internal function to determine if an address is a contract
  /// @param _addr The address being queried
  /// @return True if `_addr` is a contract
  function isContract(address _addr) internal returns (bool) {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',12);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',257);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',63);
if (_addr == 0) { __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',64);
__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',30,0);return false;}else { __BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',30,1);}

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',258);
    uint256 size;
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',259);
    assembly {
      size := extcodesize(_addr)
    }
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',262);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',65);
return (size > 0);
  }

  function finalized() public returns (bool) {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',13);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',266);
    finalizedBlock != 0;
  }

  /// @notice This method will can be called by the controller before the contribution period
  ///  end or by anybody after the `endBlock`. This method finalizes the contribution period
  ///  by creating the remaining tokens and transferring the controller to the configured
  ///  controller.
  function finalize() public initialized {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',14);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',274);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',31);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',66);
require(getBlockNumber() >= startBlock);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',31);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',275);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',32);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',67);
require(sit.totalSupply().add(totalSold) >= minimum_goal);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',32);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',276);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',33);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',68);
require(msg.sender == controller || getBlockNumber() > endBlock || tokensForSale() == 0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',33);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',277);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',34);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',69);
require(finalizedBlock == 0);__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',34);


__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',279);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',70);
finalizedBlock = getBlockNumber();
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',280);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',71);
finalizedTime = now;

    // Generate 5% for the team
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',283);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',35);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',72);
assert(msp.generateTokens(
      destTokensTeam,
      percent(5).mul(totalSupplyCap).div(percent(100))));__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',35);


    // Generate 5% for the referal bonuses
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',288);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',36);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',73);
assert(msp.generateTokens(
      destTokensReferals,
      percent(5).mul(totalSupplyCap).div(percent(100))));__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',36);


    // Generate tokens for SIT exchanger
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',293);
    __AssertPreCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',37);
 __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',74);
assert(msp.generateTokens(
      destTokensSit,
      sit.totalSupply()));__AssertPostCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',37);


__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',297);
    msp.changeController(mspController);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',298);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',75);
Finalized();
  }

  function percent(uint256 p) internal returns (uint256) {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',15);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',302);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',76);
return p.mul(10**16);
  }


  //////////
  // Constant functions
  //////////

  /// @return Total tokens issued in weis.
  function tokensIssued() public returns (uint256) {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',16);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',312);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',77);
return msp.totalSupply();
  }

  /// @return Total tokens availale for the sale in weis.
  function tokensForSale() public returns(uint256) {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',17);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',317);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',78);
return totalSaleSupplyCap > totalSold ? totalSaleSupplyCap - totalSold : 0;
  }


  //////////
  // Testing specific methods
  //////////

  /// @notice This function is overridden by the test Mocks.
  function getBlockNumber() internal returns (uint256) {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',18);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',327);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',79);
return block.number;
  }


  //////////
  // Safety Methods
  //////////

  /// @notice This method can be used by the controller to extract mistakenly
  ///  sent tokens to this contract.
  /// @param _token The address of the token contract that you want to recover
  ///  set to 0 in case you want to extract ether.
  function claimTokens(address _token) public onlyController {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',19);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',340);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',80);
if (msp.controller() == address(this)) {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',38,0);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',341);
      msp.claimTokens(_token);
    }else { __BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',38,1);}

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',343);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',81);
if (_token == 0x0) {__BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',39,0);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',344);
      controller.transfer(this.balance);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',345);
       __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',82);
return;
    }else { __BranchCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',39,1);}


__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',348);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',83);
ERC20Token token = ERC20Token(_token);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',349);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',84);
uint256 balance = token.balanceOf(this);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',350);
    token.transfer(controller, balance);
__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',351);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',85);
ClaimedTokens(_token, controller, balance);
  }


  /// @notice Pauses the contribution if there is any issue
  function pauseContribution() onlyController {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',20);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',357);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',86);
paused = true;
  }

  /// @notice Resumes the contribution
  function resumeContribution() onlyController {__FunctionCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',21);

__CoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',362);
     __StatementCoverageContribution('/home/tikonoff/projects/mothership/contracts/Contribution.sol',87);
paused = false;
  }

  event ClaimedTokens(address indexed _token, address indexed _controller, uint256 _amount);
  event NewSale(address indexed _th, uint256 _amount, uint256 _tokens);
  event Finalized();
}
