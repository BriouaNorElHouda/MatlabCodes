vect = randi([-50, 50], 1, 1000)
cp=0;
cn=0;

d=distributed(vect);
spmd
    a=getLocalPart(d);
    n=size(a,2);
    for i=1:n
        if a(i)>0
            cp=cp+1;
        end
        if a(i)<0
            cn=cn+1;
        end
    end
    if labindex~=4
        labSend(cp,4);
        labSend(cn,4);
    else 
        p1=labReceive(1);
        p2=labReceive(2);
        p3=labReceive(3);
        resp=p1+p2+p3+cp;
        
       disp('res pos est ');
         disp(num2str(resp));
         
        n1=labReceive(1);
        n2=labReceive(2);
        n3=labReceive(3);
        resn=n1+n2+n3+cn;
        disp('res neg est ');
       disp(num2str(resn));
        
    end
    
end

