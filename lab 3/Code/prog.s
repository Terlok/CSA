ENTRY              
                   LDR     R0, =ASize
                   LDR     R1, [R0]
                   LDR     R2, =Array
                   MOV     R3, #0
                   MOV     R4, #0
                   MOV     R5, #0

compareLoop        
                   CMP     R3, R1
                   BEQ     endLoop

                   LDR     R6, [R2, R3, LSL #2]
                   MOV     R7, R6

calculateRemainder 
                   CMP     R7, #5
                   BLT     checkRemainder
                   SUB     R7, R7, #5
                   B       calculateRemainder

checkRemainder     
                   CMP     R7, #1
                   BEQ     addToSum
                   CMP     R7, #2
                   BEQ     addToSum

nextElement        
                   ADD     R3, R3, #1
                   B       compareLoop

addToSum           
                   ADD     R4, R4, R6
                   ADD     R5, R5, #1
                   B       nextElement

endLoop            
                   CMP     R5, #0
                   BEQ     storeZero

                   MOV     R0, R4
                   MOV     R1, R5
                   MOV     R2, #0
                   MOV     R3, #0

calculateAverage   
                   CMP     R1, #0
                   BEQ     storeAverage

divisionLoop       
                   CMP     R0, R1
                   BLT     storeAverage
                   SUB     R0, R0, R1
                   ADD     R2, R2, #1
                   B       divisionLoop

storeAverage       
                   LDR     R0, =Result
                   STR     R2, [R0]
                   B       stopExecution

storeZero          
                   MOV     R2, #0
                   LDR     R0, =Result
                   STR     R2, [R0]
                   B       stopExecution

stopExecution      
                   B       stopExecution 

ASize              DCD     6
Array              DCD     3, 7, 12, 21, 26, 31
Result             DCD     0
