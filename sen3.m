% sl=Sen's Slope Estimate 求6列指数的slope值
A=xlsread('C:\Users\WIKII\Desktop\try.xlsx')% 读取样本数据
[a,b]=size(A); %确定数据的行列数为a和b
Senslope=zeros(1,b)%构建预输出结果矩阵，a行，1列
for c=1:b%令c从1行循环至a行
    x=A(:,c);%极端指数行
    n=length(x);%计算数据系列的长度
    ndash=n*(n-1)/2;
    s=zeros(ndash,1);
    i=1;
    for k=1:n-1,
        for j=k+1:n,
            s(i)=(x(j)-x(k))/(j-k);
            i=i+1;
        end;
    end;
%the estimate
sl=median(s);
Senslope(1,c)=sl;
end
disp('计算的Sen斜率估计如下：')
disp(Senslope);