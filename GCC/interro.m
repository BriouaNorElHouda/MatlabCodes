%lawel y7sb l max t3 line lewel 
%tany y7seb l min t3 line le5er  ,
%third one y7seb diagonal ?,
%last one yafficher kolech t3 lab 1, lab 2, lab 3
%matlabpool close;
%matlabpool open local 4
N=5;
M=5;
s=0;
Mat= rand(N,M)
spmd
    switch labindex
        case 1
                v=max(Mat(1, :));
                labSend(v,4);
        case 2
                w=min(Mat(N,:));
                labSend(w,4);
           
        case 3
            for i = 1:N
                s=s+Mat(i,i);
            end
            labSend(s,4);
        case 4
            disp(labReceive(1));
            disp(labReceive(2));
            disp(labReceive(3));
            
    end
end
            