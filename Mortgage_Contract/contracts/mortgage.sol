pragma solidity ^0.8.11;


contract Mortgage{
    constructor() public{
        loanApplicant = msg.sender;
        loan.status = STATUS_INITIATED;
        balances[msg.sender]= 1000000;


    }

        address loanApplicant;

    event LineReleased(address _owner);
    event LineTransferred(address _owner);
    event LoanStatus(int _status);

    int constant STATUS_INITIATED = 0;
    int constant STATUS_SUBMITTED = 1;
    int constant STATUS_IAPPROVED = 2;
    int constant STATUS_REJECTED = 3;

    struct Property{
        bytes32 addressOfProperty;
        uint32 purchasePrice;
        address owner;

    }

    struct LoanTerms{
        uint32 terms;
        uint32 interest;
        uint32 loanAmmount;
        uint32 annualTax;
        uint annualInsurance;
    }


    struct MonthlyPayments{
        uint32 pi;
        uint32 tax;
        uint32 insurance;
    }

    struct ActorAccounts{
        address mortgageHolder;
        address insurer;
        address irs;
    }

    struct Loan{
        LoanTerms loanTerms;
        Property property;
        MonthlyPayments monthlyPayment;
        ActorAccounts actorsAccounts;

        int status;
    }

    Loan loan;
    LoanTerms loanTerms;
    Property property;
    MonthlyPayments monthlyPayment;
    ActorAccounts actorsAccounts;


    mapping(address => uint256) public balances;

}