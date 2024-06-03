# Revisão
## Revisão SOP
### Bit e Byte
- Bit (Binário, 0 ou 1)
- Byte (8 Bits)
<p align="center">
<img src="https://networkencyclopedia.com/wp-content/uploads/2023/06/Relationship-between-Bits-and-Bytes-1024x576.webp" style="width:500px">
</p>

### Binário
<p align="center">
<img src="https://www.cadcobol.com.br/mecaweb_num_bin_5.png" style="width:500px">
</p>

|Bin - Dec | Dec - Bin|
|-|:-:|
| <img src="https://cecead.com/wp-content/uploads/2019/07/Bin%C3%A1rio-em-Decimal.gif" style="width:500px">| <img src="https://opiratadigital.files.wordpress.com/2014/04/divisao2.png" style="width:500px">|

### Héxadecimal
<p align="center">
<img src="https://www.cadcobol.com.br/mecaweb_num_hex_2.png" style="width:500px">
</p>

|Hex - Dec | Dec - Hex|
|-|:-:|
| <img src="https://mathmonks.com/wp-content/uploads/2022/08/Hexadecimal-to-Decimal.jpg" style="width:500px">| <img src="https://www.cadcobol.com.br/mecaweb_conv_dh_1.png" style="width:500px">|

### Héx e Bin

<p align="center">
<img src="https://www.cadcobol.com.br/mecaweb_conv_bh.png" style="width:500px">
</p>

|Hex - Bin | Bin - Hex|
|-|:-:|
| <img src="https://pt.convertbinary.com/wp-content/uploads/hexadecimal-para-binario-passo-3-1.png" style="width:500px">| <img src="https://pt.convertbinary.com/wp-content/uploads/converta-binario-para-hexadecimal-5.png" style="width:500px">|

### Virtual Box
- Oque é?
    - O VirtualBox é um programa de emulação de sistemas operacionais com o qual o usuário pode ter em um único PC uma série de sistemas, sem riscos para sua máquina.
- Para que é usado?
    - Os desenvolvedores usam a VirtualBox para fornecer código mais rápido, testando aplicações em diferentes sistemas operacionais e versões.


## Revisão LOP

### Programação em C

|Exercícios|
|-|
|***Exercício 1*** _Crie um programa em C que lê o conteúdo de dois arquivos de texto e os mescla em um terceiro arquivo, alternando as linhas de cada um._|
``` 
#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *arquivo1, *arquivo2, *arquivo3;
    char linha[100];
    int alternar = 0; // Variável para alternar entre os arquivos

    // Abre os arquivos de entrada
    arquivo1 = fopen("arquivo1.txt", "r");
    arquivo2 = fopen("arquivo2.txt", "r");
    
    // Verifica se os arquivos foram abertos corretamente
    if (arquivo1 == NULL || arquivo2 == NULL) {
        printf("Erro ao abrir os arquivos de entrada.");
        return 1;
    }

    // Abre o arquivo de saída
    arquivo3 = fopen("arquivo3.txt", "w");

    // Mescla os arquivos
    while (1) {
        if (alternar == 0) {
            if (fgets(linha, sizeof(linha), arquivo1) != NULL) {
                fputs(linha, arquivo3);
            } else {
                break;
            }
            alternar = 1;
        } else {
            if (fgets(linha, sizeof(linha), arquivo2) != NULL) {
                fputs(linha, arquivo3);
            } else {
                break;
            }
            alternar = 0;
        }
    }

    // Fecha os arquivos
    fclose(arquivo1);
    fclose(arquivo2);
    fclose(arquivo3);

    printf("Arquivos mesclados com sucesso.\n");

    return 0;
}```

|***Exercício 5*** _Crie um programa em C que lê um arquivo contendo código-fonte em C e remove todos os comentários, salvando o resultado em outro arquivo._|
```
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

int main() {
	
	setlocale(LC_ALL,"");
	
    FILE *entrada, *saida;
    char caractere, proximo;

    // Abre o arquivo de entrada para leitura
    entrada = fopen("codigofonte.c", "r");
    if (entrada == NULL) {
        printf("Erro ao abrir o arquivo de entrada.");
        return 1;
    }

    // Abre o arquivo de saída para escrita
    saida = fopen("codigo_sem_comentarios.c", "w");
    if (saida == NULL) {
        printf("Erro ao abrir o arquivo de saída.");
        fclose(entrada);
        return 1;
    }

    // Processa o arquivo de entrada
    while ((caractere = fgetc(entrada)) != EOF) {
        if (caractere == '/') {
            proximo = fgetc(entrada);
            if (proximo == '/') { // Comentário de linha
                while ((caractere = fgetc(entrada)) != '\n' && caractere != EOF);
            } else if (proximo == '*') { // Comentário de bloco
                do {
                    while ((caractere = fgetc(entrada)) != '*') {
                        if (caractere == EOF) {
                            printf("Erro: Comentário de bloco não fechado.\n");
                            fclose(entrada);
                            fclose(saida);
                            return 1;
                        }
                    }
                    proximo = fgetc(entrada);
                } while (proximo != '/');
            } else {
                fputc(caractere, saida);
                fputc(proximo, saida);
            }
        } else {
            fputc(caractere, saida);
        }
    }

    // Fecha os arquivos
    fclose(entrada);
    fclose(saida);

    printf("Comentários removidos com sucesso.\n");

    return 0;
}
```

## Revisão AIOT

### Camadas do modelo OSI

<p align="center">
<img src="https://scontent-gru2-2.xx.fbcdn.net/v/t1.6435-9/74420285_1836309606512868_6210110560659308544_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_ohc=4sTQp9PxBgoAX-cHECO&_nc_ht=scontent-gru2-2.xx&oh=00_AfC1wotJ2ZCfyu_4VfxW5UYIRol4Eh77PVV9Y2vY5IFf9w&oe=6632018D" style="width:700px">
</p>

### Topologia de redes

<p align="center">
<img src="https://4.bp.blogspot.com/-l2Iaz9_7H9U/Ue06hhLFVDI/AAAAAAAAABs/8hPN49YKGGo/s1600/tabela.png" style="width:700px">
</p>

- Alguns exemplos 

<p align="center">
<img src="https://anlix.io/wp-content/uploads/2022/02/topologia-exempllo-1024x685.png" style="width:700px">
</p>

### Redes

<p align="center">
<img src="https://webpovoa.com/wp-content/uploads/2016/03/tabela.png" style="width:700px">
</p>

- 2 partes de 128 hosts
    - 1º x.x.x.0 - x.x.x.127
    - 2º x.x.x.128 - x.x.x.225

- 4 partes de 64 hosts
    - 1º x.x.x.0 - x.x.x.63
    - 2º x.x.x.64 - x.x.x.127
    - 3º x.x.x.128 - x.x.x.191
    - 4º x.x.x.192 - x.x.x.225




### IPv4 e IPv6
- O IPv6 foi construido pois o IPv4 já estrava ultrapassando e era necessário um protocolo de internet mais potênte

<p align="center">
<img src="https://academy.avast.com/hubfs/New_Avast_Academy/Fixed%20Images%20with%20text%20all%20locales/IPv4-vs-IPv6_PT.svg" style="width:700px">
</p>
