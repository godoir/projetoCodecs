function result = func_TX(vectorAC,vectorDC,catAC,catDC,huffAC,huffDC)
k=1;
counter = 0;
result = [];

%Inicia convers�o bin�ria
for i=1:length(vectorDC) %Bloco que realiza convers�o bin�ria dos elementos DC
    if counter>0 && vectorDC(i)>=0
        result=[result; huffmanenco(0,huffAC); fliplr(de2bi(counter,6))'];
        result=[result; huffmanenco(catDC(i),huffDC); fliplr(de2bi(vectorDC(i)))'];
        counter = 0;
    elseif counter>0 && vectorDC(i)<0
        positive = vectorDC(i)*(-1);
        aux = fliplr(de2bi(positive));
        for m=1:length(aux)
            if aux(m) == 0
                aux(m) = 1;
            else
                aux(m) = 0;
            end
        end
        result=[result; huffmanenco(0,huffAC); fliplr(de2bi(counter,6))'];
        result=[result; huffmanenco(catDC(i),huffDC); aux'];
        counter =0;
    elseif counter == 0 && vectorDC(i)>=0
        result=[result; huffmanenco(catDC(i),huffDC); fliplr(de2bi(vectorDC(i)))'];
    elseif counter == 0 && vectorDC(i)<0
        positive = vectorDC(i)*(-1);
        aux = fliplr(de2bi(positive));
        for m=1:length(aux)
            if aux(m) == 0
                aux(m) = 1;
            else
                aux(m) = 0;
            end
        end
        result=[result; huffmanenco(catDC(i),huffDC); aux'];
    end
    
    for j=k:k+62 %Nested loop que gerencia a convers�o bin�ria dos termos AC e contagem dos zeros (vari�vel counter)
        if counter==0 && vectorAC(j) == 0
            counter = counter + 1;
        elseif counter > 0 && vectorAC(j)==0
            counter = counter + 1;
        elseif counter > 0 && vectorAC(j)>=0
            result=[result; huffmanenco(0,huffAC); fliplr(de2bi(counter,6))'];
            result=[result; huffmanenco(catAC(j),huffAC); fliplr(de2bi(vectorAC(j)))'];
            counter = 0;
        elseif counter > 0 && vectorAC(j)<0;
            positive = vectorAC(j)*(-1);
            aux = fliplr(de2bi(positive));
            for m=1:length(aux)
                if aux(m) == 0
                    aux(m) = 1;
                else
                    aux(m) = 0;
                end
            end
            result=[result; huffmanenco(0,huffAC); fliplr(de2bi(counter,6))'];
            result=[result; huffmanenco(catAC(j),huffAC); aux'];
            counter =0;
        elseif counter==0 && vectorAC(j)>=0
            result=[result; huffmanenco(catAC(j),huffAC); fliplr(de2bi(vectorAC(j)))'];
        elseif counter==0 && vectorAC(j)<0
            positive = vectorAC(j)*(-1);
            aux = fliplr(de2bi(positive));
            for m=1:length(aux)
                if aux(m) == 0
                    aux(m) = 1;
                else
                    aux(m) = 0;
                end
            end
            result=[result; huffmanenco(catAC(j),huffAC); aux'];
        end
    end
    k=k+63;
end
if counter>0
    result=[result; huffmanenco(0,huffAC); fliplr(de2bi(counter,6))'];
end
end