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

/// @title ContributionWallet Contract
/// @author Jordi Baylina
/// @dev This contract will be hold the Ether during the contribution period.
///  The idea of this contract is to avoid recycling Ether during the contribution
///  period. So all the ETH collected will be locked here until the contribution
///  period ends

// @dev Contract to hold sale raised funds during the sale period.
// Prevents attack in which the Aragon Multisig sends raised ether
// to the sale contract to mint tokens to itself, and getting the
// funds back immediately.


import "./Contribution.sol";


contract ContributionWallet {event __CoverageContributionWallet(string fileName, uint256 lineNumber);
event __FunctionCoverageContributionWallet(string fileName, uint256 fnId);
event __StatementCoverageContributionWallet(string fileName, uint256 statementId);
event __BranchCoverageContributionWallet(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageContributionWallet(string fileName, uint256 branchId);
event __AssertPostCoverageContributionWallet(string fileName, uint256 branchId);


    // Public variables
    address public multisig;
    uint256 public endBlock;
    Contribution public contribution;

    // @dev Constructor initializes public variables
    // @param _multisig The address of the multisig that will receive the funds
    // @param _endBlock Block after which the multisig can request the funds
    // @param _contribution Address of the Contribution contract
    function ContributionWallet(address _multisig, uint256 _endBlock, address _contribution) {__FunctionCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',1);

__CoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',49);
        __AssertPreCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',1);
 __StatementCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',1);
require(_multisig != 0x0);__AssertPostCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',1);

__CoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',50);
        __AssertPreCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',2);
 __StatementCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',2);
require(_contribution != 0x0);__AssertPostCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',2);

__CoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',51);
        __AssertPreCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',3);
 __StatementCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',3);
require(_endBlock != 0 && _endBlock <= 4000000);__AssertPostCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',3);

__CoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',52);
         __StatementCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',4);
multisig = _multisig;
__CoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',53);
         __StatementCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',5);
endBlock = _endBlock;
__CoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',54);
         __StatementCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',6);
contribution = Contribution(_contribution);
    }

    // @dev Receive all sent funds without any further logic
    function () public payable {__FunctionCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',2);
}

    // @dev Withdraw function sends all the funds to the wallet if conditions are correct
    function withdraw() public {__FunctionCoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',3);

//        require(msg.sender == multisig);              // Only the multisig can request it
//        // TODO check for minimal goal instead of end of contribution
//        require(block.number > endBlock ||            // Allow after end block
             //   contribution.finalizedBlock() != 0);  // Allow when sale is finalized
__CoverageContributionWallet('/Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol',66);
        multisig.transfer(this.balance);
    }

}
