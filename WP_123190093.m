%mengambil data dari .xlsx
opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = ([3:5 8]);
data = readmatrix('Real estate valuation data set.xlsx', opts);

x = data(1:50,:); %data rating kecocokan
k = [0,0,1,0]; %atribut tiap kriteria, 1= benefit/keuntungan, dan 0= cost/biaya
w = [3,5,4,1]; %Nilai bobot tiap kriteria (1=sangat buruk, 2=buruk, 3=cukup, 4=tinggi, 5=sangat tinggi)

%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%tahapan ketiga, proses perangkingan
V= S/sum(S);
[rank numb] = sort(V,'descend'); %mengurutkan data berdasarkan yang paling direkomendasikan
for a=1:5,
    %output
    disp(['Alternatif terbaik ', num2str(a),' adalah data ke - ', num2str(numb(a)),' dengan nilai V = ', num2str(rank(a))])
end;
