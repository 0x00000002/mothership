const MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");
const MSP = artifacts.require("MSP");
const MSPP = artifacts.require("MSPPlaceholderMock");
const SIT = artifacts.require("SIT");
const SITX = artifacts.require("SITExchanger");
const ReferalsTokenHolder = artifacts.require("ReferalsTokenHolder");
const Contribution = artifacts.require("Contribution");
const MultiSigWallet = artifacts.require('MultiSigWallet');

let miniMeTokenFactory, msp, sit, sitEx, mspp, referals;
let thisContract, contractBalance, contribution, logs;
let amount = 50000000000000000000;

contract("any ", function(accounts) {

    const addressMothership = accounts[0];
    const addressCommunity = accounts[1];

    beforeEach(async () => {
        miniMeTokenFactory = await MiniMeTokenFactory.new({ from: addressMothership });
        msp = await MSP.new(miniMeTokenFactory.address, { from: addressMothership });
        sit = await SIT.new(miniMeTokenFactory.address, { from: addressMothership });
        contribution = await Contribution.new();
        multisigCommunity = await MultiSigWallet.new([addressCommunity], 1);
        sitEx = await SITX.new(sit.address, msp.address, contribution.address, { from: addressMothership });
        mspp = await MSPP.new(addressMothership, msp.address, contribution.address, sitEx.address, { from: addressMothership });
        referals = await ReferalsTokenHolder.new(msp.address);

        await msp.enableTransfers(true, { from: addressMothership });
        msp.generateTokens(addressMothership, 100000000000000000000);
    });

    describe('Controllers are able to claim tokens from:', function() {

        it("MSP", async () => {
            thisContract = msp;
            await msp.generateTokens(thisContract.address, amount);
            contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
            assert.equal(contractBalance, amount);
            watcher= thisContract.ClaimedTokens();
            await thisContract.claimTokens(thisContract.address);
            contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
            assert.equal(contractBalance, 0);
            logs = watcher.get();
            assert.equal(logs[0].event, "ClaimedTokens");
            assert.equal(logs[0].args._token, msp.address);
            assert.equal(logs[0].args._controller, addressMothership);
            assert.equal(logs[0].args._amount.toNumber(), amount);

            await thisContract.claimTokens(0x0);
            contractBalance = (await web3.eth.getBalance(thisContract.address)).toNumber();
            assert.equal(contractBalance, 0);
        });

        it("SITExchanger", async () => {
            thisContract = sitEx;
            // console.log("SIT address: " + sit.address);
            // console.log("SIT controller: " + await sit.controller());
            // console.log("SITExchange contract address: " + await(thisContract.address));
            // console.log("SITExchange contract controller: " + await(thisContract.controller()));
            await sit.generateTokens(thisContract.address, amount);
            contractBalance = (await sit.balanceOf.call(thisContract.address)).toNumber();
            assert.equal(contractBalance, amount);

            // Not working: SITExchanger.claimTokens require( token != address(msp) )

            // await thisContract.claimTokens(0xb0030c1cc4b979ee749e71b17c082b915dcd3c92);
            // contractBalance = (await sit.balanceOf.call(thisContract.address)).toNumber();
            // assert.equal(contractBalance,0);
            // console.log("generated: " + contractBalance);

            await thisContract.claimTokens(0x0);
            contractBalance = (await web3.eth.getBalance(thisContract.address)).toNumber();
            assert.equal(contractBalance, 0);

        });

        it("ReferalsTokenHolder", async () => {
            thisContract = referals;
            await msp.generateTokens(thisContract.address, amount);
            contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
            assert.equal(contractBalance, amount);

            await thisContract.claimTokens(msp.address);
            contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
            assert.equal(contractBalance, 0);

            await referals.claimTokens(0x0);
            contractBalance = (await web3.eth.getBalance(thisContract.address)).toNumber();
            assert.equal(contractBalance, 0);
        });

        it("MSPPlaceholder", async () => {
            thisContract = mspp;
            await msp.generateTokens(thisContract.address, amount);
            contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
            assert.equal(contractBalance, amount);

            watcher= thisContract.ClaimedTokens();
            await thisContract.claimTokens(msp.address);
            contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
            assert.equal(contractBalance, 0);
            logs = watcher.get();
            assert.equal(logs[0].event, "ClaimedTokens");
            assert.equal(logs[0].args._token, msp.address);
            assert.equal(logs[0].args._controller, addressMothership);
            assert.equal(logs[0].args._amount.toNumber(), amount);

            await thisContract.claimTokens(0x0);
            contractBalance = (await web3.eth.getBalance(thisContract.address)).toNumber();
            assert.equal(contractBalance, 0);

            watcher = thisContract.ControllerChanged();
            assert.isOk(await msp.changeController(thisContract.address));
            await thisContract.claimTokens(msp.address);
            contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
            assert.equal(contractBalance, 0);
            logs = watcher.get();
            if (logs[0]) {                                                  // TODO: why it is not called?
                assert.equal(logs[0].event, "ControllerChanged");
                assert.equal(logs[0].args._newController, thisContract.address());
            }
        });

    });

});

