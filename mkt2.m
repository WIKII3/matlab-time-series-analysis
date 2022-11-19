% 求793行站点MK趋势显著性Z值
% Time Series Trend Detection Tests
% [ z, sl, lcl, ucl ] = trend( y, dt )
% where z = Mann-Kendall Statistic
% sl = Sen's Slope Estimate
% lcl = Lower Confidence Limit of sl
% ucl = Upper Confidence Limit of sl
% a行站点，b列年份
% dt = Time Interval of Data
%y是待检测数据序列
% function [ z, sl, lcl, ucl ] = mk( y )
A=xlsread('C:\Users\WIKII\Desktop\inrxday.xlsx');%读取数据
[a,b]=size(A); %确定数据的行列数为a和b
Zvalue=zeros(a,1)%构建预输出结果矩阵，a行，1列
for c=1:a%令c从1行循环至a行
    x=A(c,:);%极端指数行
    n=length(x);%计算数据系列的长度
    dt=1;
    s = 0;% calculate statistic
    for k = 1:n-1,
        for j = k+1:n,
            s = s + sign(x(j) - x(k) );
        end;
    end;
    % variance ( assuming no tied groups )
    v = ( n * ( n - 1 ) * ( 2 * n + 5 ) ) / 18;
    % test statistic
    if s == 0,
    z = 0;
    elseif s > 0,
    z = ( s - 1 ) / sqrt( v );
    else
    z = ( s + 1 ) / sqrt( v );
    end;
%the results
Zvalue(c,1)=z;
end

xlswrite('C:\Users\WIKII\Desktop\outrxday.xlsx',Zvalue,'Sheet1','A1');
disp('计算的MK估计如下：')
disp(Zvalue);

