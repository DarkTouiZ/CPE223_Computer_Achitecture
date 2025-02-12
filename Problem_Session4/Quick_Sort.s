               ;******************************************
               ;       QuickSort Implementation for VisUAL2
               ;       This program implements QuickSort algorithm to sort an array in ascending order
               ;******************************************

               ;******************************************
               ;       Data Section
               ;******************************************
array          DCD     10, 12, 8, 1, 5, 7, 11, 6, 8 ; DCD (Define Constant Data) - Define array to be sorted
length         EQU     9 ; EQU (Equate) - Array length constant

               ;******************************************
               ;       Program Start
               ;******************************************
start          
               ;       Initialize registers for QuickSort
               LDR     R0, =array ; LDR (Load Register) - R0 = Base address of array
               MOV     R1, #0 ; MOV (Move) - R1 = Starting index (0)
               MOV     R2, #8 ; MOV (Move) - R2 = Ending index (length-1)
               BL      quicksort ; BL (Branch with Link) - Call QuickSort subroutine and save return address
               B       stop ; B (Branch) - After sorting, end program

               ;******************************************
               ;       QuickSort Subroutine
               ;       Parameters:
               ;       R0 = Array base address
               ;       R1 = Low index
               ;       R2 = High index
               ;******************************************
quicksort      
               ;       Save registers that will be modified
               STMFD   SP!, {R0-R3, LR} ; STMFD (Store Multiple Full Descending) - Push R0-R3 and link register to stack

               ;       Check if partition size is valid
               CMP     R1, R2 ; CMP (Compare) - Compare low and high indices
               BGE     done ; BGE (Branch if Greater or Equal) - If low >= high, partition is done

               ;       Initialize partition
               MOV     R3, R1 ; MOV (Move) - R3 = Partition index (start with low)
               ADD     R12, R1, #1 ; ADD (Addition) - R12 = Current index (start with low + 1)

               ;******************************************
               ;       Partition Loop
               ;       This section divides array into two parts
               ;       Elements < pivot go to left, > pivot go to right
               ;******************************************
partition_loop 
               ;       Check if we've processed all elements
               CMP     R12, R2 ; CMP (Compare) - Compare current index with high
               BGT     partition_done ; BGT (Branch if Greater Than) - If finished scanning, exit loop

               ;       Load and compare elements
               LDR     R4, [R0, R12, LSL #2] ; LDR (Load Register) with LSL (Logical Shift Left) - R4 = Current element
               ;       Address = base + (current_index × 4)
               LDR     R5, [R0, R1, LSL #2] ; LDR (Load Register) with LSL (Logical Shift Left) - R5 = Pivot element
               ;       Address = base + (low_index × 4)

               ;       Compare with pivot
               CMP     R4, R5 ; CMP (Compare) - Compare current element with pivot
               BGE     next_element ; BGE (Branch if Greater or Equal) - If current >= pivot, skip swap

               ;       Swap elements if current < pivot
               ADD     R3, R3, #1 ; ADD (Addition) - Increment partition index
               LDR     R6, [R0, R3, LSL #2] ; LDR (Load Register) - Load element at partition index
               STR     R4, [R0, R3, LSL #2] ; STR (Store Register) - Store current element at partition
               STR     R6, [R0, R12, LSL #2] ; STR (Store Register) - Store swapped element at current position

next_element   
               ADD     R12, R12, #1 ; ADD (Addition) - Move to next element
               B       partition_loop ; B (Branch) - Continue partitioning

               ;******************************************
               ;       Partition Completion
               ;       Place pivot in its final position
               ;******************************************
partition_done 
               ;       Swap pivot to its correct position
               LDR     R4, [R0, R1, LSL #2] ; LDR (Load Register) - Load pivot
               LDR     R5, [R0, R3, LSL #2] ; LDR (Load Register) - Load element at partition
               STR     R5, [R0, R1, LSL #2] ; STR (Store Register) - Store partition element at pivot position
               STR     R4, [R0, R3, LSL #2] ; STR (Store Register) - Store pivot at partition position

               ;       Save partition position
               MOV     R12, R3 ; MOV (Move) - Store partition position in R12

               ;******************************************
               ;       Recursive Sort of Left Partition
               ;******************************************
               STMFD   SP!, {R1, R2} ; STMFD (Store Multiple Full Descending) - Save current bounds
               SUB     R2, R12, #1 ; SUB (Subtract) - Set high index to (partition - 1)
               BL      quicksort ; BL (Branch with Link) - Recursively sort left partition
               LDMFD   SP!, {R1, R2} ; LDMFD (Load Multiple Full Descending) - Restore bounds

               ;******************************************
               ;       Recursive Sort of Right Partition
               ;******************************************
               ADD     R1, R12, #1 ; ADD (Addition) - Set low index to (partition + 1)
               BL      quicksort ; BL (Branch with Link) - Recursively sort right partition

               ;******************************************
               ;       QuickSort Completion
               ;******************************************
done           
               LDMFD   SP!, {R0-R3, PC} ; LDMFD (Load Multiple Full Descending) - Restore registers and return

               ;******************************************
               ;       Program End
               ;******************************************
stop           
               MOV     R0, #0 ; MOV (Move) - Clear R0 (optional cleanup)
               B       stop ; B (Branch) - End program with infinite loop

               END     ; End of program