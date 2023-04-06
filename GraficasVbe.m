%Graficas
close all %cierro todas las graficas anteriroes
i=1;
for str = ["LAB1-PARTE1-1ma.txt" "LAB1-PARTE1-10ua.txt" "LAB1-PARTE1-100ua.txt"]
%v = ['LAB1-PARTE1-1ma.txt' 'LAB1-PARTE1-10ua.txt' 'LAB1-PARTE1-100ua.txt']
    Tab = readtable(str); %Cargo los datos en una tabla
    Vbe_vs_T = table2array(Tab); %convierto la tabla en una matriz
    Temp = Vbe_vs_T(:,1); %Columnas de temperatura
    VBE = Vbe_vs_T(:,3)+5; % VBE para graficar
    %plot(Temp , VBE); %grafica
    %str[i-1]
    p = polyfit(Temp, VBE, 1); %ajuste lineal de grado 1
    a = -p(1) % Pendiente de la recta
    VT0 = p(2); % Cruce a Temp 0°
    VG0 = VT0 + a*273; %Tension de bandgap
    VBE_ajust_lin = VT0 - a*Temp ;
    
    tit = ["Comparacion @1ma" "Comparacion @10ua" "Comparacion @100ua"];

%     figure();
%     hold on
%     plotSimulacion = plot(Temp, VBE);
%     plotMinimosCuadrados = plot(Temp, VBE_ajust_lin);
%     legend([plotSimulacion plotMinimosCuadrados],{'VBE_{simulacion}', 'VBE_{Ajuste Lineal}'});
%     title(tit(i));
%     ylabel('V_{BE}(V)');
%     xlabel('Temperatura (ºC)');
%     hold off
    
    if i <= 2
        subplot(2,2,i);
        hold on
        plotSimulacion = plot(Temp, VBE);
        plotMinimosCuadrados = plot(Temp, VBE_ajust_lin);
        legend([plotSimulacion plotMinimosCuadrados],{'VBE_{simulacion}', 'VBE_{Ajuste Lineal}'});
        title(tit(i));
        ylabel('V_{BE}(V)');
        xlabel('Temperatura (ºC)');
        hold off
    elseif i==3
        subplot(2,2,[3,4]);
        hold on
        plotSimulacion = plot(Temp, VBE);
        plotMinimosCuadrados = plot(Temp, VBE_ajust_lin);
        legend([plotSimulacion plotMinimosCuadrados],{'VBE_{simulacion}', 'VBE_{Ajuste Lineal}'});
        title(tit(i));
        ylabel('V_{BE}(V)');
        xlabel('Temperatura (ºC)');
        hold off
    end
    i=i+1;

end

