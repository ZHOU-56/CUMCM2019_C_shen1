air_day.costT=costT(air_day.E);
air_day.costW=costW(air_day.E,0);
air_day.costH=costH(air_day.E,0);
air_day.sjxq=fix(air_day.sz.*air_day.costT.*air_day.costW.*air_day.costH);
air_day.clxq=fix(air_day.sjxq/2);

air_day = air_day(Today==air_day.data,:);
x=air_day.E./60
y=air_day.clxq
i=1
while i<length(x)
    if x(i)==x(i+1)
        x(i+1)=[];
        y(i)=y(i)+y(i+1);
        y(i+1)=[];
    else
    i=i+1;
    end
end

1+5.*normrnd(0,1,length(air_day.clxq),1)./100
air_day.costT=costT(air_day.E);
air_day.costW=costW(air_day.E,0);
air_day.costH=costH(air_day.E,0);
air_day.sjxq=fix(air_day.sz.*air_day.costT.*air_day.costW.*air_day.costH);
air_day.clxq=fix(air_day.sjxq/2)+1.*normrnd(0,1,length(air_day.clxq),1);
x=air_day.E./60
y1=air_day.clxq;
i=1
while i<length(x)
    if x(i)==x(i+1)
        x(i+1)=[];
        y1(i)=y1(i)+y1(i+1);
        y1(i+1)=[];
    else
    i=i+1;
    end
end
ljwc=sum(sqrt((y-y1).^2))
wcbfb=ljwc./sum(y).*100
plot(x,y,x,y1)

axis([0 24 -1 100]); 
set(gca,'xtick',0:1:24) 
set(gca,'ytick',0:10:100) 
xlabel('ʱ��');
ylabel('��������'); 
ljwc="�ۼ����������: "+num2str(ljwc)
wcbfb="�������ٷֱ�: "+num2str(wcbfb)+"%"
legend('ʵ����������ͼ','�����������������ͼ')
title("2018��4��16����������")
text(3,90,ljwc,'FontSize',20)
text(3,80,wcbfb,'FontSize',20)