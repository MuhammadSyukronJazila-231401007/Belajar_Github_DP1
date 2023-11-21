program soalNo3;

uses crt;

type matkul = record
    nama_matkul,nilai: string;
    sks: integer;
    skor: real;
end; 

type mahasiswa = record
    nama,nim: string;
    jmlh_matkul,total_sks: integer;
    total_skor,ip:real;
    matakuliah: array[1..99] of matkul;
end;

var 
i,n,j,baris:integer;
data_mahasiswa: array[1..99] of mahasiswa; 

begin
clrscr;
    write('Masukkan banyak mahasiswa : ');readln(n);
    writeln;
    for i:= 1 to n do      //INPUT DATA MAHASISWA
    begin
        writeln('Input data Mahasiswa ',i);
        with data_mahasiswa[i] do 
        begin
            write('Masukkan Nama anda  : ');readln(nama);
            write('Masukkan NIM anda   : ');readln(nim);
            write('Masukkan jumlah mata kuliah yang diambil : ');readln(jmlh_matkul);
            writeln;
            for j:= 1 to jmlh_matkul do
            begin
                with matakuliah[j] do 
                begin
                    write('Masukkan mata kuliah  : ');readln(nama_matkul);
                    write('Masukkan jumlah SKS   : ');readln(sks);
                    write('Masukkan nilai anda   : ');readln(nilai);
                    nilai := UPCASE(nilai);
                    case nilai of 
                    'A': skor:= sks * 4;
                    'B+': skor:= sks * 3.5;
                    'B': skor:= sks * 3;
                    'C+': skor:= sks * 2.5;
                    'C': skor:= sks * 2;
                    'D': skor:= sks * 1;
                    'E': skor:= sks * 0;
                    end;
                    total_sks:= total_sks + sks;
                    total_skor:= total_skor + skor;
                end;
                writeln;
            end;
            ip:= total_skor / total_sks;
        end;
        writeln('------------------------------');
    end;

    for i:= 1 to n do   //TAMPILKAN DATA MAHASISWA
    begin
        clrscr;
        with data_mahasiswa[i] do 
        begin
            writeln('   Nama  : ',nama);
            writeln('   NIM   : ',nim);
            writeln;
            writeln('   ---------------------------------------------------------');
            writeln('   | No | Mata Kuliah               | SKS | Nilai  | Skor  |');
            writeln('   ---------------------------------------------------------');
            baris:= 7;
            for j:= 1 to jmlh_matkul do 
            begin
                with matakuliah[j] do 
                    begin
                    writeln('   |    |                           |     |        |       |');
                    gotoxy(6,baris);write(j);
                    gotoxy(11,baris);write(UPCASE(nama_matkul));
                    gotoxy(39,baris);write(sks);
                    gotoxy(45,baris);write(nilai);
                    gotoxy(54,baris);writeln(skor:0:1);
                    baris:= baris+1;
                    end;
            end;
            baris += 1;
            writeln('   ---------------------------------------------------------');
            writeln('   |  TOTAL                                        |       |');
            gotoxy(54,baris);writeln(total_skor:0:2);
            writeln('   ---------------------------------------------------------');
            writeln('   Jumlah SKS      : ',total_sks);
            writeln('   IP              : ',ip:0:2);
            writeln;
            write('   Tekan sembarang tombol untuk melihat data selanjutnya..');readkey();
        end;           
    end;

end.