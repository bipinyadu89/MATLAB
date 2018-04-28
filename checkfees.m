function sol=checkfees(x)
%x=[11 22 33 44 51 62 73 84 91 102 113 124 131 142]; %use this to check the function 
for j=1:14												
            a=floor((x(j)/10));					%this extracts job number
            b=ceil(10*((x(j)/10)-a));			%this extracts machine number 
            A(j)=a;
            if b<=0 || b>=5;
                b=randi([1 4],1);				%check if machine number falls in feasible range
            end
            B(j)=b;    
   end

  E=[1:14];										%all jobs
  
 e=1;
     for i=1:14
         if (ismember(A(i),E));					%checks if job falls in feasible range	
             e=find(E==A(i));					%reposits the position of job
             E(e)=0;							%deletes the job to avoid repitition
         else 
             for j=1:14
                 if ismember(E(j),A) || E(j)==0	%avoids repitition 
                 else							
                     A(i)=E(j);					%replace repiting job with missing job
                 end
             end
         end
         x(i)=(10*(A(i)))+B(i);					%final job sequence without repitition is obtained
     end
     sol=x;
end