```
Contract: Mothership tokens contribution
    ✓ Deploys all contracts (25494522 gas)
    ✓ MSP total supply and contribution limits
    ✓ Check buying tokens, aware for oversale (305236 gas)
    ✓ won't generate tokens for payments bellow the minimum_investment (68474 gas)
    ✓ Finalize, check balances (298615 gas)

  Contract: MSP
    ✓ Controler and only controler can burn (4196718 gas)
    ✓ Burner can also burn it's own tokens (4168403 gas)

  Contract: MSP
    ✓ A cloned Token will keep the original Token's transaction history (2800028 gas)
    ✓ A cloned Token can be cloned whithout the calling createCloneToken (3560548 gas)

  Contract: MSP
    ✓ creation: should have imported an initial balance of 100000000000000000000 from the old Token
    ✓ transfers: should transfer 100000000000000000000 to accounts[1] with accounts[0] having 100000000000000000000 (110321 gas)
    ✓ transfers: should fail when trying to transfer 100000000000000000001 to accounts[1] with accounts[0] having 100000000000000000000 (27994 gas)
    ✓ approvals: msg.sender should approve 100 to accounts[1] (46240 gas)
    ✓ approvals: msg.sender approves accounts[1] of 100 & withdraws 20 once. (163426 gas)
    ✓ approvals: msg.sender approves accounts[1] of 100 & withdraws 20 twice. (268744 gas)
    ✓ approvals: msg.sender approves accounts[1] of 100 & withdraws 50 & 60 (2nd tx should fail) (163426 gas)
    ✓ approvals: attempt withdrawal from account with no allowance (should fail)
    ✓ approvals: allow accounts[1] 100 to withdraw from accounts[0]. Withdraw 60 and then approve 0 & attempt transfer. (179209 gas)

  Contract: MSP
    ✓ Controler and only controler can mint (314247 gas)

  Contract: ReferalsTokenHolder
    ✓ Referals can't spread tokens before the contribution finalizes (57903 gas)
    ✓ Referals can spread tokens after the contribution finalizes (212468 gas)

  Contract: SIT
    ✓ Deploys all contracts (6869657 gas)
    ✓ total supply
    ✓ nobody can buy (22097 gas)
    generate tokens
      ✓ could generate SIT token for holder1 (145491 gas)
      ✓ could generate SIT token for holder2 (107124 gas)
      ✓ not transferable (24080 gas)

  Contract: MSPPlaceholder <Blockchain Labs>, @AT,  21/01/2018 
    ✓ Should return FALSE onApprove()
    ✓ Should return FALSE onTransfer() (54144 gas)
    ✓ Should return time (27072 gas)
    ✓ Should return FALSE on proxyPayment()

  Contract: MultiSig Wallet  <Blockchain Labs>, @AT,  22/01/2018
    ✓ should get owners
    ✓ Should THROW on addOwner() (23015 gas)
    ✓ Should THROW on addOwner() which already exist
    ✓ Should THROW on removeOwner()
    ✓ Should THROW on replaceOwner()
    ✓ Should THROW on changeRequirement()

  Contract: SITExchanger <Blockchain Labs>, @AT,  21/01/2018 
    ✓ Should return FALSE onApprove() (121774 gas)
    ✓ Should return FALSE onTransfer() (121774 gas)
    ✓ Should return block number
    ✓ Should THROW on proxyPayment() (144867 gas)
    ✓ SIT holders should be able to collect their MSP (25810664 gas)

  Contract: any  <Blockchain Labs>, @AT,  21/01/2018
    Controllers are able to claim tokens from:
      ✓ MSP (361816 gas)
      ✓ SITExchanger (265713 gas)
      ✓ ReferalsTokenHolder (360936 gas)
      ✓ MSPPlaceholder (442220 gas)

  Contract: Contribution Wallet  <Blockchain Labs>, @AT,  21/01/2018

    2) Withdraw

  Contract: Migrations  <Blockchain Labs>, @AT,  21/01/2018
    ✓ upgrade() (67257 gas)

  Contract: SafeMath  <Blockchain Labs>, @AT,  21/01/2018
    ✓ multiplies correctly (42144 gas)
    ✓ adds correctly (27153 gas)
    ✓ subtracts correctly (27096 gas)
    ✓ should throw an error if subtraction result would be negative (4000000 gas)
    ✓ should throw an error on addition overflow (23033 gas)
    ✓ should throw an error on multiplication overflow (23033 gas)

·--------------------------------------------------------------------------------------|----------------------------·
│                                         Gas                                          ·  Block limit: 6721975 gas  │
····················································|··································|·····························
│  Methods                                          ·           21 gwei/gas            ·      1484.26 nzd/eth       │
···························|························|··········|···········|···········|··············|··············
│  Contract                ·  Method                ·  Min     ·  Max      ·  Avg      ·  # calls     ·  nzd (avg)  │
···························|························|··········|···········|···········|··············|··············
│  ApproveAndCallReceiver  ·  receiveApproval       ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  ContributionMock        ·  finalize              ·   41689  ·   271163  ·   156426  ·           2  ·       4.88  │
···························|························|··········|···········|···········|··············|··············
│  ContributionMock        ·  finalized             ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  ContributionMock        ·  initialize            ·  330882  ·   330946  ·   330914  ·           2  ·      10.31  │
···························|························|··········|···········|···········|··············|··············
│  ContributionMock        ·  pauseContribution     ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  ContributionMock        ·  resumeContribution    ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  ContributionMock        ·  setMinimumInvestment  ·       -  ·        -  ·    42586  ·           1  ·       1.33  │
···························|························|··········|···········|···········|··············|··············
│  ContributionWallet      ·  withdraw              ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  MSPPlaceholderMock      ·  setMockedTime         ·       -  ·        -  ·    27072  ·           3  ·       0.84  │
···························|························|··········|···········|···········|··············|··············
│  MultiSigWallet          ·  addOwner              ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  MultiSigWallet          ·  changeRequirement     ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  MultiSigWallet          ·  confirmTransaction    ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  MultiSigWallet          ·  executeTransaction    ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  MultiSigWallet          ·  removeOwner           ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  MultiSigWallet          ·  replaceOwner          ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  MultiSigWallet          ·  revokeConfirmation    ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  MultiSigWallet          ·  submitTransaction     ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  ReferalsTokenHolder     ·  spread                ·       -  ·        -  ·   142232  ·           1  ·       4.43  │
···························|························|··········|···········|···········|··············|··············
│  SafeMathMock            ·  add                   ·       -  ·        -  ·    27153  ·           1  ·       0.85  │
···························|························|··········|···········|···········|··············|··············
│  SafeMathMock            ·  multiply              ·       -  ·        -  ·    42144  ·           1  ·       1.31  │
···························|························|··········|···········|···········|··············|··············
│  SafeMathMock            ·  subtract              ·       -  ·        -  ·    27096  ·           1  ·       0.84  │
···························|························|··········|···········|···········|··············|··············
│  SITExchangerMock        ·  collect               ·       -  ·        -  ·    75058  ·           1  ·       2.34  │
···························|························|··········|···········|···········|··············|··············
│  SITExchangerMock        ·  onApprove             ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  SITExchangerMock        ·  onTransfer            ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  SITExchangerMock        ·  proxyPayment          ·       -  ·        -  ·    98164  ·           1  ·       3.06  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  approve               ·   15783  ·    47328  ·    42044  ·           7  ·       1.31  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  approveAndCall        ·       -  ·        -  ·        -  ·           0  ·          -  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  changeBurner          ·       -  ·        -  ·    28679  ·           1  ·       0.89  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  changeController      ·       -  ·        -  ·    28547  ·           8  ·       0.89  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  claimTokens           ·   23405  ·   111166  ·    59031  ·           8  ·       1.84  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  createCloneToken      ·       -  ·        -  ·  2568033  ·           1  ·      80.04  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  destroyTokens         ·   96259  ·    96623  ·    96441  ·           2  ·       3.01  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  enableTransfers       ·       -  ·        -  ·    27749  ·           2  ·       0.86  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  generateTokens        ·   83471  ·   121838  ·   117283  ·          19  ·       3.66  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  setMockedBlockNumber  ·   26924  ·    27452  ·    27241  ·           5  ·       0.85  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  transfer              ·   27994  ·   111025  ·    90091  ·           4  ·       2.81  │
···························|························|··········|···········|···········|··············|··············
│  SITMock                 ·  transferFrom          ·  105318  ·   117186  ·   114812  ·           5  ·       3.58  │
···························|························|··········|···········|···········|··············|··············
│  Deployments                                      ·                                  ·  % of limit  ·             │
····················································|··········|···········|···········|··············|··············
│  ApproveAndCallReceiver                           ·  184958  ·  3538253  ·  2470061  ·      36.7 %  ·      76.99  │
····················································|··········|···········|···········|··············|··············
│  Contribution                                     ·       -  ·        -  ·  2866627  ·      42.6 %  ·      89.35  │
····················································|··········|···········|···········|··············|··············
│  ContributionWallet                               ·  363728  ·   363792  ·   363760  ·       5.4 %  ·      11.34  │
·---------------------------------------------------|----------|-----------|-----------|--------------|-------------·

  53 passing (9m)
  3 failing

```