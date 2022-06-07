!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 21:02:47'!
test01
	"Agregamos dos cuentas al Portfolio y obtenemos el balance"
	
	| portfolio accountOne accountTwo |
	
	accountOne _ ReceptiveAccount new.
	accountTwo _ ReceptiveAccount new.
	
	portfolio _ Portfolio new.
	portfolio add: accountOne.
	portfolio add: accountTwo.
	
	self assert: 0 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 21:02:40'!
test02
	"Obtengo el balance luego de que una cuenta haya realizado una transaccion"
	
	| portfolio accountOne accountTwo |
	
	accountOne _ ReceptiveAccount new.
	Deposit register: 100 * peso on: accountOne.

	accountTwo _ ReceptiveAccount new.
	Deposit register: 150 * peso on: accountTwo.
	
	portfolio _ Portfolio new.
	portfolio add: accountOne.
	portfolio add: accountTwo.
	
	self assert: 250 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 21:29:26'!
test03
	"Preguntar si alguna cuenta realizó una transaccion"
	| unaTransaccion portfolio accountOne deposit |
	
	accountOne _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: accountOne.
	
	"unaTransaccion _ AccountTransaction definirTransaccion: #Deposito con: 100 * peso."
	
	portfolio _ Portfolio new.
	portfolio add: accountOne.

	self assert: (portfolio checkIfATransactionWasMadeFor: 100 * peso inConceptOf: Deposit).
	
	"
	self assert: portfolio buscarTransaccion: unaTransaccion
	
	"! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JG 6/6/2022 20:35:43'!
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JG 6/6/2022 20:01:18'!
test08
	"
	balance A = 100
	balance B = 0
	CUENTA A ENVIA 100 A CUENTA B
	balance de cuenta A = 0
	balance de cuenta B = 100
	"

	| accountOne accountTwo transfer |
	
	accountOne := ReceptiveAccount  new.
	accountTwo := ReceptiveAccount  new.
	transfer := Transfer register: 100 * peso from: accountOne to: accountTwo.

	self assert: transfer checkIfReceivedMoneyIsTheSameThatWasSent.
	self assert: transfer value equals: 100 * peso.

	self assert: -100 * peso equals: accountOne balance.
	self assert: 100 * peso equals: accountTwo balance.
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JG 6/6/2022 20:01:36'!
test09TransferBetweenSameAccount
	| accountOne transfer |
	
	accountOne := ReceptiveAccount  new.

	self should: [
		transfer := Transfer register: 100 * peso from: accountOne to: accountOne.
	]
	raise: Error 
	withExceptionDo: [
		:anError | 
		self assert: anError messageText = Transfer sameAccountErrorDescription.
	].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JG 6/6/2022 20:01:29'!
test10ReceivedMoneyIsTheSameThatWasSent
	| accountOne accountTwo transfer |
	
	accountOne := ReceptiveAccount  new.
	accountTwo := ReceptiveAccount  new.
	transfer := Transfer register: 10 * peso from: accountOne to: accountTwo.

	self assert: transfer checkIfReceivedMoneyIsTheSameThatWasSent.	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'JG 6/2/2022 21:42:34'!
applyToBalance: aBalance
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 19:35:25'!
checkIfValueIsNegative: aValue
	(aValue < 0) ifTrue: [
		self error: 'No puede ser un valor negativo'.
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!AccountTransaction class methodsFor: 'error descriptions' stamp: 'JG 6/6/2022 19:02:57'!
valueMustNotBeNegative
	^ 'No puede ser un valor negativo'.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'JG 6/6/2022 19:35:33'!
initializeFor: aValue
	self checkIfValueIsNegative: aValue.
	value := aValue! !


!Deposit methodsFor: 'value' stamp: 'JG 6/6/2022 18:43:09'!
value
	^ value.! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'JG 6/2/2022 21:42:51'!
applyToBalance: aBalance
	^ aBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'JG 6/6/2022 18:57:46'!
for: aValue
	^ self new initializeFor: aValue.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'JG 6/6/2022 19:35:45'!
initializeFor: aValue
	self checkIfValueIsNegative: aValue.
	value := aValue.! !


!Withdraw methodsFor: 'value' stamp: 'JG 6/6/2022 18:43:13'!
value
	^ value.! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'JG 6/2/2022 21:43:06'!
applyToBalance: aBalance
	^ aBalance + value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'JG 6/6/2022 18:57:42'!
for: aValue
	^ self new initializeFor: aValue.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 20:35:11'!
add: anAccount
	accounts add: anAccount.
	balance _ balance + anAccount balance.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 20:32:52'!
balance
	^ balance.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 21:06:21'!
checkIfATransactionWasMadeFor: aValue inConceptOf: aTransactionConcept

	accounts detect: [
		:anAccount |
		anAccount checkIfATransactionWasMadeFor: aValue inConceptOf: aTransactionConcept.
	]
	ifFound: [
		:anAccount |
		^true.
	]
	ifNone: [
		^ false.
	].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 20:27:34'!
initialize
	accounts _ OrderedCollection new.
	balance _ 0.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'JG 6/6/2022 20:24:45'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JG 6/2/2022 21:44:24'!
balance
	|balance|
	balance := 0.

	^ transactions sum: [ :aTransaction | 
		"(aTransaction isKindOf: Deposit) 
		ifTrue: [ aTransaction value ] 
		ifFalse: [ aTransaction value negated ]"
		
		aTransaction applyToBalance: balance 
		
	] ifEmpty: [ 0 ]. 


	"una cuenta que esta vacia no puede transferir plata a otra"
	"no puedo transfierir 0 $"
	"no puedo transferir $ < 0"
	"no puedo transferirme a mi mismo"
			
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 20:40:44'!
checkIfADepositWasMadeFor: aValue
	" crear un bucle que devuelva bool si hubo un Deposito/Withdraw con el valor aValue"
	^ true.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 20:38:10'!
checkIfATransactionWasMadeFor: aValue
	^ true.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 21:11:15'!
checkIfATransactionWasMadeFor: aValue inConceptOf: aTransactionConcept
	" get if i have a trasaction of aTransactionConcept a value"

	transactions detect: [
		:aTransaction |
		
		(aTransaction isKindOf: aTransactionConcept) and: (aTransaction value = aValue)
	]
	ifFound: [
		:aTransaction |
		^true.
	]
	ifNone: [
		^ false.
	].! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'transactionValue senderAccount receptiveAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 19:49:12'!
checkIfAreNotTheSameAccount: aSenderAccount and: aReceiverAccount
	(aSenderAccount == aReceiverAccount) ifTrue: [
		^ self error: self class sameAccountErrorDescription.
	].! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 20:01:18'!
checkIfReceivedMoneyIsTheSameThatWasSent
	^ (receptiveAccount value - senderAccount value = 0).! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 19:45:52'!
initializeRegister: aTransactionValue from: aSenderAccount to: aReceiverAccount 

	self checkIfAreNotTheSameAccount: aSenderAccount and: aReceiverAccount.
	senderAccount := Deposit register: aTransactionValue on: aReceiverAccount.
	receptiveAccount := Withdraw register: aTransactionValue on: aSenderAccount.
	transactionValue := aTransactionValue.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 18:54:20'!
value
	^transactionValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 18:40:14'!
register: aTransactionValue from: aSenderAccount to: aReceiverAccount
	^self new initializeRegister: aTransactionValue from: aSenderAccount to: aReceiverAccount.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'JG 6/6/2022 19:41:35'!
sameAccountErrorDescription
	^ 'No se puede transferir a la misma cuenta.'.! !
