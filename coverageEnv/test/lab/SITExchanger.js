const BigNumber = require('bignumber.js');
const MiniMeTokenFactory = artifacts.require('MiniMeTokenFactory');
const SIT = artifacts.require('SITMock');
const MSP = artifacts.require('MSPMock');
const Contribution = artifacts.require('ContributionMock');
const SITX = artifacts.require("SITExchangerMock");
const ContributionWallet = artifacts.require('ContributionWallet');
const MSPPlaceholder = artifacts.require('MSPPlaceholderMock');
const MultiSigWallet = artifacts.require('MultiSigWallet');

const assertFail = require('./../helpers/assertFail');

let miniMeTokenFactory, msp, sit, sitEx;
let thisContract, contribution, result;
let amount = 50000000000000000000;

contract("SITExchanger <Blockchain Labs>, @AT,  21/01/2018 ", function(accounts) {

    const addressMothership = accounts[0];
    const addressCommunity = accounts[1];
    const addressTeam = accounts[2];

    beforeEach(async () => {
        miniMeTokenFactory = await MiniMeTokenFactory.new({ from: addressMothership });
        msp = await MSP.new(miniMeTokenFactory.address, { from: addressMothership });
        sit = await SIT.new(miniMeTokenFactory.address, { from: addressMothership });
        contribution = await Contribution.new();
        sitEx = await SITX.new(sit.address, msp.address, contribution.address, { from: addressMothership });
        thisContract = sitEx;
        await msp.enableTransfers(true, { from: addressMothership });
        msp.generateTokens(addressMothership, 100000000000000000000);
    });

    // it("* - console.log() debugging ", async () => {
    //     console.log("    -------------------------------------------------------------------");
    //     console.log("    Mothership address: " + addressMothership);
    //     console.log("    Commnunity address: " + addressCommunity);
    //     console.log("    Team address: " + addressTeam);
    //     console.log("    SIT Holder 1 address: " + addressSitHolder1);
    //     console.log("    SIT Holder 2 address: " + addressSitHolder2);
    //     console.log("    MSP contract address: " + await(msp.address));
    //     console.log("    MSP contract controller: " + await(msp.controller()));
    //     console.log("    -------------------------------------------------------------------");
    //     console.log(" ");
    // });

    it("Should return FALSE onApprove()", async () => {
        result = await sitEx.onApprove.call(addressMothership, addressCommunity, amount);
        assert.equal(result.toString(), 'false');
    });

    it("Should return FALSE onTransfer()", async () => {
        result = await sitEx.onTransfer.call(addressCommunity, addressMothership, amount);
        assert.equal(result.toString(), 'false');
    });

    it("Should return block number", async () => {
        await sitEx.getBlockNumber;
    });

    it("Should THROW on proxyPayment()", async () => {
        await assertFail(async () => {
            await thisContract.proxyPayment(addressMothership);
        });
    });

    it ("SIT holders should be able to collect their MSP", async () => {

        let mspPlaceholder;

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
        sit = await SIT.new(miniMeTokenFactory.address);
        msp = await MSP.new(miniMeTokenFactory.address);

        await msp.enableTransfers(true, { from: addressMothership });
        await sit.enableTransfers(true, { from: addressMothership });

        contribution = await Contribution.new();
        contributionWallet = await ContributionWallet.new(
            multisigMothership.address,
            endBlock,
            contribution.address,
        );

        sitExchanger = await SITX.new(
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

        await msp.changeController(contribution.address);
        assert.isOk(await sit.generateTokens(addressMothership, web3.toWei(1000)));

        await contribution.initialize(
            msp.address,
            mspPlaceholder.address,
            totalSupply,
            exchangeRate,
            minimumGoal,
            startBlock,
            endBlock,
            contributionWallet.address,
            sitExchanger.address,
            multisigTeam.address,
            multisigReferals.address,
            sit.address,
        );

        await sitExchanger.setMockedBlockNumber(1010000);
        watcher = sitExchanger.TokensCollected();
        await sit.approve(addressMothership, web3.toWei(1000));
        await sitExchanger.collect();
        let logs = watcher.get();
        assert.equal(logs[0].event, "TokensCollected");
        assert.equal(logs[0].args._holder, addressMothership);
        assert.equal(logs[0].args._amount.toNumber(), web3.toWei(1000));

    });

});

