pragma solidity ^0.4.11;


/// @title Multisignature wallet - Allows multiple parties to agree on transactions before execution.
/// @author Stefan George - <stefan.george@consensys.net>
contract MultiSigWallet {event __CoverageMultiSigWallet(string fileName, uint256 lineNumber);
event __FunctionCoverageMultiSigWallet(string fileName, uint256 fnId);
event __StatementCoverageMultiSigWallet(string fileName, uint256 statementId);
event __BranchCoverageMultiSigWallet(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMultiSigWallet(string fileName, uint256 branchId);
event __AssertPostCoverageMultiSigWallet(string fileName, uint256 branchId);


    uint constant public MAX_OWNER_COUNT = 50;

    event Confirmation(address indexed _sender, uint indexed _transactionId);
    event Revocation(address indexed _sender, uint indexed _transactionId);
    event Submission(uint indexed _transactionId);
    event Execution(uint indexed _transactionId);
    event ExecutionFailure(uint indexed _transactionId);
    event Deposit(address indexed _sender, uint _value);
    event OwnerAddition(address indexed _owner);
    event OwnerRemoval(address indexed _owner);
    event RequirementChange(uint _required);

    mapping (uint => Transaction) public transactions;
    mapping (uint => mapping (address => bool)) public confirmations;
    mapping (address => bool) public isOwner;
    address[] public owners;
    uint public required;
    uint public transactionCount;

    struct Transaction {
        address destination;
        uint value;
        bytes data;
        bool executed;
    }

    modifier onlyWallet() {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',1);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',35);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',1);
if (msg.sender != address(this))
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',2);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',1,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',36);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',1,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',37);
        _;
    }

    modifier ownerDoesNotExist(address owner) {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',2);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',41);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',3);
if (isOwner[owner])
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',4);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',2,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',42);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',2,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',43);
        _;
    }

    modifier ownerExists(address owner) {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',3);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',47);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',5);
if (!isOwner[owner])
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',6);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',3,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',48);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',3,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',49);
        _;
    }

    modifier transactionExists(uint transactionId) {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',4);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',53);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',7);
if (transactions[transactionId].destination == 0)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',8);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',4,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',54);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',4,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',55);
        _;
    }

    modifier confirmed(uint transactionId, address owner) {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',5);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',59);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',9);
if (!confirmations[transactionId][owner])
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',10);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',5,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',60);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',5,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',61);
        _;
    }

    modifier notConfirmed(uint transactionId, address owner) {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',6);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',65);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',11);
if (confirmations[transactionId][owner])
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',12);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',6,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',66);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',6,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',67);
        _;
    }

    modifier notExecuted(uint transactionId) {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',7);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',71);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',13);
if (transactions[transactionId].executed)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',14);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',7,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',72);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',7,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',73);
        _;
    }

    modifier notNull(address _address) {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',8);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',77);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',15);
if (_address == 0)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',16);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',8,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',78);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',8,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',79);
        _;
    }

    modifier validRequirement(uint ownerCount, uint _required) {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',9);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',83);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',17);
if (   ownerCount > MAX_OWNER_COUNT
            || _required > ownerCount
            || _required == 0
            || ownerCount == 0)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',18);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',9,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',87);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',9,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',88);
        _;
    }

    /// @dev Fallback function allows to deposit ether.
    function()
        payable
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',10);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',95);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',19);
if (msg.value > 0)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',20);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',10,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',96);
Deposit(msg.sender, msg.value);}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',10,1);}

    }

    /*
     * Public functions
     */
    /// @dev Contract constructor sets initial owners and required number of confirmations.
    /// @param _owners List of initial owners.
    /// @param _required Number of required confirmations.
    function MultiSigWallet(address[] _owners, uint _required)
        public
        validRequirement(_owners.length, _required)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',11);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',109);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',21);
for (uint i=0; i<_owners.length; i++) {
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',110);
             __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',22);
if (isOwner[_owners[i]] || _owners[i] == 0)
                { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',23);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',11,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',111);
throw;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',11,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',112);
             __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',24);
isOwner[_owners[i]] = true;
        }
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',114);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',25);
owners = _owners;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',115);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',26);
required = _required;
    }

    /// @dev Allows to add a new owner. Transaction has to be sent by wallet.
    /// @param owner Address of new owner.
    function addOwner(address owner)
        public
        onlyWallet
        ownerDoesNotExist(owner)
        notNull(owner)
        validRequirement(owners.length + 1, required)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',12);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',127);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',27);
isOwner[owner] = true;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',128);
        owners.push(owner);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',129);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',28);
OwnerAddition(owner);
    }

    /// @dev Allows to remove an owner. Transaction has to be sent by wallet.
    /// @param owner Address of owner.
    function removeOwner(address owner)
        public
        onlyWallet
        ownerExists(owner)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',13);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',139);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',29);
isOwner[owner] = false;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',140);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',30);
for (uint i=0; i<owners.length - 1; i++)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',31);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',141);
if (owners[i] == owner) {__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',12,0);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',142);
                 __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',32);
owners[i] = owners[owners.length - 1];
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',143);
                break;
            }else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',12,1);}
}
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',145);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',33);
owners.length -= 1;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',146);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',34);
if (required > owners.length)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',35);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',13,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',147);
changeRequirement(owners.length);}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',13,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',148);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',36);
OwnerRemoval(owner);
    }

    /// @dev Allows to replace an owner with a new owner. Transaction has to be sent by wallet.
    /// @param owner Address of owner to be replaced.
    /// @param owner Address of new owner.
    function replaceOwner(address owner, address newOwner)
        public
        onlyWallet
        ownerExists(owner)
        ownerDoesNotExist(newOwner)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',14);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',160);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',37);
for (uint i=0; i<owners.length; i++)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',38);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',161);
if (owners[i] == owner) {__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',14,0);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',162);
                 __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',39);
owners[i] = newOwner;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',163);
                break;
            }else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',14,1);}
}
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',165);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',40);
isOwner[owner] = false;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',166);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',41);
isOwner[newOwner] = true;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',167);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',42);
OwnerRemoval(owner);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',168);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',43);
OwnerAddition(newOwner);
    }

    /// @dev Allows to change the number of required confirmations. Transaction has to be sent by wallet.
    /// @param _required Number of required confirmations.
    function changeRequirement(uint _required)
        public
        onlyWallet
        validRequirement(owners.length, _required)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',15);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',178);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',44);
required = _required;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',179);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',45);
RequirementChange(_required);
    }

    /// @dev Allows an owner to submit and confirm a transaction.
    /// @param destination Transaction target address.
    /// @param value Transaction ether value.
    /// @param data Transaction data payload.
    /// @return Returns transaction ID.
    function submitTransaction(address destination, uint value, bytes data)
        public
        returns (uint transactionId)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',16);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',191);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',46);
transactionId = addTransaction(destination, value, data);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',192);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',47);
confirmTransaction(transactionId);
    }

    /// @dev Allows an owner to confirm a transaction.
    /// @param transactionId Transaction ID.
    function confirmTransaction(uint transactionId)
        public
        ownerExists(msg.sender)
        transactionExists(transactionId)
        notConfirmed(transactionId, msg.sender)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',17);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',203);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',48);
confirmations[transactionId][msg.sender] = true;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',204);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',49);
Confirmation(msg.sender, transactionId);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',205);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',50);
executeTransaction(transactionId);
    }

    /// @dev Allows an owner to revoke a confirmation for a transaction.
    /// @param transactionId Transaction ID.
    function revokeConfirmation(uint transactionId)
        public
        ownerExists(msg.sender)
        confirmed(transactionId, msg.sender)
        notExecuted(transactionId)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',18);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',216);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',51);
confirmations[transactionId][msg.sender] = false;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',217);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',52);
Revocation(msg.sender, transactionId);
    }

    /// @dev Allows anyone to execute a confirmed transaction.
    /// @param transactionId Transaction ID.
    function executeTransaction(uint transactionId)
        public
        notExecuted(transactionId)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',19);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',226);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',53);
if (isConfirmed(transactionId)) {__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',15,0);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',227);
             __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',54);
Transaction tx = transactions[transactionId];
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',228);
             __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',55);
tx.executed = true;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',229);
             __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',56);
if (tx.destination.call.value(tx.value)(tx.data))
                { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',57);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',16,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',230);
Execution(transactionId);}
            else {__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',16,1);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',232);
                 __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',58);
ExecutionFailure(transactionId);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',233);
                 __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',59);
tx.executed = false;
            }
        }else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',15,1);}

    }

    /// @dev Returns the confirmation status of a transaction.
    /// @param transactionId Transaction ID.
    /// @return Confirmation status.
    function isConfirmed(uint transactionId)
        public
        returns (bool)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',20);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',245);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',60);
uint count = 0;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',246);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',61);
for (uint i=0; i<owners.length; i++) {
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',247);
             __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',62);
if (confirmations[transactionId][owners[i]])
                { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',63);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',17,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',248);
count += 1;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',17,1);}

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',249);
             __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',64);
if (count == required)
                { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',65);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',18,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',250);
return true;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',18,1);}

        }
    }

    /*
     * Internal functions
     */
    /// @dev Adds a new transaction to the transaction mapping, if transaction does not exist yet.
    /// @param destination Transaction target address.
    /// @param value Transaction ether value.
    /// @param data Transaction data payload.
    /// @return Returns transaction ID.
    function addTransaction(address destination, uint value, bytes data)
        internal
        notNull(destination)
        returns (uint transactionId)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',21);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',267);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',66);
transactionId = transactionCount;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',268);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',67);
transactions[transactionId] = Transaction({
            destination: destination,
            value: value,
            data: data,
            executed: false
        });
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',274);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',68);
transactionCount += 1;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',275);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',69);
Submission(transactionId);
    }

    /*
     * Web3 call functions
     */
    /// @dev Returns number of confirmations of a transaction.
    /// @param transactionId Transaction ID.
    /// @return Number of confirmations.
    function getConfirmationCount(uint transactionId)
        public
        returns (uint count)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',22);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',288);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',70);
for (uint i=0; i<owners.length; i++)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',71);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',289);
if (confirmations[transactionId][owners[i]])
                { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',72);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',19,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',290);
count += 1;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',19,1);}
}
    }

    /// @dev Returns total number of transactions after filters are applied.
    /// @param pending Include pending transactions.
    /// @param executed Include executed transactions.
    /// @return Total number of transactions after filters are applied.
    function getTransactionCount(bool pending, bool executed)
        public
        returns (uint count)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',23);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',301);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',73);
for (uint i=0; i<transactionCount; i++)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',74);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',302);
if (   pending && !transactions[i].executed
                || executed && transactions[i].executed)
                { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',75);
__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',20,0);__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',304);
count += 1;}else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',20,1);}
}
    }

    /// @dev Returns list of owners.
    /// @return List of owner addresses.
    function getOwners()
        public
        returns (address[])
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',24);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',313);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',76);
return owners;
    }

    /// @dev Returns array with owner addresses, which confirmed transaction.
    /// @param transactionId Transaction ID.
    /// @return Returns array of owner addresses.
    function getConfirmations(uint transactionId)
        public
        returns (address[] _confirmations)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',25);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',323);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',77);
address[] memory confirmationsTemp = new address[](owners.length);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',324);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',78);
uint count = 0;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',325);
        uint i;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',326);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',79);
for (i=0; i<owners.length; i++)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',80);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',327);
if (confirmations[transactionId][owners[i]]) {__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',21,0);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',328);
                 __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',81);
confirmationsTemp[count] = owners[i];
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',329);
                 __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',82);
count += 1;
            }else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',21,1);}
}
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',331);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',83);
_confirmations = new address[](count);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',332);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',84);
for (i=0; i<count; i++)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',85);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',333);
_confirmations[i] = confirmationsTemp[i];}
    }

    /// @dev Returns list of transaction IDs in defined range.
    /// @param from Index start position of transaction array.
    /// @param to Index end position of transaction array.
    /// @param pending Include pending transactions.
    /// @param executed Include executed transactions.
    /// @return Returns array of transaction IDs.
    function getTransactionIds(uint from, uint to, bool pending, bool executed)
        public
        returns (uint[] _transactionIds)
    {__FunctionCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',26);

__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',346);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',86);
uint[] memory transactionIdsTemp = new uint[](transactionCount);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',347);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',87);
uint count = 0;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',348);
        uint i;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',349);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',88);
for (i=0; i<transactionCount; i++)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',89);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',350);
if (   pending && !transactions[i].executed
                || executed && transactions[i].executed)
            {__BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',22,0);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',353);
                 __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',90);
transactionIdsTemp[count] = i;
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',354);
                 __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',91);
count += 1;
            }else { __BranchCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',22,1);}
}
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',356);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',92);
_transactionIds = new uint[](to - from);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',357);
         __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',93);
for (i=from; i<to; i++)
            { __StatementCoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',94);
__CoverageMultiSigWallet('/home/tknff/projects/Mothership-contracts-master/contracts/MultiSigWallet.sol',358);
_transactionIds[i - from] = transactionIdsTemp[i];}
    }
}
