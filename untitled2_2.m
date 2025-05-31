    den1 = [1 0]; % s
    den2 = [1 5]; % s + 5
    den3 = [1 6]; % s + 6
    den4 = [1 2 2]; % s^2 + 2s + 2
    
    
    % 计算分母多项式：s(s + 5)(s + 6)(s^2 + 2s + 2)
    den_open = conv(den1, conv(den2, conv(den3, den4)));

    k_values = [1, 5, 10, 20]; % 数组参数
    zeros(1, length(k_values));


for i = 1:length(k_values)
    k = k_values(i)
    % 使用 k 进行计算
    num_open = [1*k 3*k] % 分子多项式：s + 3

    G_open=tf(num_open,den_open)
    G_closed=feedback(G_open,1);

p = G_closed.Denominator{1}


root_num=roots(p)

  is_stable = all(real(root_num)< 0);
      

         if all(real(root_num) < 0)
            stability(i) = 1;
        else
            stability(i) = 0;
         end




     figure;

  real_parts = real(p);
    imag_parts = imag(p);
    
    plot(real_parts, imag_parts, 'b.');
    xlabel('实部');
    ylabel('虚部');
    title(['k = ' num2str(k) ', 闭环极点分布']);
    grid on;
    axis equal;





end






for i = 1:length(k_values)
        if stability(i)
            fprintf('k = %2d: 系统稳定\n', k_values(i));
        else
            fprintf('k = %2d: 系统不稳定\n', k_values(i));
        end
end

