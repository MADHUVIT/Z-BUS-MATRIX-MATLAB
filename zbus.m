n=input('Enter the number of buses:');
m=input('Enter how many impedance  connected to reference:')
w=input('Enter how many impedance btween  two existing buses');
zr=zeros(m,1);
for k=1:m
    zr(k)=input('Impedence between new bus and to the reference:');
end
zb=zeros(n-1,1);
for k=1:n-1   
fprintf('Enter the impedance between'); fprintf('%d',k); fprintf('and'); fprintf('%d',k);fprintf('\n');   
zb(k)=input('zb=');
end
zbr=[zr(1);zb;zr(2)];  % modify according to the circuit
zn1=zbr(1);
for k=1:(n-1)+(m-1)
zn2=[[zn1;zn1(end,:)],[zn1(:,end);zn1(end)+zbr(k+1)]];
zn1=zn2;
end
disp(zn2);
s=size(zn2);
if(s>n)
    fprintf('Z new size is greater than'); fprintf('%d',n);fprintf('x');fprintf('%d',n);fprintf('\n');
    zn3=zeros(n);
    for k=1:3
        for q=1:3
            zn3(k,q)=zn2(k,q)-(zn2(k,end)*zn2(end,q))/zn2(end,end);
        end
    end
end
disp(zn3);
z=zeros(m,3);

for k=1:w
    z(k,:)=input('Enter the impedance value and between what buses:[z,bus no.,bus no]:');
    zn4=[[zn3;[zn3(z(k,2),:)]-[zn3(z(k,3),:)]],[[zn3(:,z(k,2))-zn3(:,z(k,3))];[zn3(z(k,2),z(k,2))+zn3(z(k,3),z(k,3))-2*zn3(z(k,2),z(k,3))+z(k,1)]]];
    if(size(zn4,1)>3)
        for k=1:3
            for q=1:3
                 zn5(k,q)=zn4(k,q)-(zn4(k,end)*zn4(end,q))/zn4(end,end);
        end
    end
end
    zn3=zn5;
    
end
disp('Z bus matrix for a given circuit:')
disp(zn5);

    
    
            

