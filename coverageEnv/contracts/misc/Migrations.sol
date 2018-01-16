pragma solidity ^0.4.4;

contract Migrations {event __CoverageMigrations(string fileName, uint256 lineNumber);
event __FunctionCoverageMigrations(string fileName, uint256 fnId);
event __StatementCoverageMigrations(string fileName, uint256 statementId);
event __BranchCoverageMigrations(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMigrations(string fileName, uint256 branchId);
event __AssertPostCoverageMigrations(string fileName, uint256 branchId);

  address public owner;
  uint public last_completed_migration;

  modifier restricted() {__FunctionCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',1);

__CoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',8);
     __StatementCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',1);
if (msg.sender == owner) {__BranchCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',1,0);_;}else { __BranchCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',1,1);}

  }

  function Migrations() {__FunctionCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',2);

__CoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',12);
     __StatementCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',2);
owner = msg.sender;
  }

  function setCompleted(uint completed) restricted {__FunctionCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',3);

__CoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',16);
     __StatementCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',3);
last_completed_migration = completed;
  }

  function upgrade(address new_address) restricted {__FunctionCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',4);

__CoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',20);
     __StatementCoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',4);
Migrations upgraded = Migrations(new_address);
__CoverageMigrations('/home/tknff/projects/Mothership-contracts-master/contracts/misc/Migrations.sol',21);
    upgraded.setCompleted(last_completed_migration);
  }
}
