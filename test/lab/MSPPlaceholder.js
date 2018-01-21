const BigNumber = require('bignumber.js');

const MultiSigWallet = artifacts.require('MultiSigWallet');
const MiniMeTokenFactory = artifacts.require('MiniMeTokenFactory');
const SIT = artifacts.require('SITMock');
const MSP = artifacts.require('MSPMock');
const Contribution = artifacts.require('ContributionMock');
const SITExchanger = artifacts.require("SITExchanger");
const ContributionWallet = artifacts.require('ContributionWallet');
const MSPPlaceholder = artifacts.require('MSPPlaceholderMock');

const assertFail = require('./../helpers/assertFail');

let miniMeTokenFactory, msp, sit, sitEx;
let thisContract, contribution, result, watcher;
let amount = 50000000000000000000;

contract("MSPPlaceholder <Blockchain Labs>, @AT,  21/01/2018 ", function(accounts) {

    const addressMothership = accounts[0];
    const addressCommunity = accounts[1];
    const addressTeam = accounts[2];

    beforeEach(async () => {
        const startBlock = 1000000;
        const endBlock = 1040000;
        const totalSupply = new BigNumber(web3.toWei(200000000));
        const exchangeRate = 5000;
        const minimumGoal = 10;


        multisigMothership = await MultiSigWallet.new([addressMothership], 1);
        multisigCommunity = await MultiSigWallet.new([addressCommunity], 1);
        multisigTeam = await MultiSigWallet.new([addressTeam], 1);
        multisigReferals = await MultiSigWallet.new([addressTeam], 1);

        miniMeTokenFactory = await MiniMeTokenFactory.new();
        sit = await SIT.new(miniMeTokenFactory.address, { from: addressMothership });
        msp = await MSP.new(miniMeTokenFactory.address, { from: addressMothership });

        contribution = await Contribution.new();
        contributionWallet = await ContributionWallet.new(
            multisigMothership.address,
            endBlock,
            contribution.address,
        );

        sitExchanger = await SITExchanger.new(
            sit.address,
            msp.address,
            contribution.address,
        );

        mspPlaceholder = await MSPPlaceholder.new(
            multisigCommunity.address,
            msp.address,
            contribution.address,
            sitExchanger.address,
        );

        thisContract = mspPlaceholder;
    });

    // it("* - console.log() debugging ", async () => {
    //     console.log("    -------------------------------------------------------------------");
    //     console.log("    Mothership address: " + addressMothership);
    //     console.log("    Commnunity address: " + addressCommunity);
    //     console.log("    Team address: " + addressTeam);
    //     console.log("    MSP contract address: " + await(msp.address));
    //     console.log("    MSP contract controller: " + await(msp.controller()));
    //     console.log("    -------------------------------------------------------------------");
    //     console.log(" ");
    // });

    it("Should return FALSE onApprove()", async () => {
        result = await thisContract.onApprove.call(addressMothership, addressCommunity, amount);
        assert.equal(result.toString(), 'false');
    });

    it("Should return FALSE onTransfer()", async () => {
        await thisContract.onTransfer.call(addressCommunity, addressMothership, amount);
        await thisContract.setMockedTime(Date.now()-60*60*10);
        result = await thisContract.onTransfer.call(addressCommunity, addressMothership, amount);
        await thisContract.setMockedTime(Date.now()-60*60*30);
        result = await thisContract.onTransfer.call(addressCommunity, addressMothership, amount);
        assert.equal(result.toString(), 'false');
    });

    // it("Should return time", async () => {
    //     await thisContract.setMockedTime(Date.now()-60*60*10);
    //     result = await mspPlaceholder.getTime();
    // });

    it("Should return FALSE on proxyPayment()", async () => {
        result = await thisContract.proxyPayment.call(addressMothership);
        assert.equal(result.toString(), 'false');
    });

    it("Should be able to change controller", async () => {
        newMSPP = await MSPPlaceholder.new(
            addressMothership,
            msp.address,
            contribution.address,
            sitExchanger.address,
        );
        let controller = await newMSPP.controller();
        console.log("MSPPlaceholder contract controller: " + controller);
        console.log("MSP contract controller: " + await msp.controller());
        watcher = newMSPP.ControllerChanged();
        await newMSPP.changeController(addressCommunity, { from: addressMothership });     // WTF!?!?!
        let logs = watcher.get();
        console.log("" + logs[0]);
        assert.equal(logs[0].event, "ControllerChanged");
        assert.equal(logs[0].args._newController, addressTeam);
    });

});
