% Przedmiot: Techniki Obliczeniowe 
% Kierunek studi�w: Mechatronika 
% Semestr: 2
% Rok akademicki: 2019/2020
% Data (dzie�-miesi�c-rok): <<25-06-2020>>
%
% Imi�:             <<Aleksander>>
% Nazwisko:         <<Rutkiewicz>>
% Numer albumu ZUT: <<46764


example_a = input('prosz� poda� d�ugo�� elipy =');
example_b = input('prosz� poda� d�ugo�� elipy =');
example_m = input('prosz� poda� wspo�czynnik kierunkowy prostej =');
example_c = input('prosz� poda� wsp�czynnik C prostej =');
% reczne wprowadzenie zmiennych danych

figure(1);
clf;

seg_ellipse(example_a, example_b, example_m, example_c)

function seg_ellipse(a, b, m, c)% okre�lenie funkcji oraz jej zmiennych

line = @(x) m .* x + c;

ellipse_hi = @(x)  sqrt((1 - x.^2 ./ a^2) .* b.^2); %Opisanie  "g�rnej" cz�sci elipy
ellipse_lo = @(x) -sqrt((1 - x.^2 ./ a^2) .* b.^2); %Opisanie  "dolnej" cz�sci elipy

N = 10000;
x = linespace(-a, +a, N); %kolejne wartosci od najmniejszej do najwiekszej drobno wypisane

plot(x, line(x), x, ellipse_hi(x), x, ellipse_lo(x)); %nakre�lenie rysunku elipy i prostej

x0 = [];

for i = 2 : N %p�tla szukajaca miejsca zerowego w g�rnej cz�sci elipsy
    try
        z = fzero(@(x) ellipse_hi(x) - line(x), [x(i-1), x(i)]);
        x0 = [x0, z];
    catch
    end
end

    
    for i = 2 : N %p�tla szukajaca miejsca zerowego w dolnej cz�sci elipsy
    try
        z = fzero(@(x) ellipse_lo(x) - line(x), [x(i-1), x(i)]);
        x0 = [x0, z];
    catch
    end
    end
    
    x0 = unique(sort(x0)); % x0 przechowuje unikatowe punkty przeciecia
    
    hold all;
    plot(x0, line(x0), 'or') %nakre�lenie funkcji z zaznaczonymi miejscami
    
    
    
end
   




