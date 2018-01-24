# MOTHERSHIP Work paper
## ./contracts

[Contribution.sol](/contracts/Contribution.sol)
```
.---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
|                                                                        /Users/tikonoff/projects/mothership/contracts/Contribution.sol                                                                         |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   Contract   |                                                  Function                                                   | Visibility | Constant | Returns |                   Modifiers                    |
|--------------|-------------------------------------------------------------------------------------------------------------|------------|----------|---------|------------------------------------------------|
| Contribution | Contribution()                                                                                              | public     | false    |         |                                                |
| Contribution | initialize(address,address,uint256,uint256,uint256,uint256,uint256,address,address,address,address,address) | public     | false    |         | onlyController                                 |
| Contribution | setMinimumInvestment(uint)                                                                                  | public     | false    |         | onlyController                                 |
| Contribution | ()                                                                                                          | public     | false    |         | payable,notPaused                              |
| Contribution | proxyPayment(address)                                                                                       | public     | false    | bool    | payable,notPaused,initialized,contributionOpen |
| Contribution | onTransfer(address,address,uint256)                                                                         | public     | false    | bool    |                                                |
| Contribution | onApprove(address,address,uint256)                                                                          | public     | false    | bool    |                                                |
| Contribution | doBuy(address)                                                                                              | internal   | false    |         |                                                |
| Contribution | isContract(address)                                                                                         | internal   | true     | bool    |                                                |
| Contribution | finalized()                                                                                                 | public     | false    | bool    |                                                |
| Contribution | finalize()                                                                                                  | public     | false    |         | initialized                                    |
| Contribution | percent(uint256)                                                                                            | internal   | false    | uint256 |                                                |
| Contribution | tokensIssued()                                                                                              | public     | true     | uint256 |                                                |
| Contribution | tokensForSale()                                                                                             | public     | true     | uint256 |                                                |
| Contribution | getBlockNumber()                                                                                            | internal   | true     | uint256 |                                                |
| Contribution | claimTokens(address)                                                                                        | public     | false    |         | onlyController                                 |
| Contribution | pauseContribution()                                                                                         | public     | false    |         | onlyController                                 |
| Contribution | resumeContribution()                                                                                        | public     | false    |         | onlyController                                 |
'---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'
```

[ContributionWallet.sol](/contracts/ContributionWallet.sol)

```
.----------------------------------------------------------------------------------------------------------------.
|                      /Users/tikonoff/projects/mothership/contracts/ContributionWallet.sol                      |
|----------------------------------------------------------------------------------------------------------------|
|      Contract      |                  Function                   | Visibility | Constant | Returns | Modifiers |
|--------------------|---------------------------------------------|------------|----------|---------|-----------|
| ContributionWallet | ContributionWallet(address,uint256,address) | public     | false    |         |           |
| ContributionWallet | ()                                          | public     | false    |         | payable   |
| ContributionWallet | withdraw()                                  | public     | false    |         |           |
'----------------------------------------------------------------------------------------------------------------'
```
[MiniMeToken.sol](/contracts/MiniMeToken.sol)
```
.------------------------------------------------------------------------------------------------------------------------------------------------.
|                                         /Users/tikonoff/projects/mothership/contracts/MiniMeToken.sol                                          |
|------------------------------------------------------------------------------------------------------------------------------------------------|
|      Contract      |                          Function                          | Visibility | Constant |   Returns   |       Modifiers        |
|--------------------|------------------------------------------------------------|------------|----------|-------------|------------------------|
| MiniMeToken        | MiniMeToken(address,address,uint,string,uint8,string,bool) | public     | false    |             |                        |
| MiniMeToken        | transfer(address,uint256)                                  | public     | false    | success     |                        |
| MiniMeToken        | transferFrom(address,address,uint256)                      | public     | false    | success     |                        |
| MiniMeToken        | doTransfer(address,address,uint)                           | internal   | false    | bool        |                        |
| MiniMeToken        | balanceOf(address)                                         | public     | true     | balance     |                        |
| MiniMeToken        | approve(address,uint256)                                   | public     | false    | success     |                        |
| MiniMeToken        | allowance(address,address)                                 | public     | true     | remaining   |                        |
| MiniMeToken        | approveAndCall(address,uint256,bytes)                      | public     | false    | success     |                        |
| MiniMeToken        | totalSupply()                                              | public     | true     | uint        |                        |
| MiniMeToken        | balanceOfAt(address,uint)                                  | public     | true     | uint        |                        |
| MiniMeToken        | totalSupplyAt(uint)                                        | public     | true     | uint        |                        |
| MiniMeToken        | createCloneToken(string,uint8,string,uint,bool)            | public     | false    | address     |                        |
| MiniMeToken        | generateTokens(address,uint)                               | public     | false    | bool        | onlyController         |
| MiniMeToken        | destroyTokens(address,uint)                                | public     | false    | bool        | onlyControllerOrBurner |
| MiniMeToken        | enableTransfers(bool)                                      | public     | false    |             | onlyController         |
| MiniMeToken        | getValueAt(Checkpoint,uint)                                | internal   | true     | uint        |                        |
| MiniMeToken        | updateValueAtNow(Checkpoint,uint)                          | internal   | false    |             |                        |
| MiniMeToken        | isContract(address)                                        | internal   | true     | bool        |                        |
| MiniMeToken        | min(uint,uint)                                             | internal   | false    | uint        |                        |
| MiniMeToken        | ()                                                         | public     | false    |             | payable                |
| MiniMeToken        | getBlockNumber()                                           | internal   | true     | uint256     |                        |
| MiniMeToken        | claimTokens(address)                                       | public     | false    |             | onlyController         |
| MiniMeTokenFactory | createCloneToken(address,uint,string,uint8,string,bool)    | public     | false    | MiniMeToken |                        |
'------------------------------------------------------------------------------------------------------------------------------------------------'

```
[MSP.sol](/contracts/MSP.sol)
```
.-------------------------------------------------------------------------.
|          /Users/tikonoff/projects/mothership/contracts/MSP.sol          |
|-------------------------------------------------------------------------|
| Contract |   Function   | Visibility | Constant | Returns |  Modifiers  |
|----------|--------------|------------|----------|---------|-------------|
| MSP      | MSP(address) | public     | false    |         | MiniMeToken |
'-------------------------------------------------------------------------'

```
[MSPPlaceholder.sol](/contracts/MSPPlaceholder.sol)
```
.---------------------------------------------------------------------------------------------------------------------.
|                          /Users/tikonoff/projects/mothership/contracts/MSPPlaceholder.sol                           |
|---------------------------------------------------------------------------------------------------------------------|
|    Contract    |                    Function                     | Visibility | Constant | Returns |   Modifiers    |
|----------------|-------------------------------------------------|------------|----------|---------|----------------|
| MSPPlaceHolder | MSPPlaceHolder(address,address,address,address) | public     | false    |         |                |
| MSPPlaceHolder | changeController(address)                       | public     | false    |         | onlyController |
| MSPPlaceHolder | proxyPayment(address)                           | public     | false    | bool    | payable        |
| MSPPlaceHolder | onTransfer(address,address,uint256)             | public     | false    | bool    |                |
| MSPPlaceHolder | onApprove(address,address,uint256)              | public     | false    | bool    |                |
| MSPPlaceHolder | transferable(address)                           | internal   | false    | bool    |                |
| MSPPlaceHolder | getTime()                                       | internal   | false    | uint256 |                |
| MSPPlaceHolder | claimTokens(address)                            | public     | false    |         | onlyController |
'---------------------------------------------------------------------------------------------------------------------'

```
[ReferalsTokenHolder.sol](/contracts/ReferalsTokenHolder.sol)
```
.-------------------------------------------------------------------------------------------------------.
|                 /Users/tikonoff/projects/mothership/contracts/ReferalsTokenHolder.sol                 |
|-------------------------------------------------------------------------------------------------------|
|      Contract       |           Function           | Visibility | Constant | Returns |   Modifiers    |
|---------------------|------------------------------|------------|----------|---------|----------------|
| ReferalsTokenHolder | ReferalsTokenHolder(address) | public     | false    |         |                |
| ReferalsTokenHolder | spread(address,uint256)      | public     | false    |         | onlyController |
| ReferalsTokenHolder | claimTokens(address)         | public     | false    |         | onlyController |
'-------------------------------------------------------------------------------------------------------'

```
[SIT.sol](/contracts/SIT.sol)
```
.-------------------------------------------------------------------------.
|          /Users/tikonoff/projects/mothership/contracts/SIT.sol          |
|-------------------------------------------------------------------------|
| Contract |   Function   | Visibility | Constant | Returns |  Modifiers  |
|----------|--------------|------------|----------|---------|-------------|
| SIT      | SIT(address) | public     | false    |         | MiniMeToken |
'-------------------------------------------------------------------------'

```
[SITExchanger.sol](/contracts/SITExchanger.sol)
```
.---------------------------------------------------------------------------------------------------------.
|                     /Users/tikonoff/projects/mothership/contracts/SITExchanger.sol                      |
|---------------------------------------------------------------------------------------------------------|
|   Contract   |               Function                | Visibility | Constant | Returns |   Modifiers    |
|--------------|---------------------------------------|------------|----------|---------|----------------|
| SITExchanger | SITExchanger(address,address,address) | public     | false    |         |                |
| SITExchanger | collect()                             | public     | false    |         |                |
| SITExchanger | proxyPayment(address)                 | public     | false    | bool    | payable        |
| SITExchanger | onTransfer(address,address,uint256)   | public     | false    | bool    |                |
| SITExchanger | onApprove(address,address,uint256)    | public     | false    | bool    |                |
| SITExchanger | getBlockNumber()                      | internal   | true     | uint256 |                |
| SITExchanger | claimTokens(address)                  | public     | false    |         | onlyController |
'---------------------------------------------------------------------------------------------------------'
```

## ./contracts/misc

[Migration.sol](/contracts/misc/Migrations.sol)
```
.--------------------------------------------------------------------------------.
|       /Users/tikonoff/projects/mothership/contracts/misc/Migrations.sol        |
|--------------------------------------------------------------------------------|
|  Contract  |      Function      | Visibility | Constant | Returns | Modifiers  |
|------------|--------------------|------------|----------|---------|------------|
| Migrations | Migrations()       | public     | false    |         |            |
| Migrations | setCompleted(uint) | public     | false    |         | restricted |
| Migrations | upgrade(address)   | public     | false    |         | restricted |
'--------------------------------------------------------------------------------'

```
[SafeMath.sol](/contracts/misc/SafeMath.sol) - This is a library, therefore it was not processed by Solidity Function Profiler.

## . /contracts/test

[ContributionMock.sol](/contracts/test/ContributionMock.sol)

```
.------------------------------------------------------------------------------------------------.
|            /Users/tikonoff/projects/mothership/contracts/test/ContributionMock.sol             |
|------------------------------------------------------------------------------------------------|
|     Contract     |          Function          | Visibility | Constant | Returns |  Modifiers   |
|------------------|----------------------------|------------|----------|---------|--------------|
| ContributionMock | ContributionMock()         | public     | false    |         | Contribution |
| ContributionMock | getBlockNumber()           | internal   | true     | uint    |              |
| ContributionMock | setMockedBlockNumber(uint) | public     | false    |         |              |
'------------------------------------------------------------------------------------------------'
```
[MSPMock.sol](/contracts/test/MSPMock.sol)
```
.-------------------------------------------------------------------------------------.
|           /Users/tikonoff/projects/mothership/contracts/test/MSPMock.sol            |
|-------------------------------------------------------------------------------------|
| Contract |          Function          | Visibility | Constant | Returns | Modifiers |
|----------|----------------------------|------------|----------|---------|-----------|
| MSPMock  | MSPMock(address)           | public     | false    |         | MSP       |
| MSPMock  | getBlockNumber()           | internal   | true     | uint    |           |
| MSPMock  | setMockedBlockNumber(uint) | public     | false    |         |           |
'-------------------------------------------------------------------------------------'
```
[MSPPlaceholderMock.sol](/contracts/test/MSPPlaceholderMock.sol)
```
.-----------------------------------------------------------------------------------------------------------------------------.
|                          /Users/tikonoff/projects/mothership/contracts/test/MSPPlaceholderMock.sol                          |
|-----------------------------------------------------------------------------------------------------------------------------|
|      Contract      |                      Function                       | Visibility | Constant | Returns |   Modifiers    |
|--------------------|-----------------------------------------------------|------------|----------|---------|----------------|
| MSPPlaceholderMock | MSPPlaceholderMock(address,address,address,address) | public     | false    |         | MSPPlaceHolder |
| MSPPlaceholderMock | getTime()                                           | internal   | false    | uint    |                |
| MSPPlaceholderMock | setMockedTime(uint)                                 | public     | false    |         |                |
'-----------------------------------------------------------------------------------------------------------------------------'
```
[SafeMathMock.sol](/contracts/test/SafeMathMock.sol)
```
.----------------------------------------------------------------------------------------.
|          /Users/tikonoff/projects/mothership/contracts/test/SafeMathMock.sol           |
|----------------------------------------------------------------------------------------|
|   Contract   |         Function          | Visibility | Constant | Returns | Modifiers |
|--------------|---------------------------|------------|----------|---------|-----------|
| SafeMathMock | multiply(uint256,uint256) | public     | false    |         |           |
| SafeMathMock | subtract(uint256,uint256) | public     | false    |         |           |
| SafeMathMock | add(uint256,uint256)      | public     | false    |         |           |
'----------------------------------------------------------------------------------------'
```
[SITExchangerMock.sol](/contracts/test/SITExchangerMock.sol)
```
.---------------------------------------------------------------------------------------------------------------.
|                    /Users/tikonoff/projects/mothership/contracts/test/SITExchangerMock.sol                    |
|---------------------------------------------------------------------------------------------------------------|
|     Contract     |                 Function                  | Visibility | Constant | Returns |  Modifiers   |
|------------------|-------------------------------------------|------------|----------|---------|--------------|
| SITExchangerMock | SITExchangerMock(address,address,address) | public     | false    |         | SITExchanger |
| SITExchangerMock | getBlockNumber()                          | internal   | true     | uint    |              |
| SITExchangerMock | setMockedBlockNumber(uint)                | public     | false    |         |              |
| SITExchangerMock | collect()                                 | public     | false    |         |              |
'---------------------------------------------------------------------------------------------------------------'
```
[SITMock.sol](/contracts/test/SITMock.sol)
```
.-------------------------------------------------------------------------------------.
|           /Users/tikonoff/projects/mothership/contracts/test/SITMock.sol            |
|-------------------------------------------------------------------------------------|
| Contract |          Function          | Visibility | Constant | Returns | Modifiers |
|----------|----------------------------|------------|----------|---------|-----------|
| SITMock  | SITMock(address)           | public     | false    |         | SIT       |
| SITMock  | getBlockNumber()           | internal   | true     | uint    |           |
| SITMock  | setMockedBlockNumber(uint) | public     | false    |         |           |
'-------------------------------------------------------------------------------------'
```
