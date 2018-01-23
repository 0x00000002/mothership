# MOTHERSHIP Audit Report
## Preamble
This audit report was undertaken by BlockchainLabs.nz for the purpose of providing feedback to MOTHERSHIP. It has subsequently been shared publicly without any express or implied warranty.
Solidity contracts were sourced from the public Github repo [njmurarka/ico-solidity](https://github.com/njmurarka/ico-solidity) prior to commit [542b5ca38d7cfc2292e1bb135b8ee10679e54d23](https://github.com/njmurarka/ico-solidity/tree/542b5ca38d7cfc2292e1bb135b8ee10679e54d23) - we would encourage all community members and token holders to make their own assessment of the contracts.
## Scope
All Solidity code contained in [/contracts](CONTRACT-URL) was considered in scope along with the tests contained in [/tests](CONTRACT-TESTS-URL) as a basis for static and dynamic analysis.
## Focus Areas
The audit report is focused on the following key areas - though this is not an exhaustive list.
### Correctness
- No correctness defects uncovered during static analysis?
- No implemented contract violations uncovered during execution?
- No other generic incorrect behaviour detected during execution?
- Adherence to adopted standards such as ERC20?
### Testability
- Test coverage across all functions and events?
- Test cases for both expected behaviour and failure modes?
- Settings for easy testing of a range of parameters?
- No reliance on nested callback functions or console logs?
- Avoidance of test scenarios calling other test scenarios?
### Security
- No presence of known security weaknesses?
- No funds at risk of malicious attempts to withdraw/transfer?
- No funds at risk of control fraud?
- Prevention of Integer Overflow or Underflow?
### Best Practice
- Explicit labeling for the visibility of functions and state variables?
- Proper management of gas limits and nested execution?
- Latest version of the Solidity compiler?
## Focus Areas
The audit report is focused on the following key areas - though this is not an exhaustive list.
### Correctness
- No correctness defects uncovered during static analysis?
- No implemented contract violations uncovered during execution?
- No other generic incorrect behaviour detected during execution?
- Adherence to adopted standards such as ERC20?
### Testability
- Test coverage across all functions and events?
- Test cases for both expected behaviour and failure modes?
- Settings for easy testing of a range of parameters?
- No reliance on nested callback functions or console logs?
- Avoidance of test scenarios calling other test scenarios?
### Security
- No presence of known security weaknesses?
- No funds at risk of malicious attempts to withdraw/transfer?
- No funds at risk of control fraud?
- Prevention of Integer Overflow or Underflow?
### Best Practice
- Explicit labeling for the visibility of functions and state variables?
- Proper management of gas limits and nested execution?
- Latest version of the Solidity compiler?
## Classification
### Defect Severity
- Minor - A defect that does not have a material impact on the contract execution and is likely to be subjective.
- Moderate - A defect that could impact the desired outcome of the contract execution in a specific scenario.
- Major - A defect that impacts the desired outcome of the contract execution or introduces a weakness that may be exploited.
- Critical - A defect that presents a significant security vulnerability or failure of the contract across a range of scenarios.
## Findings
<!-- Here goes a list of issues -->
### Minor
- **Remove updateWhitelist.txt** - `lorem ipsum` Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.  [View on GitHub](https://github.com/CLIENT/issues/123)
  - [ ] Not Fixed
### Moderate
- None found
### Major
- **Remove updateWhitelist.txt** - `lorem ipsum` Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.  [View on GitHub](https://github.com/CLIENT/issues/123)
  - [ ] Not Fixed
### Critical
- None found
## Testing
To further satisfy test coverage, both `CLIENTToken.sol` and `CLIENTTokenSale.sol` were deployed onto the Kovan Test Network to achieve simulation of a mock sale. This can be viewed in the [Kovan_Tests.md](https://github.com/CLIENT/blob/master/Kovan_Tests.md) checklist.
## Conclusion
Overall we have been fully satisfied with the resulting contracts following the audit feedback period. We took part in carefully reviewing all source code provided, including deployment testing.
We are pleased to report that no potential vulnerabilities were uncovered during the audit. That the token complies with the recently finalised ERC20 Token Standards. The code has excellent testability and the developers have followed common best practices.
Of the issues we have raised all of them are minor. This crowdsale has a low risk of ethereum being hacked or stolen. 

[![Coverage Status](https://coveralls.io/repos/github/tikonoff/mothership/badge.svg?branch=master)](https://coveralls.io/github/tikonoff/mothership?branch=master)
