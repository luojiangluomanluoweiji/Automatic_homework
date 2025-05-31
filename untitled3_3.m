% 定义自然频率
wn = 1;

% 定义阻尼比范围
xi_values = 0.1:0.1:1;

% 定义时间范围
t = 0:0.01:10;

% 创建图形窗口
figure;

% 循环计算不同阻尼比下的阶跃响应
for xi = xi_values
    % 定义二阶系统传递函数
    phi = tf([wn^2], [1 2*xi*wn wn^2]);
    
    % 计算阶跃响应
    y = step(phi, t);
    
    % 绘制响应曲线
    plot(t, y, 'DisplayName', ['\xi=' num2str(xi)]);
    hold on;
end

% 添加图例和标签
legend;
xlabel('时间 (秒)');
ylabel('幅值');
title('二阶系统的阶跃响应（不同阻尼比）');
grid on;