const MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");
const MSP = artifacts.require("MSP");
const SIT = artifacts.require("SIT");
const SITX = artifacts.require("SITExchanger");
const Contribution = artifacts.require("Contribution");

const assertFail = require('./../helpers/assertFail');

let miniMeTokenFactory, msp, sit, sitEx;
let thisContract, contribution, result;
let amount = 50000000000000000000;

contract("SITExchanger <Blockchain Labs>, @AT,  21/01/2018 ", function(accounts) {

    const addressMothership = accounts[0];
    const addressCommunity = accounts[1];
    const addressTeam = accounts[2];
    const addressSitHolder1 = accounts[3];
    const addressSitHolder2 = accounts[4];

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

    it("* - console.log() debugging ", async () => {
        console.log("    -------------------------------------------------------------------");
        console.log("    Mothership address: " + addressMothership);
        console.log("    Commnunity address: " + addressCommunity);
        console.log("    Team address: " + addressTeam);
        console.log("    MSP contract address: " + await(msp.address));
        console.log("    MSP contract controller: " + await(msp.controller()));
        console.log("    -------------------------------------------------------------------");
        console.log(" ");
    });

    it("Should return FALSE onApprove()", async () => {
        result = await sitEx.onApprove.call(addressMothership, addressCommunity, amount);
        assert.equal(result.toString(), 'false');
    });

    it("Should return FALSE onTransfer()", async () => {
        result = await sitEx.onTransfer.call(addressCommunity, addressMothership, amount);
        assert.equal(result.toString(), 'false');
    });

    it("Should return block number", async () => {
        result = await sitEx.getBlockNumber();
    });

    it("Should THROW on proxyPayment()", async () => {
        await assertFail(async () => {
            await thisContract.proxyPayment(addressMothership);
        });
    });



    // it("2", async () => {
    //     thisContract = mspp;
    //     await thisContract.claimTokens(addressMothership);
    // });
    // it("3", async () => {
    //     thisContract = mspp;
    //     await thisContract.claimTokens(await msp.controller());
    // });
    // it("4", async () => {
    //     thisContract = mspp;
    //     await thisContract.claimTokens(addressTeam);
    // });
    // it("5", async () => {
    //     thisContract = mspp;
    //     await thisContract.claimTokens(msp.address);
    // });


});

