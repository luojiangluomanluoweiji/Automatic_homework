function untitled3_5(sys)
    % 获取系统的时间范围
    t = linspace(0, 10, 1000); % 定义时间范围，从0到10秒，1000个点

    % 定义单位斜坡输入
    u = t;

    % 计算系统的响应
    y = lsim(sys, u, t);

    % 绘制输入和输出曲线
    figure;
    plot(t, u, 'b-', 'LineWidth', 1.5, 'DisplayName', '输入斜坡');
    hold on;
    plot(t, y, 'r--', 'LineWidth', 1.5, 'DisplayName', '系统响应');
    hold off;

    % 添加图例和标签
    legend;
    xlabel('时间 (秒)');
    ylabel('幅值');
    title('单位斜坡输入响应');
    grid on;
end