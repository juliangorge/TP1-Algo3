!classDefinition: #AccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
AccountTest subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
AccountTest subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #ReportesTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!


!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
ReportesTest subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'war 6/12/2022 13:08:30'!
test01AccountSummaryMuestraLosDepositosRealizados

| account summary |

account _ ReceptiveAccount new.

Deposit register: 100*peso on: account.

summary _ AccountSummary for: account.

self assert: true equals: (summary contains: 'Deposito por 100 * pesos') . ! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'war 6/15/2022 23:54:23'!
test01bisAccountSummaryMuestraLosDepositosRealizados

| account report |

account _ ReceptiveAccount new.

Deposit register: 100*peso on: account.

report _ account createReport: AccountSummary.

self assert: true equals: (report includes: 'Deposito por 100 * pesos') .! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'war 6/12/2022 13:09:08'!
test02AccountSummaryMuestraLasExtraccionesRealizadas

| account summary |

account _ ReceptiveAccount new.

Withdraw register: 50*peso on: account.

summary _ AccountSummary for: account.

self assert: true equals: (summary contains: 'Extraccion por 50 * pesos')! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'war 6/12/2022 13:10:00'!
test03AccountSummaryMuestraLasSalidasPorTransferencia

| originAccount destinationAccount summary |

originAccount _ ReceptiveAccount new.

destinationAccount _ ReceptiveAccount new.

Transfer amount: 20*peso from: originAccount to: destinationAccount .

summary _ AccountSummary for: originAccount.

self assert: true equals: (summary contains: 'Salida por transferencia de 20 * pesos').
self assert: 20*peso equals: destinationAccount balance .
self assert: -20*peso equals: originAccount balance .! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'war 6/12/2022 13:10:34'!
test04AccountSummaryMuestraLasEntradasPorTransferencia

| originAccount destinationAccount summary |

originAccount _ ReceptiveAccount new.

destinationAccount _ ReceptiveAccount new.

Transfer amount: 30*peso from: originAccount to: destinationAccount .

summary _ AccountSummary for: destinationAccount .

self assert: true equals: (summary contains: 'Entrada por transferencia de 30 * pesos'). 
self assert: 30*peso equals: destinationAccount balance .
self assert: -30*peso equals: originAccount balance .! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'war 6/12/2022 13:18:59'!
test05AccountSummaryMuestraTodasLasTransaccionesRealizadas

|originAccount destinationAccount summary |

originAccount _ ReceptiveAccount new.

destinationAccount _ ReceptiveAccount new.

Deposit register: 100*peso on: originAccount .

Withdraw register: 50*peso on: originAccount .

Transfer amount: 20*peso from: originAccount to: destinationAccount .

Transfer amount: 30*peso from: destinationAccount to: originAccount .

summary _ AccountSummary for: originAccount .

self assert: true equals: (summary contains: 'Deposito por 100 * pesos') .
self assert: true equals: (summary contains: 'Extraccion por 50 * pesos').
self assert: true equals: (summary contains: 'Salida por transferencia de 20 * pesos').
self assert: true equals: (summary contains: 'Entrada por transferencia de 30 * pesos').
self assert: -10*peso equals: destinationAccount balance .
self assert: 60*peso equals: originAccount balance .! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'war 6/12/2022 13:21:41'!
test06AccountSummaryMuestraBalanceAlFinalDelReporte

|originAccount destinationAccount summary |

originAccount _ ReceptiveAccount new.

destinationAccount _ ReceptiveAccount new.

Deposit register: 100*peso on: originAccount .

Withdraw register: 50*peso on: originAccount .

Transfer amount: 20*peso from: originAccount to: destinationAccount .

Transfer amount: 30*peso from: destinationAccount to: originAccount .

summary _ AccountSummary for: originAccount .

self assert: true equals: (summary contains: 'Deposito por 100 * pesos') .
self assert: true equals: (summary contains: 'Extraccion por 50 * pesos').
self assert: true equals: (summary contains: 'Salida por transferencia de 20 * pesos').
self assert: true equals: (summary contains: 'Entrada por transferencia de 30 * pesos').
self assert: true equals: (summary contains: 'Balance = 60 * pesos').
self assert: -10*peso equals: destinationAccount balance .
self assert: 60*peso equals: originAccount balance .! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JG 6/15/2022 10:11:05'!
test07AccountSummaryMuestraBalanceCero

| account summary |

account _ ReceptiveAccount new.

summary _ AccountSummary for: account.
self assert: true equals: (summary contains: 'Balance = 0').! !


!classDefinition: #DepositReportTest category: 'ServiciosFinancieros-Solucion'!
ReportesTest subclass: #DepositReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!DepositReportTest methodsFor: 'tests' stamp: 'JG 6/15/2022 10:55:19'!
test01DepositSummaryMuestraCeroSiNoHuboDepositos

| account summary |

account _ ReceptiveAccount new.

summary _ DepositReport for: account.
self assert: true equals: (summary contains: 'Depósito = 0').! !

!DepositReportTest methodsFor: 'tests' stamp: 'JG 6/15/2022 10:55:19'!
test02DepositSummaryMuestraUnDepositoCorrecto

| account summary |

account _ ReceptiveAccount new.

Deposit register: 10 * peso on: account.

summary _ DepositReport for: account.
self assert: true equals: (summary contains: 'Depósito = 10 * pesos').! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
ReportesTest subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JG 6/15/2022 22:10:39'!
test01PortfolioTreeMuestraArbol
	| johnsAccount angiesAccount childrenPortfolio myAccount familyPortfolio portfolioTree oc |

	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	oc _ OrderedCollection new.
	familyPortfolio sendNameTo: oc. 
	
	"
	Portfolio de la familia
		Cuenta mia
		Portfolio de hijos
			Cuenta de Juan
			Cuenta de Angeles
	"
	
	portfolioTree := PortfolioTreePrinter for: familyPortfolio.
	portfolioTree report.
	
	self assert: (portfolioTree report) equals: 'hola'.! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Solucion'!
ReportesTest subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'tests' stamp: 'JG 6/15/2022 10:12:39'!
test01TransferNetSumaEntradasPorTransferencia
	| originAccount receivingAccount transferNet |

	originAccount _ ReceptiveAccount new.
	receivingAccount _ ReceptiveAccount new.

	Transfer amount: 100*peso from: originAccount to: receivingAccount.
	
	transferNet _ TransferNet for: receivingAccount.
	self assert: 100*peso equals: (transferNet report).! !

!TransferNetTest methodsFor: 'tests' stamp: 'JG 6/15/2022 10:12:44'!
test02TransferNetRestaSalidasPorTransferencia

	| originAccount receivingAccount transferNet |

	originAccount _ ReceptiveAccount new.
	receivingAccount _ ReceptiveAccount new.

	Transfer amount: 100*peso from: originAccount to: receivingAccount.
	
	transferNet _ TransferNet for: originAccount .
	self assert: -100*peso equals: (transferNet report).! !

!TransferNetTest methodsFor: 'tests' stamp: 'JG 6/13/2022 20:38:26'!
test03TransferNetRealizaElNetoDeUnaTransferencia
	| originAccount receivingAccount originTransferNet receivingTransferNet |

	originAccount _ ReceptiveAccount new.
	receivingAccount _ ReceptiveAccount new.

	Transfer amount: 100*peso from: originAccount to: receivingAccount.
	
	Transfer amount: 50*peso from:  receivingAccount  to: originAccount.
	
	originTransferNet _ TransferNet for: originAccount.
	receivingTransferNet _ TransferNet for: receivingAccount.
	
	self assert: -50*peso equals: (originTransferNet report).
	self assert: 50*peso equals: (receivingTransferNet report).! !

!TransferNetTest methodsFor: 'tests' stamp: 'JG 6/15/2022 10:12:22'!
test04TransferNetRetornaCeroDeUnaTransferenciaNoRealizada
	| originAccount receivingAccount transferNet |

	originAccount _ ReceptiveAccount new.
	receivingAccount _ ReceptiveAccount new.

	transferNet _ TransferNet for: receivingAccount.
	self assert: 0*peso equals: (transferNet report).! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'account management' stamp: 'JG 6/15/2022 11:04:58'!
named: aName
	name _ aName.! !


!Account methodsFor: 'public' stamp: 'JG 6/15/2022 11:45:58'!
name
	self subclassResponsibility.! !

!Account methodsFor: 'public' stamp: 'JG 6/15/2022 11:51:59'!
sendNameTo: aCollection
	self subclassResponsibility.! !


!Account methodsFor: 'as yet unclassified' stamp: 'war 6/15/2022 23:55:02'!
createReport: aReport
    ^ (aReport for: self) report.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'public' stamp: 'JG 6/15/2022 11:45:14'!
name
	
	^accounts do: [ :anAccount | anAccount name ]! !

!Portfolio methodsFor: 'public' stamp: 'JG 6/15/2022 12:09:35'!
sendNameTo: anCollection
	|oc|
	oc := OrderedCollection new.
	accounts do: [ :anAccount | oc add: (anAccount sendNameTo: anCollection)].
	
	^ oc.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error message' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'JG 6/15/2022 11:04:46'!
named: aName with: anAccount with: anotherAccount

	^self new 
		named: aName;
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'public' stamp: 'JG 6/15/2022 11:52:39'!
name
	^ name.! !

!ReceptiveAccount methodsFor: 'public' stamp: 'JG 6/15/2022 12:13:18'!
sendNameTo: aCollection
	^ aCollection add: name.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'JG 6/15/2022 11:02:52'!
named: aName
	^ self new named: aName.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'balance' stamp: 'JG 6/15/2022 10:53:57'!
affectTransferBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'public' stamp: 'JG 6/15/2022 10:20:43'!
descriptionAsATextline
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'public' stamp: 'war 6/16/2022 00:21:25'!
realizarReportePara: unReporte

	self subclassResponsibility .! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'public' stamp: 'JG 6/15/2022 10:20:43'!
descriptionAsATextline
	^ 'Deposito por ' , (value) asString.! !


!Deposit methodsFor: 'private' stamp: 'war 6/16/2022 00:20:45'!
realizarReportePara: unReporte

	^ unReporte agregarDeposito: self ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'transfer balance' stamp: 'JG 6/15/2022 10:52:30'!
affectTransferBalance: aBalance
	^ (self affectBalance: aBalance).! !


!TransferLeg methodsFor: 'as yet unclassified' stamp: 'war 6/16/2022 00:21:45'!
realizarReportePara: unReporte

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'public' stamp: 'JG 6/15/2022 10:20:43'!
descriptionAsATextline
	^ 'Entrada por transferencia de ', (self value) asString.! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'war 6/16/2022 00:20:45'!
realizarReportePara: unReporte

	^ unReporte agregarEntradaPorTransferencia: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'public' stamp: 'JG 6/15/2022 10:20:43'!
descriptionAsATextline
	^ 'Salida por transferencia de ', (self value) asString.! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'war 6/16/2022 00:20:45'!
realizarReportePara: unReporte

	^ unReporte agregarSalidaPorTransferencia: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'public' stamp: 'JG 6/15/2022 10:20:43'!
descriptionAsATextline
	^ 'Extraccion por ', (value) asString.! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'war 6/16/2022 00:20:45'!
realizarReportePara: unReporte

	^ unReporte agregarExtraccion: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Reportes category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Reportes
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Reportes methodsFor: 'initialize' stamp: 'war 6/12/2022 13:28:47'!
initializeFor: anAccount 
	
	account := anAccount.! !


!Reportes methodsFor: 'as yet unclassified' stamp: 'JG 6/15/2022 10:58:01'!
report
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Reportes class' category: 'ServiciosFinancieros-Solucion'!
Reportes class
	instanceVariableNames: ''!

!Reportes class methodsFor: 'instance creation' stamp: 'war 6/12/2022 13:28:14'!
for: anAccount 
	
	^ self new initializeFor: anAccount.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Reportes subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'public' stamp: 'war 6/12/2022 12:55:51'!
contains: aString

	self report do: [: unaCadena| (unaCadena = aString) ifTrue: [^true]].
	
	^false! !

!AccountSummary methodsFor: 'public' stamp: 'war 6/16/2022 00:20:46'!
report
	
	| coleccion |
	
	coleccion _ OrderedCollection new.
	
	"self reporteDeTransaccionesEn: coleccion ."
	account transactions do: [
		:aTransaction |
		coleccion add: (aTransaction realizarReportePara:self).
	].
	
	coleccion add: 'Balance = ', (account balance) asString. 
	
	^coleccion ! !


!AccountSummary methodsFor: 'private' stamp: 'war 6/15/2022 23:45:06'!
agregarDeposito: unDeposito

	^ 'Deposito por ' , (unDeposito value) asString.

	! !

!AccountSummary methodsFor: 'private' stamp: 'war 6/15/2022 23:47:42'!
agregarEntradaPorTransferencia: unaDepositLeg

	^ 'Entrada por transferencia de ', (unaDepositLeg value) asString.! !

!AccountSummary methodsFor: 'private' stamp: 'war 6/15/2022 23:48:27'!
agregarExtraccion: unaExtraccion

	^ 'Extraccion por ', (unaExtraccion value) asString.! !

!AccountSummary methodsFor: 'private' stamp: 'war 6/15/2022 23:49:10'!
agregarSalidaPorTransferencia: unaWithdrawLeg

	^ 'Salida por transferencia de ', (unaWithdrawLeg value) asString.! !

!AccountSummary methodsFor: 'private' stamp: 'JG 6/15/2022 10:20:43'!
reporteDeTransaccionesEn: unaColeccion
	
	account transactions do: [
		:aTransaction |
		unaColeccion add: aTransaction descriptionAsATextline.
	].
	
	unaColeccion add: 'Balance = ', (account balance) asString. ! !


!classDefinition: #DepositReport category: 'ServiciosFinancieros-Solucion'!
Reportes subclass: #DepositReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!DepositReport methodsFor: 'as yet unclassified' stamp: 'JG 6/15/2022 10:30:13'!
contains: aString

	self report do: [: unaCadena| (unaCadena = aString) ifTrue: [^true]].
	
	^false! !

!DepositReport methodsFor: 'as yet unclassified' stamp: 'JG 6/15/2022 10:31:14'!
report

	| coleccion |
	
	coleccion _ OrderedCollection new.
	
	self reporteDeDepositosEn: coleccion .
	
	^coleccion ! !

!DepositReport methodsFor: 'as yet unclassified' stamp: 'JG 6/15/2022 10:34:23'!
reporteDeDepositosEn: unaColeccion
	
	account transactions do: [
		:aTransaction |
		(aTransaction isKindOf: Deposit) ifTrue: [
			unaColeccion add: aTransaction descriptionAsATextline.
		].
	].
	
	unaColeccion add: 'Depósito = ', (account balance) asString. ! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
Reportes subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'JG 6/15/2022 10:57:50'!
report
	^'muestre las transacciones indentadas de acuerdo a la profundidad de cada cuenta del portfolio'.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Reportes subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'JG 6/15/2022 12:15:00'!
report
	"
	^ 'Deberá mostrar la estructura de árbol completa del portfolio'.
	"
	"
	Tengo que obtener todos las cuentas en los portafolios en account"
	
	|reportLines reportCollection |
	reportCollection _ OrderedCollection  new.
	reportCollection _ account sendNameTo: reportCollection.
	
	
	reportCollection do: [
		:anElement |
		reportLines _ anElement.
	].
	
	^ reportLines.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Reportes subclass: #TransferNet
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'public' stamp: 'war 6/16/2022 00:20:45'!
report

	account transactions do: [
		:unaTransaccion |  
		total _ (unaTransaccion realizarReportePara: self) .
	].
	
	^total
	! !


!TransferNet methodsFor: 'private' stamp: 'war 6/16/2022 00:14:35'!
agregarDeposito: unDeposito

	^ total + 0 * peso! !

!TransferNet methodsFor: 'private' stamp: 'war 6/16/2022 00:15:03'!
agregarEntradaPorTransferencia: unaDepositLeg

	^ total + (unaDepositLeg value)! !

!TransferNet methodsFor: 'private' stamp: 'war 6/16/2022 00:14:42'!
agregarExtraccion: unaExtraccion

	^ total + 0 * peso! !

!TransferNet methodsFor: 'private' stamp: 'war 6/16/2022 00:14:56'!
agregarSalidaPorTransferencia: unaWithdrawLeg

	^ total - (unaWithdrawLeg value)! !

!TransferNet methodsFor: 'private' stamp: 'war 6/16/2022 00:16:34'!
initializeFor: anAccount 
	
	account _ anAccount .
	total _ 0 * peso! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
