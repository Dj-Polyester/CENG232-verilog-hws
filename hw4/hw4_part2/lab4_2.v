`timescale 1ns / 1ps
module PharmacyMem(
	input [4:0] studentID ,
    input clk,
    input [1:0] mode , // 0: list, 2: checkIn, 3: delete
    input [7:0] checkInTime,
    output reg [4:0] listOutput,
    output reg listBusy ,
    output reg ready
	);

reg [12:0] heap [0:10]; //ID-checkinTime
reg [4:0] num_of_lmn, capacity;
reg [4:0] counter;
reg finished;
//percdown
reg [4:0] percDownHole;
reg [12:0] percDownTmp;
reg [4:0] child;
//insert
reg [4:0] insertHole;
reg [12:0] insertTmp;
reg i,k;
reg [4:0] j;
initial begin
    finished = 0;
    ready = 0;
    listBusy = 1;
    counter = 1;

    capacity = 10;
    num_of_lmn = 0;
    for (j = 0;j<11 ; j=j+1) begin
        heap[j] = 13'b0;
    end
    percDownHole = 0;
    insertHole = 0;
    child = 0;
    percDownTmp = 13'b0;
    insertTmp = 13'b0;
end

task percDown;
    input mole;
    begin
        i=1;
        percDownTmp = heap[ mole ];
        percDownHole = mole;
        while ((i!==0) && ((percDownHole << 1) <= num_of_lmn)) begin
    
            child = (percDownHole << 1);
            if( (child !== num_of_lmn) && (heap[child + 1][7:0] < heap[child][7:0]))
               child=child+1;
            if( heap[ child ][7:0] < percDownTmp[7:0] )
               heap[ percDownHole ] = heap[ child ];
            else begin
        
                i=0;
        
            end
            if (i)
                percDownHole = child;
        end

        heap[ percDownHole ] = percDownTmp;
    end
endtask

task insert;
    input [4:0] ID;
    input [7:0] checkIn;
    begin
        insertTmp = {ID,checkIn};
        heap[0]=insertTmp;
        
        num_of_lmn = num_of_lmn+1;
        //percolate up
        //compare checkIns
        for(insertHole = num_of_lmn ; checkIn < heap[ insertHole >> 1 ][7:0]; insertHole = insertHole >> 1 )
          heap[ insertHole ] = heap[ insertHole >> 1 ];
        
        heap[ insertHole ] = insertTmp;
    end
endtask

task delMin;
    begin
        if (num_of_lmn > 0)
        begin
          heap[1] = heap[ num_of_lmn ];
    
          heap[ num_of_lmn ] = 0;
          num_of_lmn = num_of_lmn-1;
    
          percDown(1);
        end
    end
endtask

always @(posedge clk) 
begin
    case(mode)
        2'b10: 
        begin//checkin mode
            ready = 1;
            listBusy = 0;
            
        if (num_of_lmn < capacity) begin
                insert(studentID,checkInTime); 
            end
        end
        2'b11: 
        begin//delete min mode
            ready = 1;
            listBusy = 0;
            
            delMin;
        end
        2'b00: 
        begin//list mode
            //empty
            
            if (num_of_lmn === 0) 
            begin
                ready = 1;
                listBusy = 0;
            end
            else 
            begin
                if (finished === 1) 
                begin
                    finished = 0;
                    ready = 1;
                    listBusy = 0;
                end
                else
                begin
                    //restart
                    if (ready === 1) 
                    begin
                
                        ready = 0;
                        listBusy = 1;
                        counter = 1;
                    end 
                    else 
                    begin
                
                        k=1;
                        while (k && counter !== (num_of_lmn+1)) 
                        begin
                            if (heap[counter][12:8] != 5'b0) 
                            begin
                                listOutput = heap[counter][12:8];
                                counter = counter+1;
                                k=0;
                            end
                            else
                                counter = counter+1;
                        end
                        if (counter === (num_of_lmn+1)) 
                        begin
                            finished = 1;
                        end
                    end
                end 
            end   
        end 
    endcase
end
endmodule
