function plot_line(l)

    a = l(1);
    b = l(2);
    c = l(3);

    if b ~= 0
        x = linspace(0, 4000, 50);
        y = -(a*x + c) / b;
        plot(x, y, 'k', 'Linewidth', 4)
    else if a ~= 0
        y = linspace(0, 4000, 50);
        x = -(b*y + c) / a;
        plot(x, y, 'k', 'Linewidth', 4)
    end

end