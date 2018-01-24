pragma solidity ^0.4.11;

// File: contracts/interface/ApproveAndCallReceiver.sol

/*
  Copyright 2017, Jordi Baylina (Giveth)

  Original contract from https://github.com/aragon/aragon-network-token/blob/master/contracts/interface/ApproveAndCallReceiver.sol
*/

contract ApproveAndCallReceiver {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);

  function receiveApproval(address _from, uint256 _amount, address _token, bytes _data);
}

// File: contracts/interface/ERC20Token.sol

/*
  Abstract contract for the full ERC 20 Token standard
  https://github.com/ethereum/EIPs/issues/20

  Copyright 2017, Jordi Baylina (Giveth)

  Original contract from https://github.com/status-im/status-network-token/blob/master/contracts/ERC20Token.sol
*/

contract ERC20Token {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);

  /* This is a slight change to the ERC20 base standard.
     function totalSupply() constant returns (uint256 supply);
     is replaced with:
     uint256 public totalSupply;
     This automatically creates a getter function for the totalSupply.
     This is moved to the base contract since public getter functions are not
     currently recognised as an implementation of the matching abstract
     function by the compiler.
  */
  /// total amount of tokens
  function totalSupply() returns (uint256 balance);

  /// @param _owner The address from which the balance will be retrieved
  /// @return The balance
  function balanceOf(address _owner) returns (uint256 balance);

  /// @notice send `_value` token to `_to` from `msg.sender`
  /// @param _to The address of the recipient
  /// @param _value The amount of token to be transferred
  /// @return Whether the transfer was successful or not
  function transfer(address _to, uint256 _value) returns (bool success);

  /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
  /// @param _from The address of the sender
  /// @param _to The address of the recipient
  /// @param _value The amount of token to be transferred
  /// @return Whether the transfer was successful or not
  function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

  /// @notice `msg.sender` approves `_spender` to spend `_value` tokens
  /// @param _spender The address of the account able to transfer the tokens
  /// @param _value The amount of tokens to be approved for transfer
  /// @return Whether the approval was successful or not
  function approve(address _spender, uint256 _value) returns (bool success);

  /// @param _owner The address of the account owning tokens
  /// @param _spender The address of the account able to transfer the tokens
  /// @return Amount of remaining tokens allowed to spent
  function allowance(address _owner, address _spender) returns (uint256 remaining);

  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

// File: contracts/interface/Controlled.sol

/*
  Copyright 2017, Jorge Izquierdo (Aragon Foundation)
  Copyright 2017, Jordi Baylina (Giveth)

  Based on MiniMeToken.sol from https://github.com/Giveth/minime
  Original contract from https://github.com/aragon/aragon-network-token/blob/master/contracts/interface/Controlled.sol
*/

contract Controlled {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);

  /// @notice The address of the controller is the only address that can call
  ///  a function with this modifier
  modifier onlyController {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',1);
  __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',1);
if (msg.sender != controller) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',2);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',1,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',1,1);}
 _; }

  address public controller;

  function Controlled() {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',2);
  __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',3);
controller = msg.sender;}

  /// @notice Changes the controller of the contract
  /// @param _newController The new controller of the contract
  function changeController(address _newController) onlyController {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',3);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',93);
     __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',4);
controller = _newController;
  }
}

// File: contracts/interface/Burnable.sol

/*
  Copyright 2017, Jorge Izquierdo (Aragon Foundation)
  Copyright 2017, Jordi Baylina (Giveth)

  Based on MiniMeToken.sol from https://github.com/Giveth/minime
  Original contract from https://github.com/aragon/aragon-network-token/blob/master/contracts/interface/Controlled.sol
*/



contract Burnable is Controlled {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);

  /// @notice The address of the controller is the only address that can call
  ///  a function with this modifier, also the burner can call but also the
  /// target of the function must be the burner
  modifier onlyControllerOrBurner(address target) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',4);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',114);
    __AssertPreCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',2);
 __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',5);
assert(msg.sender == controller || (msg.sender == burner && msg.sender == target));__AssertPostCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',2);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',115);
    _;
  }

  modifier onlyBurner {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',5);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',119);
    __AssertPreCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',3);
 __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',6);
assert(msg.sender == burner);__AssertPostCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',3);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',120);
    _;
  }
  address public burner;

  function Burnable() {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',6);
  __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',7);
burner = msg.sender;}

  /// @notice Changes the burner of the contract
  /// @param _newBurner The new burner of the contract
  function changeBurner(address _newBurner) onlyBurner {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',7);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',129);
     __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',8);
burner = _newBurner;
  }
}

// File: contracts/interface/MiniMeTokenI.sol

contract MiniMeTokenI is ERC20Token, Burnable {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);


      string public name;                //The Token's name: e.g. DigixDAO Tokens
      uint8 public decimals;             //Number of decimals of the smallest unit
      string public symbol;              //An identifier: e.g. REP
      string public version = 'MMT_0.1'; //An arbitrary versioning scheme

///////////////////
// ERC20 Methods
///////////////////


    /// @notice `msg.sender` approves `_spender` to send `_amount` tokens on
    ///  its behalf, and then a function is triggered in the contract that is
    ///  being approved, `_spender`. This allows users to use their tokens to
    ///  interact with contracts in one function call instead of two
    /// @param _spender The address of the contract able to transfer the tokens
    /// @param _amount The amount of tokens to be approved for transfer
    /// @return True if the function call was successful
    function approveAndCall(
        address _spender,
        uint256 _amount,
        bytes _extraData
    ) returns (bool success);

////////////////
// Query balance and totalSupply in History
////////////////

    /// @dev Queries the balance of `_owner` at a specific `_blockNumber`
    /// @param _owner The address from which the balance will be retrieved
    /// @param _blockNumber The block number when the balance is queried
    /// @return The balance at `_blockNumber`
    function balanceOfAt(
        address _owner,
        uint _blockNumber
    ) returns (uint);

    /// @notice Total amount of tokens at a specific `_blockNumber`.
    /// @param _blockNumber The block number when the totalSupply is queried
    /// @return The total amount of tokens at `_blockNumber`
    function totalSupplyAt(uint _blockNumber) returns(uint);

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
    ) returns(address);

////////////////
// Generate and destroy tokens
////////////////

    /// @notice Generates `_amount` tokens that are assigned to `_owner`
    /// @param _owner The address that will be assigned the new tokens
    /// @param _amount The quantity of tokens generated
    /// @return True if the tokens are generated correctly
    function generateTokens(address _owner, uint _amount) returns (bool);


    /// @notice Burns `_amount` tokens from `_owner`
    /// @param _owner The address that will lose the tokens
    /// @param _amount The quantity of tokens to burn
    /// @return True if the tokens are burned correctly
    function destroyTokens(address _owner, uint _amount) returns (bool);

////////////////
// Enable tokens transfers
////////////////

    /// @notice Enables token holders to transfer their tokens freely if true
    /// @param _transfersEnabled True if transfers are allowed in the clone
    function enableTransfers(bool _transfersEnabled);

//////////
// Safety Methods
//////////

    /// @notice This method can be used by the controller to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address _token);

////////////////
// Events
////////////////

    event ClaimedTokens(address indexed _token, address indexed _controller, uint _amount);
    event NewCloneToken(address indexed _cloneToken, uint _snapshotBlock);
}

// File: contracts/interface/TokenController.sol

/*
  Copyright 2017, Jorge Izquierdo (Aragon Foundation)
  Copyright 2017, Jordi Baylina (Giveth)

  Based on MiniMeToken.sol from https://github.com/Giveth/minime
  Original contract from https://github.com/aragon/aragon-network-token/blob/master/contracts/interface/Controller.sol
*/

/// @dev The token controller contract must implement these functions
contract TokenController {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);

  /// @notice Called when `_owner` sends ether to the MiniMe Token contract
  /// @param _owner The address that sent the ether to create tokens
  /// @return True if the ether is accepted, false if it throws
  function proxyPayment(address _owner) payable returns(bool);

  /// @notice Notifies the controller about a token transfer allowing the
  ///  controller to react if desired
  /// @param _from The origin of the transfer
  /// @param _to The destination of the transfer
  /// @param _amount The amount of the transfer
  /// @return False if the controller does not authorize the transfer
  function onTransfer(address _from, address _to, uint _amount) returns(bool);

  /// @notice Notifies the controller about an approval allowing the
  ///  controller to react if desired
  /// @param _owner The address that calls `approve()`
  /// @param _spender The spender in the `approve()` call
  /// @param _amount The amount in the `approve()` call
  /// @return False if the controller does not authorize the approval
  function onApprove(address _owner, address _spender, uint _amount)
    returns(bool);
}

// File: contracts/MiniMeToken.sol

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
contract MiniMeToken is MiniMeTokenI {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);


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
    ) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',8);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',367);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',9);
tokenFactory = MiniMeTokenFactory(_tokenFactory);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',10);
name = _tokenName;                                 // Set the name
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',11);
decimals = _decimalUnits;                          // Set the decimals
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',12);
symbol = _tokenSymbol;                             // Set the symbol
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',371);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',13);
parentToken = MiniMeToken(_parentToken);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',372);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',14);
parentSnapShotBlock = _parentSnapShotBlock;
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',373);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',15);
transfersEnabled = _transfersEnabled;
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',374);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',16);
creationBlock = getBlockNumber();
    }


///////////////////
// ERC20 Methods
///////////////////

    /// @notice Send `_amount` tokens to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return Whether the transfer was successful or not
    function transfer(address _to, uint256 _amount) returns (bool success) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',9);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',387);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',17);
if (!transfersEnabled) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',18);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',4,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',4,1);}

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',388);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',19);
return doTransfer(msg.sender, _to, _amount);
    }

    /// @notice Send `_amount` tokens to `_to` from `_from` on the condition it
    ///  is approved by `_from`
    /// @param _from The address holding the tokens being transferred
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return True if the transfer was successful
    function transferFrom(address _from, address _to, uint256 _amount
    ) returns (bool success) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',10);


        // The controller of this contract can move tokens around at will,

        //  controller of this contract, which in most situations should be
        //  another open source smart contract or 0x0
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',404);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',20);
if (msg.sender != controller) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',5,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',405);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',21);
if (!transfersEnabled) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',22);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',6,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',6,1);}


            // The standard ERC 20 transferFrom functionality
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',408);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',23);
if (allowed[_from][msg.sender] < _amount) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',24);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',7,0);return false;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',7,1);}

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',409);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',25);
allowed[_from][msg.sender] -= _amount;
        }else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',5,1);}

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',411);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',26);
return doTransfer(_from, _to, _amount);
    }

    /// @dev This is the actual transfer function in the token contract, it can
    ///  only be called by other functions in this contract.
    /// @param _from The address holding the tokens being transferred
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return True if the transfer was successful
    function doTransfer(address _from, address _to, uint _amount
    ) internal returns(bool) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',11);


__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',423);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',27);
if (_amount == 0) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',8,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',424);
                __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',28);
return true;
           }else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',8,1);}


__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',427);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',29);
if (parentSnapShotBlock >= getBlockNumber()) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',30);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',9,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',9,1);}


           // Do not allow transfer to 0x0 or the token contract itself
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',430);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',31);
if ((_to == 0) || (_to == address(this))) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',32);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',10,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',10,1);}


           // If the amount being transfered is more than the balance of the
           //  account the transfer returns false
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',434);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',33);
var previousBalanceFrom = balanceOfAt(_from, getBlockNumber());
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',435);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',34);
if (previousBalanceFrom < _amount) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',11,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',436);
                __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',35);
return false;
           }else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',11,1);}


           // Alerts the token controller of the transfer
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',440);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',36);
if (isContract(controller)) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',12,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',441);
                __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',37);
if (!TokenController(controller).onTransfer(_from, _to, _amount))
               { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',38);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',13,0);__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',442);
throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',13,1);}

           }else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',12,1);}


           // First update the balance array with the new value for the address
           //  sending the tokens
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',447);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',39);
updateValueAtNow(balances[_from], previousBalanceFrom - _amount);

           // Then update the balance array with the new value for the address
           //  receiving the tokens
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',451);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',40);
var previousBalanceTo = balanceOfAt(_to, getBlockNumber());
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',41);
if (previousBalanceTo + _amount < previousBalanceTo) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',42);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',14,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',14,1);}
 // Check for overflow
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',453);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',43);
updateValueAtNow(balances[_to], previousBalanceTo + _amount);

           // An event to make the transfer easy to find on the blockchain
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',456);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',44);
Transfer(_from, _to, _amount);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',458);
            __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',45);
return true;
    }

    /// @param _owner The address that's balance is being requested
    /// @return The balance of `_owner` at the current block
    function balanceOf(address _owner) returns (uint256 balance) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',12);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',464);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',46);
return balanceOfAt(_owner, getBlockNumber());
    }

    /// @notice `msg.sender` approves `_spender` to spend `_amount` tokens on
    ///  its behalf. This is a modified version of the ERC20 approve function
    ///  to be a little bit safer
    /// @param _spender The address of the account able to transfer the tokens
    /// @param _amount The amount of tokens to be approved for transfer
    /// @return True if the approval was successful
    function approve(address _spender, uint256 _amount) returns (bool success) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',13);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',474);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',47);
if (!transfersEnabled) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',48);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',15,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',15,1);}


        // To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender,0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',480);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',49);
if ((_amount!=0) && (allowed[msg.sender][_spender] !=0)) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',50);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',16,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',16,1);}


        // Alerts the token controller of the approve function call
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',483);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',51);
if (isContract(controller)) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',17,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',484);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',52);
if (!TokenController(controller).onApprove(msg.sender, _spender, _amount))
                { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',53);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',18,0);__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',485);
throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',18,1);}

        }else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',17,1);}


__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',488);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',54);
allowed[msg.sender][_spender] = _amount;
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',489);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',55);
Approval(msg.sender, _spender, _amount);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',490);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',56);
return true;
    }

    /// @dev This function makes it easy to read the `allowed[]` map
    /// @param _owner The address of the account that owns the token
    /// @param _spender The address of the account able to transfer the tokens
    /// @return Amount of remaining tokens of _owner that _spender is allowed
    ///  to spend
    function allowance(address _owner, address _spender
    ) returns (uint256 remaining) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',14);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',500);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',57);
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
    ) returns (bool success) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',15);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',512);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',58);
if (!approve(_spender, _amount)) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',59);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',19,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',19,1);}


        // This portion is copied from ConsenSys's Standard Token Contract. It
        //  calls the receiveApproval function that is part of the contract that
        //  is being approved (`_spender`). The function should look like:
        //  `receiveApproval(address _from, uint256 _amount, address
        //  _tokenContract, bytes _extraData)` It is assumed that the call
        //  *should* succeed, otherwise the plain vanilla approve would be used
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',520);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',60);
ApproveAndCallReceiver(_spender).receiveApproval(
            msg.sender,
            _amount,
            this,
            _extraData
        );

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',527);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',61);
return true;
    }

    /// @dev This function makes it easy to get the total number of tokens
    /// @return The total number of tokens
    function totalSupply() returns (uint) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',16);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',533);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',62);
return totalSupplyAt(getBlockNumber());
    }


////////////////
// Query balance and totalSupply in History
////////////////

    /// @dev Queries the balance of `_owner` at a specific `_blockNumber`
    /// @param _owner The address from which the balance will be retrieved
    /// @param _blockNumber The block number when the balance is queried
    /// @return The balance at `_blockNumber`
    function balanceOfAt(address _owner, uint _blockNumber) returns (uint) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',17);


        // These next few lines are used when the balance of the token is
        //  requested before a check point was ever created for this token, it
        //  requires that the `parentToken.balanceOfAt` be queried at the
        //  genesis block for that token as this contains initial balance of
        //  this token
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',552);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',63);
if ((balances[_owner].length == 0)
            || (balances[_owner][0].fromBlock > _blockNumber)) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',20,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',554);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',64);
if (address(parentToken) != 0) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',21,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',555);
                 __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',65);
return parentToken.balanceOfAt(_owner, min(_blockNumber, parentSnapShotBlock));
            } else {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',21,1);
                // Has no parent
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',558);
                 __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',66);
return 0;
            }

        // This will return the expected balance during normal situations
        } else {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',20,1);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',563);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',67);
return getValueAt(balances[_owner], _blockNumber);
        }
    }

    /// @notice Total amount of tokens at a specific `_blockNumber`.
    /// @param _blockNumber The block number when the totalSupply is queried
    /// @return The total amount of tokens at `_blockNumber`
    function totalSupplyAt(uint _blockNumber) returns(uint) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',18);


        // These next few lines are used when the totalSupply of the token is
        //  requested before a check point was ever created for this token, it
        //  requires that the `parentToken.totalSupplyAt` be queried at the
        //  genesis block for this token as that contains totalSupply of this
        //  token at this block number.
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',577);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',68);
if ((totalSupplyHistory.length == 0)
            || (totalSupplyHistory[0].fromBlock > _blockNumber)) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',22,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',579);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',69);
if (address(parentToken) != 0) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',23,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',580);
                 __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',70);
return parentToken.totalSupplyAt(min(_blockNumber, parentSnapShotBlock));
            } else {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',23,1);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',582);
                 __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',71);
return 0;
            }

        // This will return the expected totalSupply during normal situations
        } else {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',22,1);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',587);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',72);
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
        ) returns(address) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',19);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',612);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',73);
if (_snapshotBlock == 0) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',74);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',24,0);_snapshotBlock = getBlockNumber();}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',24,1);}

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',613);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',75);
MiniMeToken cloneToken = tokenFactory.createCloneToken(
            this,
            _snapshotBlock,
            _cloneTokenName,
            _cloneDecimalUnits,
            _cloneTokenSymbol,
            _transfersEnabled
            );

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',622);
        cloneToken.changeController(msg.sender);

        // An event to make the token easy to find on the blockchain
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',625);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',76);
NewCloneToken(address(cloneToken), _snapshotBlock);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',626);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',77);
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
    ) onlyController returns (bool) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',20);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',639);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',78);
uint curTotalSupply = getValueAt(totalSupplyHistory, getBlockNumber());
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',79);
if (curTotalSupply + _amount < curTotalSupply) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',80);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',25,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',25,1);}
 // Check for overflow
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',641);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',81);
updateValueAtNow(totalSupplyHistory, curTotalSupply + _amount);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',642);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',82);
var previousBalanceTo = balanceOf(_owner);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',83);
if (previousBalanceTo + _amount < previousBalanceTo) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',84);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',26,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',26,1);}
 // Check for overflow
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',644);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',85);
updateValueAtNow(balances[_owner], previousBalanceTo + _amount);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',645);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',86);
Transfer(0, _owner, _amount);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',646);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',87);
return true;
    }


    /// @notice Burns `_amount` tokens from `_owner`
    /// @param _owner The address that will lose the tokens
    /// @param _amount The quantity of tokens to burn
    /// @return True if the tokens are burned correctly
    function destroyTokens(address _owner, uint _amount
    ) onlyControllerOrBurner(_owner) returns (bool) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',21);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',656);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',88);
uint curTotalSupply = getValueAt(totalSupplyHistory, getBlockNumber());
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',657);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',89);
if (curTotalSupply < _amount) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',90);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',27,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',27,1);}

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',658);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',91);
updateValueAtNow(totalSupplyHistory, curTotalSupply - _amount);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',659);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',92);
var previousBalanceFrom = balanceOf(_owner);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',660);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',93);
if (previousBalanceFrom < _amount) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',94);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',28,0);throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',28,1);}

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',661);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',95);
updateValueAtNow(balances[_owner], previousBalanceFrom - _amount);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',662);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',96);
Transfer(_owner, 0, _amount);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',663);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',97);
return true;
    }

////////////////
// Enable tokens transfers
////////////////


    /// @notice Enables token holders to transfer their tokens freely if true
    /// @param _transfersEnabled True if transfers are allowed in the clone
    function enableTransfers(bool _transfersEnabled) onlyController {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',22);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',674);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',98);
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
    ) internal returns (uint) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',23);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',687);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',99);
if (checkpoints.length == 0) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',100);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',29,0);return 0;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',29,1);}


        // Shortcut for the actual value
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',690);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',101);
if (_block >= checkpoints[checkpoints.length-1].fromBlock)
            { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',102);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',30,0);__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',691);
return checkpoints[checkpoints.length-1].value;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',30,1);}

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',692);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',103);
if (_block < checkpoints[0].fromBlock) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',104);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',31,0);return 0;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',31,1);}


        // Binary search of the value in the array
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',695);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',105);
uint min = 0;
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',696);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',106);
uint max = checkpoints.length-1;
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',697);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',107);
while (max > min) {
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',698);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',108);
uint mid = (max + min + 1)/ 2;
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',699);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',109);
if (checkpoints[mid].fromBlock<=_block) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',32,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',700);
                 __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',110);
min = mid;
            } else {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',32,1);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',702);
                 __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',111);
max = mid-1;
            }
        }
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',705);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',112);
return checkpoints[min].value;
    }

    /// @dev `updateValueAtNow` used to update the `balances` map and the
    ///  `totalSupplyHistory`
    /// @param checkpoints The history of data being updated
    /// @param _value The new number of tokens
    function updateValueAtNow(Checkpoint[] storage checkpoints, uint _value
    ) internal  {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',24);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',714);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',113);
if ((checkpoints.length == 0)
        || (checkpoints[checkpoints.length -1].fromBlock < getBlockNumber())) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',33,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',716);
                __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',114);
Checkpoint newCheckPoint = checkpoints[ checkpoints.length++ ];
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',717);
                __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',115);
newCheckPoint.fromBlock =  uint128(getBlockNumber());
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',718);
                __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',116);
newCheckPoint.value = uint128(_value);
           } else {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',33,1);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',720);
                __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',117);
Checkpoint oldCheckPoint = checkpoints[checkpoints.length-1];
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',721);
                __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',118);
oldCheckPoint.value = uint128(_value);
           }
    }

    /// @dev Internal function to determine if an address is a contract
    /// @param _addr The address being queried
    /// @return True if `_addr` is a contract
    function isContract(address _addr) internal returns(bool) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',25);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',729);
        uint size;
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',730);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',119);
if (_addr == 0) { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',120);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',34,0);return false;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',34,1);}

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',731);
        assembly {
            size := extcodesize(_addr)
        }
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',734);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',121);
return size>0;
    }

    /// @dev Helper function to return a min betwen the two uints
    function min(uint a, uint b) internal returns (uint) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',26);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',739);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',122);
return a < b ? a : b;
    }

    /// @notice The fallback function: If the contract's controller has not been
    ///  set to 0, then the `proxyPayment` method is called which relays the
    ///  ether and creates tokens as described in the token controller contract
    function ()  payable {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',27);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',746);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',123);
if (isContract(controller)) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',35,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',747);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',124);
if (! TokenController(controller).proxyPayment.value(msg.value)(msg.sender))
                { __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',125);
__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',36,0);__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',748);
throw;}else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',36,1);}

        } else {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',35,1);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',750);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',126);
throw;
        }
    }


//////////
// Testing specific methods
//////////

    /// @notice This function is overridden by the test Mocks.
    function getBlockNumber() internal returns (uint256) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',28);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',761);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',127);
return block.number;
    }

//////////
// Safety Methods
//////////

    /// @notice This method can be used by the controller to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address _token) onlyController {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',29);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',773);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',128);
if (_token == 0x0) {__BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',37,0);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',774);
            controller.transfer(this.balance);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',775);
             __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',129);
return;
        }else { __BranchCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',37,1);}


__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',778);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',130);
ERC20Token token = ERC20Token(_token);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',779);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',131);
uint balance = token.balanceOf(this);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',780);
        token.transfer(controller, balance);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',781);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',132);
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
contract MiniMeTokenFactory {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);


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
    ) returns (MiniMeToken) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',30);

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',827);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',133);
MiniMeToken newToken = new MiniMeToken(
            this,
            _parentToken,
            _snapshotBlock,
            _tokenName,
            _decimalUnits,
            _tokenSymbol,
            _transfersEnabled
            );

__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',837);
        newToken.changeController(msg.sender);
__CoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',838);
         __StatementCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',134);
return newToken;
    }
}

// File: contracts/MSP.sol

/*
  Copyright 2017, Anton Egorov (Mothership Foundation)
*/

contract MSP is MiniMeToken {event __CoverageApproveAndCallReceiver(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallReceiver(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallReceiver(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallReceiver(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallReceiver(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallReceiver(string fileName, uint256 branchId);


  function MSP(address _tokenFactory)
    MiniMeToken(
                _tokenFactory,
                0x0,                // no parent token
                0,                  // no snapshot block number from parent
                "Mothership Token", // Token name
                18,                 // Decimals
                "MSP",              // Symbol
                false               // Enable transfers
                ) {__FunctionCoverageApproveAndCallReceiver('/Users/tikonoff/projects/mothership/contracts/flattened/mspFlattened.sol',31);
}
}
