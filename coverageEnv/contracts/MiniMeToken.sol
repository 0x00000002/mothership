pragma solidity ^0.4.11;

import "./interface/ERC20Token.sol";
import "./interface/MiniMeTokenI.sol";
import "./interface/TokenController.sol";
import "./interface/ApproveAndCallReceiver.sol";

/*
  Copyright 2017, Anton Egorov (Mothership Foundation)
  Copyright 2017, Jordi Baylina (Giveth)

  Based on MineMeToken.sol from https://github.com/Giveth/minime
  Original contract from https://github.com/status-im/status-network-token/blob/master/contracts/MiniMeToken.sol
*/

/// @title MiniMeToken Contract
/// @author Jordi Baylina
/// @dev This token contract's goal is to make it easy for anyone to clone this
///  token using the token distribution at a given block, this will allow DAO's
///  and DApps to upgrade their features in a decentralized manner without
///  affecting the original token
/// @dev It is ERC20 compliant, but still needs to under go further testing.

/// @dev The actual token contract, the default controller is the msg.sender
///  that deploys the contract, so usually this token will be deployed by a
///  token controller contract, which Giveth will call a "Campaign"
contract MiniMeToken is MiniMeTokenI {event __CoverageMiniMeToken(string fileName, uint256 lineNumber);
event __FunctionCoverageMiniMeToken(string fileName, uint256 fnId);
event __StatementCoverageMiniMeToken(string fileName, uint256 statementId);
event __BranchCoverageMiniMeToken(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMiniMeToken(string fileName, uint256 branchId);
event __AssertPostCoverageMiniMeToken(string fileName, uint256 branchId);


    /// @dev `Checkpoint` is the structure that attaches a block number to a
    ///  given value, the block number attached is the one that last changed the
    ///  value
    struct  Checkpoint {

        // `fromBlock` is the block number that the value was generated from
        uint128 fromBlock;

        // `value` is the amount of tokens at a specific block number
        uint128 value;
    }

    // `parentToken` is the Token address that was cloned to produce this token;
    //  it will be 0x0 for a token that was not cloned
    MiniMeToken public parentToken;

    // `parentSnapShotBlock` is the block number from the Parent Token that was
    //  used to determine the initial distribution of the Clone Token
    uint public parentSnapShotBlock;

    // `creationBlock` is the block number that the Clone Token was created
    uint public creationBlock;

    // `balances` is the map that tracks the balance of each address, in this
    //  contract when the balance changes the block number that the change
    //  occurred is also included in the map
    mapping (address => Checkpoint[]) balances;

    // `allowed` tracks any extra transfer rights as in all ERC20 tokens
    mapping (address => mapping (address => uint256)) allowed;

    // Tracks the history of the `totalSupply` of the token
    Checkpoint[] totalSupplyHistory;

    // Flag that determines if the token is transferable or not.
    bool public transfersEnabled;

    // The factory used to create new clone tokens
    MiniMeTokenFactory public tokenFactory;

////////////////
// Constructor
////////////////

    /// @notice Constructor to create a MiniMeToken
    /// @param _tokenFactory The address of the MiniMeTokenFactory contract that
    ///  will create the Clone token contracts, the token factory needs to be
    ///  deployed first
    /// @param _parentToken Address of the parent token, set to 0x0 if it is a
    ///  new token
    /// @param _parentSnapShotBlock Block of the parent token that will
    ///  determine the initial distribution of the clone token, set to 0 if it
    ///  is a new token
    /// @param _tokenName Name of the new token
    /// @param _decimalUnits Number of decimals of the new token
    /// @param _tokenSymbol Token Symbol for the new token
    /// @param _transfersEnabled If true, tokens will be able to be transferred
    function MiniMeToken(
        address _tokenFactory,
        address _parentToken,
        uint _parentSnapShotBlock,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        bool _transfersEnabled
    ) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',1);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',95);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',1);
tokenFactory = MiniMeTokenFactory(_tokenFactory);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',2);
name = _tokenName;                                 // Set the name
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',3);
decimals = _decimalUnits;                          // Set the decimals
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',4);
symbol = _tokenSymbol;                             // Set the symbol
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',99);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',5);
parentToken = MiniMeToken(_parentToken);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',100);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',6);
parentSnapShotBlock = _parentSnapShotBlock;
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',101);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',7);
transfersEnabled = _transfersEnabled;
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',102);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',8);
creationBlock = getBlockNumber();
    }


///////////////////
// ERC20 Methods
///////////////////

    /// @notice Send `_amount` tokens to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return Whether the transfer was successful or not
    function transfer(address _to, uint256 _amount) returns (bool success) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',2);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',115);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',9);
if (!transfersEnabled) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',10);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',1,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',1,1);}

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',116);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',11);
return doTransfer(msg.sender, _to, _amount);
    }

    /// @notice Send `_amount` tokens to `_to` from `_from` on the condition it
    ///  is approved by `_from`
    /// @param _from The address holding the tokens being transferred
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return True if the transfer was successful
    function transferFrom(address _from, address _to, uint256 _amount
    ) returns (bool success) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',3);


        // The controller of this contract can move tokens around at will,
        //  this is important to recognize! Confirm that you trust the
        //  controller of this contract, which in most situations should be
        //  another open source smart contract or 0x0
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',132);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',12);
if (msg.sender != controller) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',2,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',133);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',13);
if (!transfersEnabled) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',14);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',3,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',3,1);}


            // The standard ERC 20 transferFrom functionality
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',136);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',15);
if (allowed[_from][msg.sender] < _amount) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',16);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',4,0);return false;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',4,1);}

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',137);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',17);
allowed[_from][msg.sender] -= _amount;
        }else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',2,1);}

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',139);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',18);
return doTransfer(_from, _to, _amount);
    }

    /// @dev This is the actual transfer function in the token contract, it can
    ///  only be called by other functions in this contract.
    /// @param _from The address holding the tokens being transferred
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return True if the transfer was successful
    function doTransfer(address _from, address _to, uint _amount
    ) internal returns(bool) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',4);


__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',151);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',19);
if (_amount == 0) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',5,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',152);
                __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',20);
return true;
           }else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',5,1);}


__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',155);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',21);
if (parentSnapShotBlock >= getBlockNumber()) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',22);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',6,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',6,1);}


           // Do not allow transfer to 0x0 or the token contract itself
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',158);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',23);
if ((_to == 0) || (_to == address(this))) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',24);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',7,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',7,1);}


           // If the amount being transfered is more than the balance of the
           //  account the transfer returns false
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',162);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',25);
var previousBalanceFrom = balanceOfAt(_from, getBlockNumber());
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',163);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',26);
if (previousBalanceFrom < _amount) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',8,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',164);
                __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',27);
return false;
           }else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',8,1);}


           // Alerts the token controller of the transfer
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',168);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',28);
if (isContract(controller)) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',9,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',169);
                __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',29);
if (!TokenController(controller).onTransfer(_from, _to, _amount))
               { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',30);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',10,0);__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',170);
throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',10,1);}

           }else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',9,1);}


           // First update the balance array with the new value for the address
           //  sending the tokens
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',175);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',31);
updateValueAtNow(balances[_from], previousBalanceFrom - _amount);

           // Then update the balance array with the new value for the address
           //  receiving the tokens
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',179);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',32);
var previousBalanceTo = balanceOfAt(_to, getBlockNumber());
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',33);
if (previousBalanceTo + _amount < previousBalanceTo) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',34);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',11,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',11,1);}
 // Check for overflow
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',181);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',35);
updateValueAtNow(balances[_to], previousBalanceTo + _amount);

           // An event to make the transfer easy to find on the blockchain
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',184);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',36);
Transfer(_from, _to, _amount);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',186);
            __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',37);
return true;
    }

    /// @param _owner The address that's balance is being requested
    /// @return The balance of `_owner` at the current block
    function balanceOf(address _owner) returns (uint256 balance) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',5);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',192);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',38);
return balanceOfAt(_owner, getBlockNumber());
    }

    /// @notice `msg.sender` approves `_spender` to spend `_amount` tokens on
    ///  its behalf. This is a modified version of the ERC20 approve function
    ///  to be a little bit safer
    /// @param _spender The address of the account able to transfer the tokens
    /// @param _amount The amount of tokens to be approved for transfer
    /// @return True if the approval was successful
    function approve(address _spender, uint256 _amount) returns (bool success) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',6);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',202);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',39);
if (!transfersEnabled) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',40);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',12,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',12,1);}


        // To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender,0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',208);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',41);
if ((_amount!=0) && (allowed[msg.sender][_spender] !=0)) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',42);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',13,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',13,1);}


        // Alerts the token controller of the approve function call
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',211);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',43);
if (isContract(controller)) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',14,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',212);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',44);
if (!TokenController(controller).onApprove(msg.sender, _spender, _amount))
                { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',45);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',15,0);__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',213);
throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',15,1);}

        }else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',14,1);}


__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',216);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',46);
allowed[msg.sender][_spender] = _amount;
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',217);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',47);
Approval(msg.sender, _spender, _amount);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',218);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',48);
return true;
    }

    /// @dev This function makes it easy to read the `allowed[]` map
    /// @param _owner The address of the account that owns the token
    /// @param _spender The address of the account able to transfer the tokens
    /// @return Amount of remaining tokens of _owner that _spender is allowed
    ///  to spend
    function allowance(address _owner, address _spender
    ) returns (uint256 remaining) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',7);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',228);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',49);
return allowed[_owner][_spender];
    }

    /// @notice `msg.sender` approves `_spender` to send `_amount` tokens on
    ///  its behalf, and then a function is triggered in the contract that is
    ///  being approved, `_spender`. This allows users to use their tokens to
    ///  interact with contracts in one function call instead of two
    /// @param _spender The address of the contract able to transfer the tokens
    /// @param _amount The amount of tokens to be approved for transfer
    /// @return True if the function call was successful
    function approveAndCall(address _spender, uint256 _amount, bytes _extraData
    ) returns (bool success) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',8);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',240);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',50);
if (!approve(_spender, _amount)) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',51);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',16,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',16,1);}


        // This portion is copied from ConsenSys's Standard Token Contract. It
        //  calls the receiveApproval function that is part of the contract that
        //  is being approved (`_spender`). The function should look like:
        //  `receiveApproval(address _from, uint256 _amount, address
        //  _tokenContract, bytes _extraData)` It is assumed that the call
        //  *should* succeed, otherwise the plain vanilla approve would be used
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',248);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',52);
ApproveAndCallReceiver(_spender).receiveApproval(
            msg.sender,
            _amount,
            this,
            _extraData
        );

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',255);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',53);
return true;
    }

    /// @dev This function makes it easy to get the total number of tokens
    /// @return The total number of tokens
    function totalSupply() returns (uint) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',9);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',261);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',54);
return totalSupplyAt(getBlockNumber());
    }


////////////////
// Query balance and totalSupply in History
////////////////

    /// @dev Queries the balance of `_owner` at a specific `_blockNumber`
    /// @param _owner The address from which the balance will be retrieved
    /// @param _blockNumber The block number when the balance is queried
    /// @return The balance at `_blockNumber`
    function balanceOfAt(address _owner, uint _blockNumber) returns (uint) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',10);


        // These next few lines are used when the balance of the token is
        //  requested before a check point was ever created for this token, it
        //  requires that the `parentToken.balanceOfAt` be queried at the
        //  genesis block for that token as this contains initial balance of
        //  this token
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',280);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',55);
if ((balances[_owner].length == 0)
            || (balances[_owner][0].fromBlock > _blockNumber)) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',17,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',282);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',56);
if (address(parentToken) != 0) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',18,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',283);
                 __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',57);
return parentToken.balanceOfAt(_owner, min(_blockNumber, parentSnapShotBlock));
            } else {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',18,1);
                // Has no parent
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',286);
                 __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',58);
return 0;
            }

        // This will return the expected balance during normal situations
        } else {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',17,1);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',291);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',59);
return getValueAt(balances[_owner], _blockNumber);
        }
    }

    /// @notice Total amount of tokens at a specific `_blockNumber`.
    /// @param _blockNumber The block number when the totalSupply is queried
    /// @return The total amount of tokens at `_blockNumber`
    function totalSupplyAt(uint _blockNumber) returns(uint) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',11);


        // These next few lines are used when the totalSupply of the token is
        //  requested before a check point was ever created for this token, it
        //  requires that the `parentToken.totalSupplyAt` be queried at the
        //  genesis block for this token as that contains totalSupply of this
        //  token at this block number.
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',305);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',60);
if ((totalSupplyHistory.length == 0)
            || (totalSupplyHistory[0].fromBlock > _blockNumber)) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',19,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',307);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',61);
if (address(parentToken) != 0) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',20,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',308);
                 __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',62);
return parentToken.totalSupplyAt(min(_blockNumber, parentSnapShotBlock));
            } else {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',20,1);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',310);
                 __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',63);
return 0;
            }

        // This will return the expected totalSupply during normal situations
        } else {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',19,1);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',315);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',64);
return getValueAt(totalSupplyHistory, _blockNumber);
        }
    }

////////////////
// Clone Token Method
////////////////

    /// @notice Creates a new clone token with the initial distribution being
    ///  this token at `_snapshotBlock`
    /// @param _cloneTokenName Name of the clone token
    /// @param _cloneDecimalUnits Number of decimals of the smallest unit
    /// @param _cloneTokenSymbol Symbol of the clone token
    /// @param _snapshotBlock Block when the distribution of the parent token is
    ///  copied to set the initial distribution of the new clone token;
    ///  if the block is zero than the actual block, the current block is used
    /// @param _transfersEnabled True if transfers are allowed in the clone
    /// @return The address of the new MiniMeToken Contract
    function createCloneToken(
        string _cloneTokenName,
        uint8 _cloneDecimalUnits,
        string _cloneTokenSymbol,
        uint _snapshotBlock,
        bool _transfersEnabled
        ) returns(address) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',12);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',340);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',65);
if (_snapshotBlock == 0) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',66);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',21,0);_snapshotBlock = getBlockNumber();}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',21,1);}

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',341);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',67);
MiniMeToken cloneToken = tokenFactory.createCloneToken(
            this,
            _snapshotBlock,
            _cloneTokenName,
            _cloneDecimalUnits,
            _cloneTokenSymbol,
            _transfersEnabled
            );

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',350);
        cloneToken.changeController(msg.sender);

        // An event to make the token easy to find on the blockchain
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',353);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',68);
NewCloneToken(address(cloneToken), _snapshotBlock);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',354);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',69);
return address(cloneToken);
    }

////////////////
// Generate and destroy tokens
////////////////

    /// @notice Generates `_amount` tokens that are assigned to `_owner`
    /// @param _owner The address that will be assigned the new tokens
    /// @param _amount The quantity of tokens generated
    /// @return True if the tokens are generated correctly
    function generateTokens(address _owner, uint _amount
    ) onlyController returns (bool) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',13);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',367);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',70);
uint curTotalSupply = getValueAt(totalSupplyHistory, getBlockNumber());
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',71);
if (curTotalSupply + _amount < curTotalSupply) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',72);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',22,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',22,1);}
 // Check for overflow
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',369);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',73);
updateValueAtNow(totalSupplyHistory, curTotalSupply + _amount);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',370);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',74);
var previousBalanceTo = balanceOf(_owner);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',75);
if (previousBalanceTo + _amount < previousBalanceTo) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',76);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',23,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',23,1);}
 // Check for overflow
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',372);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',77);
updateValueAtNow(balances[_owner], previousBalanceTo + _amount);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',373);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',78);
Transfer(0, _owner, _amount);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',374);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',79);
return true;
    }


    /// @notice Burns `_amount` tokens from `_owner`
    /// @param _owner The address that will lose the tokens
    /// @param _amount The quantity of tokens to burn
    /// @return True if the tokens are burned correctly
    function destroyTokens(address _owner, uint _amount
    ) onlyControllerOrBurner(_owner) returns (bool) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',14);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',384);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',80);
uint curTotalSupply = getValueAt(totalSupplyHistory, getBlockNumber());
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',385);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',81);
if (curTotalSupply < _amount) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',82);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',24,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',24,1);}

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',386);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',83);
updateValueAtNow(totalSupplyHistory, curTotalSupply - _amount);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',387);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',84);
var previousBalanceFrom = balanceOf(_owner);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',388);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',85);
if (previousBalanceFrom < _amount) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',86);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',25,0);throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',25,1);}

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',389);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',87);
updateValueAtNow(balances[_owner], previousBalanceFrom - _amount);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',390);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',88);
Transfer(_owner, 0, _amount);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',391);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',89);
return true;
    }

////////////////
// Enable tokens transfers
////////////////


    /// @notice Enables token holders to transfer their tokens freely if true
    /// @param _transfersEnabled True if transfers are allowed in the clone
    function enableTransfers(bool _transfersEnabled) onlyController {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',15);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',402);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',90);
transfersEnabled = _transfersEnabled;
    }

////////////////
// Internal helper functions to query and set a value in a snapshot array
////////////////

    /// @dev `getValueAt` retrieves the number of tokens at a given block number
    /// @param checkpoints The history of values being queried
    /// @param _block The block number to retrieve the value at
    /// @return The number of tokens being queried
    function getValueAt(Checkpoint[] storage checkpoints, uint _block
    ) internal returns (uint) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',16);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',415);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',91);
if (checkpoints.length == 0) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',92);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',26,0);return 0;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',26,1);}


        // Shortcut for the actual value
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',418);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',93);
if (_block >= checkpoints[checkpoints.length-1].fromBlock)
            { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',94);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',27,0);__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',419);
return checkpoints[checkpoints.length-1].value;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',27,1);}

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',420);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',95);
if (_block < checkpoints[0].fromBlock) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',96);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',28,0);return 0;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',28,1);}


        // Binary search of the value in the array
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',423);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',97);
uint min = 0;
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',424);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',98);
uint max = checkpoints.length-1;
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',425);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',99);
while (max > min) {
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',426);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',100);
uint mid = (max + min + 1)/ 2;
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',427);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',101);
if (checkpoints[mid].fromBlock<=_block) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',29,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',428);
                 __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',102);
min = mid;
            } else {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',29,1);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',430);
                 __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',103);
max = mid-1;
            }
        }
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',433);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',104);
return checkpoints[min].value;
    }

    /// @dev `updateValueAtNow` used to update the `balances` map and the
    ///  `totalSupplyHistory`
    /// @param checkpoints The history of data being updated
    /// @param _value The new number of tokens
    function updateValueAtNow(Checkpoint[] storage checkpoints, uint _value
    ) internal  {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',17);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',442);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',105);
if ((checkpoints.length == 0)
        || (checkpoints[checkpoints.length -1].fromBlock < getBlockNumber())) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',30,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',444);
                __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',106);
Checkpoint newCheckPoint = checkpoints[ checkpoints.length++ ];
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',445);
                __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',107);
newCheckPoint.fromBlock =  uint128(getBlockNumber());
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',446);
                __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',108);
newCheckPoint.value = uint128(_value);
           } else {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',30,1);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',448);
                __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',109);
Checkpoint oldCheckPoint = checkpoints[checkpoints.length-1];
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',449);
                __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',110);
oldCheckPoint.value = uint128(_value);
           }
    }

    /// @dev Internal function to determine if an address is a contract
    /// @param _addr The address being queried
    /// @return True if `_addr` is a contract
    function isContract(address _addr) internal returns(bool) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',18);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',457);
        uint size;
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',458);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',111);
if (_addr == 0) { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',112);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',31,0);return false;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',31,1);}

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',459);
        assembly {
            size := extcodesize(_addr)
        }
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',462);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',113);
return size>0;
    }

    /// @dev Helper function to return a min betwen the two uints
    function min(uint a, uint b) internal returns (uint) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',19);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',467);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',114);
return a < b ? a : b;
    }

    /// @notice The fallback function: If the contract's controller has not been
    ///  set to 0, then the `proxyPayment` method is called which relays the
    ///  ether and creates tokens as described in the token controller contract
    function ()  payable {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',20);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',474);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',115);
if (isContract(controller)) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',32,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',475);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',116);
if (! TokenController(controller).proxyPayment.value(msg.value)(msg.sender))
                { __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',117);
__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',33,0);__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',476);
throw;}else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',33,1);}

        } else {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',32,1);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',478);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',118);
throw;
        }
    }


//////////
// Testing specific methods
//////////

    /// @notice This function is overridden by the test Mocks.
    function getBlockNumber() internal returns (uint256) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',21);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',489);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',119);
return block.number;
    }

//////////
// Safety Methods
//////////

    /// @notice This method can be used by the controller to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address _token) onlyController {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',22);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',501);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',120);
if (_token == 0x0) {__BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',34,0);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',502);
            controller.transfer(this.balance);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',503);
             __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',121);
return;
        }else { __BranchCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',34,1);}


__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',506);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',122);
ERC20Token token = ERC20Token(_token);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',507);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',123);
uint balance = token.balanceOf(this);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',508);
        token.transfer(controller, balance);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',509);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',124);
ClaimedTokens(_token, controller, balance);
    }

////////////////
// Events
////////////////

    event ClaimedTokens(address indexed _token, address indexed _controller, uint _amount);
    event Transfer(address indexed _from, address indexed _to, uint256 _amount);
    event NewCloneToken(address indexed _cloneToken, uint _snapshotBlock);
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _amount
        );

}


////////////////
// MiniMeTokenFactory
////////////////

/// @dev This contract is used to generate clone contracts from a contract.
///  In solidity this is the way to create a contract from a contract of the
///  same class
contract MiniMeTokenFactory {event __CoverageMiniMeToken(string fileName, uint256 lineNumber);
event __FunctionCoverageMiniMeToken(string fileName, uint256 fnId);
event __StatementCoverageMiniMeToken(string fileName, uint256 statementId);
event __BranchCoverageMiniMeToken(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMiniMeToken(string fileName, uint256 branchId);
event __AssertPostCoverageMiniMeToken(string fileName, uint256 branchId);


    /// @notice Update the DApp by creating a new token with new functionalities
    ///  the msg.sender becomes the controller of this clone token
    /// @param _parentToken Address of the token being cloned
    /// @param _snapshotBlock Block of the parent token that will
    ///  determine the initial distribution of the clone token
    /// @param _tokenName Name of the new token
    /// @param _decimalUnits Number of decimals of the new token
    /// @param _tokenSymbol Token Symbol for the new token
    /// @param _transfersEnabled If true, tokens will be able to be transferred
    /// @return The address of the new token contract
    function createCloneToken(
        address _parentToken,
        uint _snapshotBlock,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        bool _transfersEnabled
    ) returns (MiniMeToken) {__FunctionCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',23);

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',555);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',125);
MiniMeToken newToken = new MiniMeToken(
            this,
            _parentToken,
            _snapshotBlock,
            _tokenName,
            _decimalUnits,
            _tokenSymbol,
            _transfersEnabled
            );

__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',565);
        newToken.changeController(msg.sender);
__CoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',566);
         __StatementCoverageMiniMeToken('/home/tknff/projects/Mothership-contracts-master/contracts/MiniMeToken.sol',126);
return newToken;
    }
}
