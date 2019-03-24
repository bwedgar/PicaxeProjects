    ;pwmdiv4, C.2, 249, 499
    SYMBOL period = b2
    period=50
    SYMBOL dutyCycle=w0
    dutyCycle=0
    SYMBOL dutyCycleStep = b3
    dutyCycleStep=period*4/10 ; 1/10th possible range
    SYMBOL maxDutyCycle=b4
    maxDutyCycle= period*5/2
    SYMBOL minDutyCycle=b5
    minDutyCycle=period*3/5
    pwmout 2,period,20 
    main:
    low 1
   
    FOR dutyCycle = minDutyCycle TO maxDutyCycle STEP dutyCycleStep
	    pwmduty 2,dutyCycle
	    pause 1000
NEXT dutyCycle 
    
        FOR dutyCycle = maxDutyCycle TO minDutyCycle STEP -dutyCycleStep
	    pwmduty 2,dutyCycle
	    pause 1000
	    NEXT dutyCycle
    
     high 1
   
    FOR dutyCycle = maxDutyCycle TO minDutyCycle STEP -dutyCycleStep
	    pwmduty 2,dutyCycle
	    pause 1000
	    NEXT dutyCycle   
    
       FOR dutyCycle = minDutyCycle TO maxDutyCycle STEP dutyCycleStep
	    pwmduty 2,dutyCycle
	    pause 1000
	    NEXT dutyCycle   
    
    goto main
    
    
    pause 2000
    input 1
    ;pwmout 2,OFF
    ;pwmout pwmdiv4, C.2, 249, 0
    pwmduty 2,0 ;pwmout C.2,OFF ;
    input 2
    pause 2000
    low 1
    high 2
    pwmduty 2,50 
    ;pwmout pwmdiv64,2,55, 498
    ;pwmout 2,62,60
    pause 2000
    pwmduty 2,0
    input 1
    pause 2000
    goto main