!classDefinition: #CoffeeShopTest category: 'AlgoIII-2020-2C-1Parcial'!
TestCase subclass: #CoffeeShopTest
	instanceVariableNames: 'billGates adaLovelace alanKay salesSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopTest methodsFor: 'setUp/tearDown' stamp: 'war 5/18/2022 13:29:17'!
setUp

	adaLovelace := GoldCustomer withName: 'Ada Lovelace'.
	alanKay := SilverCustomer withName: 'Alan Kay'.
	billGates := NormalCustomer withName: 'Bill Gates'.! !


!CoffeeShopTest methodsFor: 'test objects' stamp: 'war 5/18/2022 12:38:13'!
combo1

	^Combo1 new.! !

!CoffeeShopTest methodsFor: 'test objects' stamp: 'war 5/18/2022 12:38:20'!
combo2

	^Combo2 new.! !


!CoffeeShopTest methodsFor: 'tests - sales' stamp: 'LL 9/22/2020 21:41:51'!
test01ThereAreNoSalesWhenSalesSystemIsCreated

	salesSystem := CoffeeShopSalesSystem new.

	self assert: (salesSystem salesMadeTo: adaLovelace) isEmpty! !

!CoffeeShopTest methodsFor: 'tests - sales' stamp: 'war 5/18/2022 11:07:34'!
test02CanQuerySalesByCustomer

	"| salesToAdaLovelace |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	
	self assertingSalesMadeToACostumer: adaLovelace AreANumber: 1 AndOfACombo: [ self combo1 ]. 
	
	"salesToAdaLovelace := salesSystem salesMadeTo: adaLovelace.
	self assert: 1 equals: salesToAdaLovelace size.
	self assert: 1 equals: (salesToAdaLovelace count: [ :aProduct | aProduct = self combo1 ])"! !

!CoffeeShopTest methodsFor: 'tests - sales' stamp: 'war 5/18/2022 11:07:34'!
test03SalesAreDistinguishedByCustomer

	"| salesToAdaLovelace salesToAlanKay |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: alanKay of: self combo2.

	self assertingSalesMadeToACostumer: adaLovelace AreANumber: 2 AndOfACombo: [ self combo1 ].
	
	self assertingSalesMadeToACostumer: alanKay AreANumber: 1 AndOfACombo: [ self combo2 ]. 

	"salesToAdaLovelace := salesSystem salesMadeTo: adaLovelace.
	self assert: 2 equals: salesToAdaLovelace size.
	self assert: 2 equals: (salesToAdaLovelace count: [ :aProduct | aProduct = self combo1 ]).

	salesToAlanKay := salesSystem salesMadeTo: alanKay.
	self assert: 1 equals: salesToAlanKay size.
	self assert: 1 equals: (salesToAlanKay  count: [ :aProduct | aProduct = self combo2 ])"! !


!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'war 5/18/2022 11:09:40'!
test04VolumeSoldToCustomerIsZeroWhenCustomerHasNoSaleRegistered

	"| volumeSoldToCustomer |"

	salesSystem := CoffeeShopSalesSystem new.
		
	self assertingAVolumeSoldToACostumer: adaLovelace WithAVolume: 0*milliliter .
	
	"volumeSoldToCustomer := salesSystem volumeSoldTo: adaLovelace.

	self assert: 0*milliliter equals: volumeSoldToCustomer"! !

!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'war 5/18/2022 11:10:26'!
test05VolumeIs_250_WhenOnlyCombo1WasSoldToCustomer

	"| volumeSoldToCustomer |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	
	self assertingAVolumeSoldToACostumer: adaLovelace WithAVolume: 250*	milliliter .
	
	"volumeSoldToCustomer := salesSystem volumeSoldTo: adaLovelace.

	self assert: 250*milliliter equals: volumeSoldToCustomer "! !

!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'war 5/18/2022 11:11:14'!
test06VolumeIs_100_WhenOnlyCombo2WasSoldToCustomer

	"| volumeSoldToCustomer |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo2.
	
	self assertingAVolumeSoldToACostumer: adaLovelace WithAVolume: 100*milliliter .
	
	"volumeSoldToCustomer := salesSystem volumeSoldTo: adaLovelace.

	self assert: 100*milliliter equals: volumeSoldToCustomer"! !

!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'war 5/18/2022 11:12:37'!
test07VolumeSoldToCustomerIsTheSumOfAllSoldProducts

	"| volumeSoldToCustomer |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo2.
	
	self assertingAVolumeSoldToACostumer: adaLovelace WithAVolume: ( 250*milliliter ) + ( 100*milliliter ) .
	
	"volumeSoldToCustomer := salesSystem volumeSoldTo: adaLovelace.

	self assert: (250*milliliter)+(100*milliliter) equals: volumeSoldToCustomer "! !


!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'LL 9/22/2020 21:48:39'!
test08NoRewardExpectedWhenCustomerHasNotBuyAnything

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem rewardOf: adaLovelace ifNone: [ ^self ].
	
	self failWith: 'No reward expected when customer has not buy anything'! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'war 5/18/2022 11:27:13'!
test09GoldCustomerGetsRewardedWithOneCombo2With50PercentItsPriceWhenRule1Holds

	"| adaLovelaceReward |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo2.
	
	self assertingRewardRule1ToACustomer: adaLovelace withAPrice: 60*peso .
	
	"adaLovelaceReward := salesSystem rewardOf: adaLovelace ifNone: [ self fail ].

	self assert: 1 equals: adaLovelaceReward quantity.
	self assert: adaLovelaceReward isForCombo2.
	self assert: 60*peso equals: adaLovelaceReward price."
! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'war 5/18/2022 11:28:03'!
test10SilverCustomerGetsRewardedWithOneCombo2With75PercentItsPriceWhenRule1Holds

	"| alaKayReward |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: alanKay of: self combo1.
	salesSystem registerSaleTo: alanKay of: self combo2.
	
	self assertingRewardRule1ToACustomer: alanKay withAPrice: 120*3/4*peso .
	
	"alaKayReward := salesSystem rewardOf: alanKay ifNone: [ self fail ].

	self assert: 1 equals: alaKayReward quantity.
	self assert: alaKayReward isForCombo2.
	self assert: 120*3/4*peso equals: alaKayReward price."
! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'war 5/18/2022 11:28:49'!
test11NormalCustomerGetsRewardedWithOneCombo2With90PercentItsPriceWhenRule1Holds

	"| billGatesReward |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: billGates of: self combo1.
	salesSystem registerSaleTo: billGates of: self combo2.
	
	self assertingRewardRule1ToACustomer: billGates withAPrice: 120*9/10*peso . 
	
	"billGatesReward := salesSystem rewardOf: billGates ifNone: [ self fail ].

	self assert: 1 equals: billGatesReward quantity.
	self assert: billGatesReward isForCombo2.
	self assert: 120*9/10*peso equals: billGatesReward price."
! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'war 5/18/2022 11:31:42'!
test12GoldCustomerGetsRewardedWithOneCombo1At75PesosWhenRule2Holds

	"| adaLovelaceReward |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo2.
	
	self assertingRewardRule2ToACustomer: adaLovelace withAPrice: 75*peso .
	
	"adaLovelaceReward := salesSystem rewardOf: adaLovelace ifNone: [ self fail ].

	self assert: 2 equals: adaLovelaceReward quantity.
	self assert: adaLovelaceReward isForCombo1.
	self assert: 75*peso equals: adaLovelaceReward price."
! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'war 5/18/2022 11:32:21'!
test13SilverCustomerGetsRewardedWithOneCombo1At83PesosWhenRule2Holds

	"| alanKayReward |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: alanKay of: self combo1.
	salesSystem registerSaleTo: alanKay of: self combo1.
	salesSystem registerSaleTo: alanKay of: self combo2.
	
	self assertingRewardRule2ToACustomer: alanKay withAPrice: 83*peso .
	
	"alanKayReward := salesSystem rewardOf: alanKay ifNone: [ self fail ].

	self assert: 2 equals: alanKayReward quantity.
	self assert: alanKayReward isForCombo1.
	self assert: 83*peso equals: alanKayReward price."
! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'war 5/18/2022 11:33:08'!
test14NormalCustomerGetsRewardedWithOneCombo1At97PesosWhenRule2Holds

	"| billGatesReward |"

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: billGates of: self combo1.
	salesSystem registerSaleTo: billGates of: self combo1.
	salesSystem registerSaleTo: billGates of: self combo2.
	
	self assertingRewardRule2ToACustomer: billGates withAPrice: 97*peso .
	
	"billGatesReward := salesSystem rewardOf: billGates ifNone: [ self fail ].

	self assert: 2 equals: billGatesReward quantity.
	self assert: billGatesReward isForCombo1.
	self assert: 97*peso equals: billGatesReward price."
! !


!CoffeeShopTest methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 11:07:56'!
assertingAVolumeSoldToACostumer: aCustomer WithAVolume: aVolume

| volumeSoldToCustomer |

volumeSoldToCustomer := salesSystem volumeSoldTo: aCustomer.

self assert: aVolume equals: volumeSoldToCustomer! !

!CoffeeShopTest methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 11:26:24'!
assertingRewardRule1ToACustomer: aCostumer withAPrice: aPrice

| costumerReward |

costumerReward := salesSystem rewardOf: aCostumer ifNone: [ self fail ].

	self assert: 1 equals: costumerReward quantity.
	self assert: costumerReward isForCombo2.
	self assert: aPrice equals: costumerReward price.! !

!CoffeeShopTest methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 11:30:56'!
assertingRewardRule2ToACustomer: aCostumer withAPrice: aPrice

| costumerReward |

costumerReward := salesSystem rewardOf: aCostumer ifNone: [ self fail ].

	self assert: 2 equals: costumerReward quantity.
	self assert: costumerReward isForCombo1.
	self assert: aPrice equals: costumerReward price.! !

!CoffeeShopTest methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 12:38:54'!
assertingSalesMadeToACostumer: aCustomer AreANumber: aNumber AndOfACombo: aCombo

| salesToACustomer |

salesToACustomer := salesSystem salesMadeTo: aCustomer.
	self assert: aNumber equals: salesToACustomer size.
	self assert: aNumber equals: (salesToACustomer count: [ :aProduct | aProduct = aCombo value ]).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopTest class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopTest class
	instanceVariableNames: 'alanKay adaLovelace billGates'!


!classDefinition: #CoffeeShopCustomer category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopCustomer
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopCustomer methodsFor: 'initialization' stamp: 'war 5/18/2022 13:19:11'!
initializeNamed: aName 

	self subclassResponsibility .! !


!CoffeeShopCustomer methodsFor: 'printing' stamp: 'war 5/18/2022 15:34:47'!
printOn: aStream

	aStream
		nextPutAll: 'Customer named ';
		nextPutAll: name! !


!CoffeeShopCustomer methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 14:42:55'!
retornaNombre

	^ name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopCustomer class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer class
	instanceVariableNames: ''!

!CoffeeShopCustomer class methodsFor: 'instance creation' stamp: 'war 5/18/2022 15:43:11'!
withName: aName

	self subclassResponsibility .! !


!classDefinition: #GoldCustomer category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer subclass: #GoldCustomer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!GoldCustomer methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 13:54:16'!
initializeNamed: aName 

	name := aName .
	
	combo1RewardPrice := 75*peso .
	
	combo2RewardDiscount := 1/2 .! !

!GoldCustomer methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 15:01:21'!
rewardPriceFor: aReward

	^ aReward rewardPriceForGoldCostumer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GoldCustomer class' category: 'AlgoIII-2020-2C-1Parcial'!
GoldCustomer class
	instanceVariableNames: ''!

!GoldCustomer class methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 14:58:14'!
withName: aName
	
	^self new initializeNamed: aName .! !


!classDefinition: #NormalCustomer category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer subclass: #NormalCustomer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!NormalCustomer methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 13:53:25'!
initializeNamed: aName 

	name := aName .
	
	combo1RewardPrice := 97*peso.
	
	combo2RewardDiscount := 9/10 .! !

!NormalCustomer methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 15:01:43'!
rewardPriceFor: aReward

	^ aReward rewardPriceForNormalCostumer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NormalCustomer class' category: 'AlgoIII-2020-2C-1Parcial'!
NormalCustomer class
	instanceVariableNames: ''!

!NormalCustomer class methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 15:46:22'!
withName: aName
	
	^self new initializeNamed: aName .! !


!classDefinition: #SilverCustomer category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer subclass: #SilverCustomer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!SilverCustomer methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 13:54:34'!
initializeNamed: aName 

	name := aName .
	
	combo1RewardPrice := 83*peso .
	
	combo2RewardDiscount := 3/4! !

!SilverCustomer methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 15:01:54'!
rewardPriceFor: aReward

	^ aReward rewardPriceForSilverCostumer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SilverCustomer class' category: 'AlgoIII-2020-2C-1Parcial'!
SilverCustomer class
	instanceVariableNames: ''!

!SilverCustomer class methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 15:46:28'!
withName: aName
	
	^self new initializeNamed: aName .! !


!classDefinition: #CoffeeShopReward category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopReward
	instanceVariableNames: 'price quantity product'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopReward methodsFor: 'accessing' stamp: 'LL 9/20/2020 17:54:42'!
price

	^price! !

!CoffeeShopReward methodsFor: 'accessing' stamp: 'LL 9/21/2020 16:31:13'!
quantity

	^quantity ! !


!CoffeeShopReward methodsFor: 'initialization' stamp: 'LL 9/22/2020 19:08:08'!
initializeOf: aProduct at: aPrice quantity: aQuantity

	product := aProduct.
	price := aPrice.
	quantity := aQuantity
	! !


!CoffeeShopReward methodsFor: 'testing' stamp: 'war 5/18/2022 15:48:35'!
isForCombo1
	
	^product = Combo1 new! !

!CoffeeShopReward methodsFor: 'testing' stamp: 'war 5/18/2022 15:48:39'!
isForCombo2
	
	^product = Combo2 new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopReward class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopReward class
	instanceVariableNames: ''!

!CoffeeShopReward class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 17:53:14'!
of: aComboType at: aPrice quantity: aQuantity

	^self new initializeOf: aComboType at: aPrice quantity: aQuantity
! !


!classDefinition: #CoffeeShopSalesSystem category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopSalesSystem
	instanceVariableNames: 'sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopSalesSystem methodsFor: 'product volume' stamp: 'war 5/18/2022 12:56:14'!
volumeOf: aProduct

	^aProduct volume.
	"aProduct = #Combo2 ifTrue: [ ^100*milliliter ]"

	"self error: 'Invalid product'"
	! !


!CoffeeShopSalesSystem methodsFor: 'initialization' stamp: 'LL 9/20/2020 17:17:34'!
initialize

	sales := Dictionary new! !


!CoffeeShopSalesSystem methodsFor: 'selling' stamp: 'war 5/18/2022 14:51:49'!
registerSaleTo: aCustomer of: aProduct

	| salesToCustomer |

	salesToCustomer := sales at: (aCustomer retornaNombre) ifAbsentPut: [ OrderedCollection new ].
	salesToCustomer add: aProduct . ! !

!CoffeeShopSalesSystem methodsFor: 'selling' stamp: 'war 5/18/2022 15:08:14'!
salesMadeTo: aCustomer

	^sales at: aCustomer retornaNombre ifAbsent: [ #() ]! !

!CoffeeShopSalesSystem methodsFor: 'selling' stamp: 'war 5/18/2022 12:50:28'!
volumeSoldTo: aCustomer

	 ^(self salesMadeTo: aCustomer) sum: [ :aProduct | self volumeOf: aProduct ] ifEmpty: [ 0*milliliter ]! !


!CoffeeShopSalesSystem methodsFor: 'rewarding' stamp: 'LL 9/22/2020 19:53:42'!
rewardOf: aCustomer ifNone: noneBlock 

	| salesToCustomer volumeSoldToCustomer rewardRule |

	salesToCustomer := self salesMadeTo: aCustomer.
	volumeSoldToCustomer := self volumeSoldTo: aCustomer.
	
	rewardRule := RewardRule for: volumeSoldToCustomer ifNone: [^noneBlock value].
	^rewardRule createRewardFor: aCustomer.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopSalesSystem class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopSalesSystem class
	instanceVariableNames: ''!

!CoffeeShopSalesSystem class methodsFor: 'initialization' stamp: 'LL 9/23/2020 08:50:03'!
initialize

	Smalltalk at: #milliliter put: (BaseUnit named: 'milliliter')! !


!classDefinition: #Combo category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #Combo
	instanceVariableNames: 'volume price'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 12:46:48'!
= anObject

	^ self class = anObject class! !

!Combo methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 12:14:01'!
initialize

	self subclassResponsibility .! !

!Combo methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 13:40:52'!
price
	
	^ price .! !

!Combo methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 12:14:23'!
volume

	^ volume .! !


!classDefinition: #Combo1 category: 'AlgoIII-2020-2C-1Parcial'!
Combo subclass: #Combo1
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo1 methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 13:39:56'!
initialize

	volume := 250*milliliter .
	
	price := 150*peso.! !


!classDefinition: #Combo2 category: 'AlgoIII-2020-2C-1Parcial'!
Combo subclass: #Combo2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo2 methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 13:40:18'!
initialize

	volume := 100*milliliter . 
	
	price := 120*peso .! !


!classDefinition: #RewardRule category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #RewardRule
	instanceVariableNames: 'product'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!RewardRule methodsFor: 'reward creation' stamp: 'war 5/20/2022 15:04:53'!
createRewardFor: aCustomer 
	
	| price |
	
	product := self rewardedProduct.
	price := aCustomer rewardPriceFor: self.
	
	^CoffeeShopReward of: product at: price quantity: self productQuantity! !

!RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 10:51:26'!
productQuantity

	self subclassResponsibility ! !

!RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 10:51:33'!
rewardedProduct

	self subclassResponsibility ! !


!RewardRule methodsFor: 'product price' stamp: 'war 5/18/2022 13:41:20'!
priceOf: aProduct

	^ aProduct price! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RewardRule class' category: 'AlgoIII-2020-2C-1Parcial'!
RewardRule class
	instanceVariableNames: ''!

!RewardRule class methodsFor: 'testing' stamp: 'LL 9/22/2020 19:53:22'!
isFor: volumeSoldToCustomer 
		
	self subclassResponsibility ! !


!RewardRule class methodsFor: 'instance creation' stamp: 'LL 9/22/2020 19:53:42'!
for: volumeSoldToCustomer ifNone: aNoneBlock

	^self subclasses 
		detect: [ :aRuleClass | aRuleClass isFor: volumeSoldToCustomer ] 
		ifFound: [ :aRuleClass | aRuleClass new ]
		ifNone: aNoneBlock ! !


!classDefinition: #Combo1RewardRule category: 'AlgoIII-2020-2C-1Parcial'!
RewardRule subclass: #Combo1RewardRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo1RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 19:54:35'!
productQuantity
	
	^2! !

!Combo1RewardRule methodsFor: 'reward creation' stamp: 'war 5/18/2022 13:04:29'!
rewardedProduct
	
	^ Combo1 new! !


!Combo1RewardRule methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 14:58:23'!
rewardPriceForGoldCostumer

	^75*peso! !

!Combo1RewardRule methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 14:58:36'!
rewardPriceForNormalCostumer

	^ 97*peso! !

!Combo1RewardRule methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 14:58:51'!
rewardPriceForSilverCostumer

	^ 83*peso! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combo1RewardRule class' category: 'AlgoIII-2020-2C-1Parcial'!
Combo1RewardRule class
	instanceVariableNames: ''!

!Combo1RewardRule class methodsFor: 'testing' stamp: 'LL 9/22/2020 19:53:22'!
isFor: volumeSoldToCustomer 

	^volumeSoldToCustomer > (500*milliliter)! !


!classDefinition: #Combo2RewardRule category: 'AlgoIII-2020-2C-1Parcial'!
RewardRule subclass: #Combo2RewardRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo2RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 10:23:07'!
productQuantity

	^1! !

!Combo2RewardRule methodsFor: 'reward creation' stamp: 'war 5/18/2022 13:59:13'!
rewardedProduct
	
	^ Combo2 new! !


!Combo2RewardRule methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 14:59:54'!
rewardPriceForGoldCostumer

	^product price/2! !

!Combo2RewardRule methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 15:00:23'!
rewardPriceForNormalCostumer

	^product price *9/10! !

!Combo2RewardRule methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 15:00:07'!
rewardPriceForSilverCostumer

	^product price*3/4! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combo2RewardRule class' category: 'AlgoIII-2020-2C-1Parcial'!
Combo2RewardRule class
	instanceVariableNames: ''!

!Combo2RewardRule class methodsFor: 'testing' stamp: 'LL 9/22/2020 19:53:22'!
isFor: volumeSoldToCustomer 

	^volumeSoldToCustomer between: 300*milliliter and: 500*milliliter
	! !

CoffeeShopSalesSystem initialize!