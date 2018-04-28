function s=PrecedenceCheck(a,G)
St=zeros;
Pr=xlsread('Preceed.xlsx');
p=find(Pr(:,1)==a);
            pre1=Pr(p,2);
            pre2=Pr(p,3);
            Prep1=p;
            Prep2=p;
            if pre1~=0 || pre2~=0
                while pre1~=0
                   
                    Prep1(length(Prep1)+1)=pre1;
                    p=pre1;
                    p=find(Pr(:,1)==pre1);
                    pre1=Pr(p,2);
                end
                while pre2~=0
                    Prep2(length(Prep2)+1)=pre2;
                    p=pre2;
                    p=find(Pr(:,1)==pre2);
                    pre2=Pr(p,3);
                end
                Prep1=fliplr(Prep1);
                Prep2=fliplr(Prep2);
                len1=length(Prep1);
                len2=length(Prep2);
                Srep1=zeros([1 len1]);
                Srep2=zeros([1 len2]);
                for i=1:len1
                        if i-1==0
                            Srep1(i)=0;
                        else
                        Srep1(i)=Srep1(i-1)+max(G(Prep1(i),:));
                        end
                end
                for i=1:len2
                        if i-1==0
                            Srep2(1)=0;
                        else
                        Srep2(i)=Srep2(i-1)+max(G(Prep1(i),:));
                        end
                end
                  St=max(max(Srep1),max(Srep2));  
            end
            s=St;
end